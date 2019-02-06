/**
 * @File Name          : AccountUtils.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 2/6/2019, 3:29:08 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    2/6/2019, 3:11:27 PM   codeme.jai@gmail.com     Initial Version
**/
public with sharing class AccountUtils {
    public static List<Account> accountsByState(String stateAbbreviation){
        List<Account> listOfAccounts;
        try {
            listOfAccounts = [SELECT Id,Name FROM Account WHERE BillingState=:stateAbbreviation];
            //List<List<SObject>> listOfAccounts = [FIND :stateAbbreviation IN ALL FIELDS RETURNING Account(ID, Name)];
        } catch (Exception ex) {
           System.debug(ex.getMessage());           
        }
        return listOfAccounts;
    }
}