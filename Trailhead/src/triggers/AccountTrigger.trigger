/**
 * @File Name          : AccountTrigger.trigger
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 2/7/2019, 12:16:15 AM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    2/6/2019, 4:33:17 PM   codeme.jai@gmail.com     Initial Version
**/
trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if (Trigger.isAfter && Trigger.isInsert) {
        try {
            System.debug('Inside Account Trigger -- Creating Opportunity');
            AccountHandler.CreateNewOpportunity(Trigger.New); 
        } catch (Exception ex) {
           System.debug('Exception - >' + ex.getMessage());
        }
    }

    if(Trigger.isBefore && Trigger.isInsert){
        try {
            System.debug('Inside before Trigger -- Inserting Account');
            AccountTriggerHandler.CreateAccounts(Trigger.New);
        } catch (Exception ex) {
           System.debug('Exception - > ' + ex.getMessage());
        }        
    }
}

