/**
 * @File Name          : AccountHandler.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 1/31/2019, 6:05:21 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    1/31/2019, 6:03:20 PM   codeme.jai@gmail.com     Initial Version
**/
public with sharing class AccountHandler {
    public static Account insertNewAccount(String nameOfAccount){
        Account accountOne = new Account(Name=nameOfAccount);
        try {
           insert accountOne;
           return accountOne;
        } catch (DMLException dmlException) {
           return null;
        }
    }
}