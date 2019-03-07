/**
 * @File Name          : SampleGetHttpReq.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 7/3/2019, 1:17:21 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    7/3/2019, 12:24:39 PM   codeme.jai@gmail.com     Initial Version
**/
public with sharing class SampleGetHttpReq {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
    request.setMethod('GET');
    HttpResponse response = http.send(request);

    // If the request is successful, parse the JSON response

    if(response.getStatusCode() == 200){
        //Deserialize the JSON String into collection of primitive Data Type

        Map<String, Object> results = Map<String, Object>() JSON.deserializeUntyped(response.getBody());

        List<Object> animals =  (List<Object>) results.get('animals');
        System.debug('Received the following animals: ');
        for(Object animal:animals){
            System.debug(animal);
        }
    }
}

