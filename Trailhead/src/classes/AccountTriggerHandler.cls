/**
 * @File Name          : AccountTriggerHandler.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 2/7/2019, 12:32:27 AM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    2/6/2019, 8:40:34 PM   codeme.jai@gmail.com     Initial Version
**/
public with sharing class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> listOfAccount){
        int flag = 0;
        String nameOfAcc;
        for (acc : listOfAccount) {
           if(acc.ShippingState != acc.BillingState){
               flag = 1;
               nameOfAcc = acc.Name;
               break;
           }
        }
        if (flag == 0) {
           insert listOfAccount;
        }
        else {
           System.debug('ShippingState field does not match with BillingState with account name -- > ' + nameOfAcc);
        }
    }
}