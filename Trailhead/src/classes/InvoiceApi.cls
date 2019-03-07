/**
 * @File Name          : InvoiceApi.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 6/3/2019, 3:47:09 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    6/3/2019, 3:06:13 PM   codeme.jai@gmail.com     Initial Version
**/
@RestResource(urlMapping = 'www.api.in')
global class InvoiceApi {
    // Declaring the response
    global class IvoiceServiceResponse{
        global Integer statusCode{get; set;}
        global String message{get; set;}
        global String leadId{get; set;}
    }

    @HttpPost
    global static IvoiceServiceResponse createInvoiceServiceResponse

    
}