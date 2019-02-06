/**
 * @File Name          : AccountTrigger_Test.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 2/6/2019, 6:00:09 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    2/6/2019, 6:00:09 PM   codeme.jai@gmail.com     Initial Version
**/
@istest
private with sharing class AccountTrigger_Test {
    @istest
    static void TestCreateNewAccountInBulk(){
        List<Account> accts = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
           Account acct = new Account(Name='Test Account' + i);
           accts.add(acct);
        }

        Test.startTest();
        insert accts;
        Test.stopTest();

        List<Account> verifyAccts = [Select Id FROM Account];
        System.assertEquals(200, verifyAccts.size());

        List<Opportunity> verifyOpportunities = [Select Id FROM Opportunity];
        System.assertEquals(200, verifyOpportunities.size());
    }
}