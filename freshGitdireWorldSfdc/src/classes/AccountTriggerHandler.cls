/**
 * @File Name          : AccountTriggerHandler.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 2/7/2019, 12:57:42 AM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    2/6/2019, 8:40:34 PM   codeme.jai@gmail.com     Initial Version
**/
public with sharing class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> liOAcc){
        List<Account> newAcc = new List<Account>();
        for(Account acc : liOAcc){
            if(acc.ShippingState == null || ( acc.BillingState != null && acc.ShippingState.compareTo(acc.BillingState) != 0)) {
             	   acc.ShippingState = acc.BillingState;
            }
            newAcc.add(acc);
        }
        /*try{
            insert newAcc;
        }
        catch(DmlException dmlExc){
            System.debug('Inside Handler');
        }*/
    }
}