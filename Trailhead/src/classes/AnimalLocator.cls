/**
 * @File Name          : AnimalLocator.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 8/3/2019, 3:32:43 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    8/3/2019, 1:45:12 PM   codeme.jai@gmail.com     Initial Version
**/
public with sharing class AnimalLocator {
    public static String getAnimalNameById(Integer animalId){
        Http http = new Http();
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/:id');
        httpRequest.setMethod('GET');
        
        HttpResponse  httpResponse = http.send(httpRequest);
        
        if (httpResponse.getStatus() == '200') {
           Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(httpResponse.getBody());
           
        }
        return 'Hello';
    }
}