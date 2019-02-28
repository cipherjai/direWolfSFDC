/**
 * @File Name          : AddRelatedRecord.trigger
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 2/14/2019, 11:38:02 AM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    2/14/2019, 11:38:02 AM   codeme.jai@gmail.com     Initial Version
**/
trigger AddRelatedRecord on Account (after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();

    Map<Id, Account> accountsWithOpportunities = new Map<Id, Account>(
        [Select Id,(Select Id FROM Opportunities) FROM Account WHERE Id IN : Trigger.New]
    );

    for(Account a : Trigger.New){
        System.debug('accountsWithOpportunities.get(a.Id).Oppotunities.size()= ' + accountsWithOpportunities.get(a.Id).Opportunities.size());
        if(accountsWithOpportunities.get(a.Id).Opportunities.size() == 0){
            oppList.add(new Opportunity(Name = a.Name + ' Opportunity',
                                        StageName='Prospecting',
                                        CloseDate=System.today().addMonths(1),
                                        AccountId=a.Id));
        }
    }
    if(oppList.size() > 0){
        insert oppList;
    }
}
