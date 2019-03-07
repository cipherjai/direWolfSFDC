/**
 * @File Name          : SamplePostHttpReq.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 7/3/2019, 2:06:12 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    7/3/2019, 1:30:58 PM   codeme.jai@gmail.com     Initial Version
**/
public with sharing class SamplePostHttpReq {
    
    public void mockClt(){
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
    request.setMethod('POST');
    request.setHeader('Content-Type', 'application/json;charset=UTF-8');
    request.setBody('{"name":"Mighty Moose"}');
    HttpResponse response = http.send(request);

    if(response.getStatusCode() != 201){
        System.debug('The Status Code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
    }else {
       System.debug(response.getBody());
    }
    }
    
}