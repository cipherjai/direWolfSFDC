/**
 * @File Name          : AnimalsCallout.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 7/3/2019, 2:36:06 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    7/3/2019, 2:27:50 PM   codeme.jai@gmail.com     Initial Version
**/
public with sharing class AnimalsCallout {
    public static HttpResponse makeGetCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint();
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() ==  200){
            Map<String, Object> results = (Map<String, Object>JSON.deserializeUntyped(response.getBody()));
            List<Object> animals = (List<Object) results.get('animals');
            System.debug('Received the following animals:');
            for (Object animal: animals) {
               System.debug(animal);
            }
        }
    return response;
    }

    public static HttpResponse makePostCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty moose"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        return response;
    }
}