/**
 * @File Name          : AnimalsCalloutsTest.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 7/3/2019, 4:48:54 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    7/3/2019, 4:37:16 PM   codeme.jai@gmail.com     Initial Version
**/
@isTest
public with sharing class AnimalsCalloutsTest {
    @isTest static void testGetCallout(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);
        // Call method to test
        HttpResponse result = AnimalsCallouts.makeGetCallout();
        // Verify mock response is not null
        System.assertNotEquals(null,result,
            'The callout returned a null response.');
        // Verify status code
        System.assertEquals(200,result.getStatusCode(),
        'The status code is not 200.');
        // Verify content type   
        System.assertEquals('application/json;charset=UTF-8', result.getHeader('Content-Type'), 'The content type value is not expected.');  
        // Verify the array contains 3 items     
        Map<String, Object> results = (Map<String, Object>) 
            JSON.deserializeUntyped(result.getBody());
        List<Object> animals = (List<Object>) results.get('animals');
        System.assertEquals(3, animals.size(),
        'The array should only contain 3 items.'); 
    }
}