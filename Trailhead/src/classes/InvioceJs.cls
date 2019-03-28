/**
 * @File Name          : InvioceJs.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 14/3/2019, 1:03:07 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    14/3/2019, 12:39:08 PM   codeme.jai@gmail.com     Initial Version
**/
global with sharing class InvoiceJs {
    
    // empty constructor
    public InvioceJs(){}
    
    // RemoteAction method
    @RemoteAction
    global static list<Invoice__c> getInvoice(){
        List<Invoice__c> invoices = [SELECT id,name FROM Invoice__c limit 5];
        if(invoices != null && !invoices.isEmpty()){
            return invoices;
        }
        else {
           return new list<Invoice__c>();
        }
    }
}