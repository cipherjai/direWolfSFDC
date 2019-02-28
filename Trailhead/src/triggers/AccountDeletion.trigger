/**
 * @File Name          : AccountDeletion.trigger
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 2/14/2019, 12:31:26 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    2/14/2019, 12:31:26 PM   codeme.jai@gmail.com     Initial Version
**/
trigger AccountDeletion on Account (before delete, after insert, after update, after delete, after undelete) {
    for(Account a : [SELECT Id FROM Account
    WHERE Id IN (SELECT AccountId FROM Opportunity) AND
    Id IN :Trigger.old]){
        Trigger.oldMap.get(a.Id).addError('Cannot delete account with related opportunities.');
    }
}