/**
 * @File Name          : CreateInvoice.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 7/3/2019, 10:21:37 AM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    6/3/2019, 5:18:48 PM   codeme.jai@gmail.com     Initial Version
**/
public class CreateInvoice {
    String accessToken = '<access_token>';    
    String endPoint = 'https://sandbox-quickbooks.api.intuit.com/v3/company/:companyId/account';
    // https://quickbooks.api.intuit.com/v3/company/123146335979929/invoice?minorversion=4
    HttpRequest httpReq = new HttpRequest();
    httpReq.setMethod('POST');
    httpReq.setEndPoint(endPoint);

    httpReq.setHeader('Accept','*/ *');
    httpReq.setHeader('Content-Type','application/json');
    httpReq.setHeader('charset','UTF-8');
    httpReq.setHeader('Authorization' , 'Bearer '+accessToken);

    Http http = new Http();
    HttpResponse httpRes = new HttpResponse();
    try {
        httpRes = http.send(httpReq);
    } catch (System.CalloutException e) {
       System.debug('Callout error : ' + e);
       System.debug(httpRes.toString());
    }
    

}