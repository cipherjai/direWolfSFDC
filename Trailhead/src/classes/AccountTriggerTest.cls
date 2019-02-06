/**
 * @File Name          : AccountTriggerTest.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 2/7/2019, 12:25:15 AM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    2/7/2019, 12:25:15 AM   codeme.jai@gmail.com     Initial Version
**/
@isTest
public with sharing class AccountTriggerTest {
    @isTest
    private static void checkForAccountInsertions(){
        List<Account> accts = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
        Account acct = new Account(Name='Test Account' + i, BillingState='CA', ShippingState='CA');
        accts.add(acct);
        }

        Test.startTest();
        insert accts;
        Test.stopTest();

        List<Account> verifyAccts = [Select Id FROM Account];
        System.assertEquals(200, verifyAccts.size());
    }
}