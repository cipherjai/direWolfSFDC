/**
 * @File Name          : AccountHandler.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 2/6/2019, 5:33:53 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    2/6/2019, 4:24:46 PM   codeme.jai@gmail.com     Initial Version
**/
public with sharing class AccountHandler {
    public static void CreateNewOpportunity(List<Account> accts){
        List<Opportunity> opp = new List<Opportunity>();
        for (Account a : accts) {
           Opportunity newOpp = new Opportunity();
           newOpp.Name = a.Name + ' Opportunity';
           newOpp.AccountId = a.Id;
           newOpp.StageName = 'Prospecting';
           newOpp.CloseDate = System.Today().addMonths(1);
           opp.add(newOpp);           
        }
        if(opp.size() > 0){
            insert opp;
        }        
    }
}