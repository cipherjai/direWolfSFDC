/**
 * @File Name          : KM_RabbitMQConsumerAPI.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 1/29/2019, 7:52:42 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    1/29/2019, 7:52:42 PM   codeme.jai@gmail.com     Initial Version
**/
@RestResource(urlMapping ='/KMCSRest/salesforce/rabbitMQ/*')
global with sharing class KM_RabbitMQConsumerAPI {
    
    //Declaring the Response class for API call
    global class RabbitMQConsumerResponse{
        global Integer statusCode {get;set;}
        global String errorMessage {get; set;}
    }
    
    @HttpPost
    global static RabbitMQConsumerResponse rabbitMQConsumer(){
        //Declaring structure to be returned as per the method declaration 
        RabbitMQConsumerResponse rabbitMQresponse = new RabbitMQConsumerResponse();
        try{
            RestRequest req = RestContext.request;
            Blob body = req.requestBody;
            String responseBody = body.toString(); //EncodingUtil.base64Decode(EncodingUtil.base64Encode(body)).toString();
            //system.debug('body-->'+body);
            //system.debug('s-->'+body.toString());
            responseBody = responseBody.replace('"from":', '"sender":');
            responseBody = responseBody.replace('\\\\', ',');
            //responseBody = responseBody.replace('\"artifactType\":\"EMAIL\",', '');
            //system.debug('responseBody-->'+responseBody);
            KM_RabbitMQWrapper rabbitMQwrapper = KM_RabbitMQWrapper.parse(responseBody);
            
            //Sending dms data to the consumer
            KM_rabbitMQconsumer.consumerQueue(rabbitMQwrapper.dmsProperties);
            
            rabbitMQresponse.statusCode = 200;
            rabbitMQresponse.errorMessage = 'Passed';
        }
        Catch(Exception ex){
            //Assigning status code and error message for exception  
            rabbitMQresponse.statusCode = 500;
            rabbitMQresponse.errorMessage = ex.getMessage();
        }
        return rabbitMQresponse;
    }
}