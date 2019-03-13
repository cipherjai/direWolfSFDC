/**
 * @File Name          : QB_Invoice_Post.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 11/3/2019, 3:10:14 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    8/3/2019, 11:48:29 AM   codeme.jai@gmail.com     Initial Version
**/
public class QB_Invoice_Post {


    public static HttpResponse invoiceHttpPostRequest(String reqBody){
        
        String requBody = '{"Line": [{"Amount": 100.00,"DetailType": "SalesItemLineDetail","SalesItemLineDetail":{"ItemRef": {"value": "1","name": "Services"}}}],"CustomerRef": {"value": "1"}}';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/123146341944519/invoice?minorversion=4');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Host', 'sandbox-quickbooks.api.intuit.com');
        request.setHeader('Content-Length', '278');
        request.setHeader('intuit_tid', 'idg-a1yteiiew230qoady43iexyi-31815573');
        request.setHeader('Authorization', 'Bearer ' + 'eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..BZZDjCZ5nJBksQRkXM9S-g._ZtjjE4zFbNY687arNM0wm80UcsZpkrRVMrhag4XXm-zm-TMsPenIX8JWPUQsgsLHK6Y1NJXvJWDv-3JIbglX_LbZqLAyYefTn4v9MQagL9he715g63er9pkYDpKVWrokjkfesepO0h13yXivEcQ0qHfmeDL9DfZkmXZ7Yb8pb0JKtB-OH1haRE335hphErC9PNYXuRlXXY0p9GXej2VvnZ3Ti04U8QS1bmsGVKYToZVcZHS30WcetO5Ulzv02nj5lWWWgRMdUcvPHLfNgcA1ADjRXtn7w2d482BoAdD4df2_Z-2_4mOMMxfgbAjaPqR0zsVlOwBZa96oflKICpxLN31r41VV7gIohDhjL0Z4y7WmuU7UMQS76mSRf9rpPr1xxzxUUiU93R_cPIRMw8LOkrn39fzOeg9dBFSYIO_x3y46v4ktAI90oqqpHDMluozloBnsNSSVL55yGlqMFZFOWVij3U3yEemy9qn_U9j2jwHebD_u_D6I_i-AL4ppJS1d0_GgLBz15tWpdcQAmSJ97ngYvCgkwNOjH7CL30Cawk5J0mTytjbyeqYo9lnnyy18HEM0VTDOnLdbEi-fVP1zj1yb6Fn-59oV8AZsXwgqIsZD8W8aafjWo1Z86OrX_643vJmIRZ_i3klwHj36QYmxM6FlGt7r7-1hUECAdT5l77cTZjUQ5QShECk7G_SRRsy.oVF3S579vVYWBhZLt_2Ecg');
        request.setBody(requBody);

        HttpResponse httpResponse = http.send(request);
        if(httpResponse.getStatusCode() != 200){
            System.debug('The status code returned was not expected: ' + httpResponse.getStatusCode() + ' ' + httpResponse.getStatus());
        }else {
            System.debug(httpResponse.getBody());
        }
        return httpResponse;
    }
    
}