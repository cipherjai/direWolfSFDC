/**
 * @File Name          : InvoiceTrigger.trigger
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 13/3/2019, 8:39:16 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    13/3/2019, 8:13:09 PM   codeme.jai@gmail.com     Initial Version
**/
trigger InvoiceTrigger on Invoice__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
    // If it is before insert 
    if(Trigger.isBefore) {  
        System.debug('Inside Before Trigger');
        if(Trigger.isInsert) {
            System.debug('Inside Insert Trigger');
        }
    }

    if(Trigger.isAfter){
        System.debug('Inside After Trigger');
        if(Trigger.isInsert){
            System.debug('Inside Insert Trigger');
        }
        if(Trigger.isUpdate){
            System.debug('Inside Update Trigger');
        }
        if(Trigger.isDelete){
            System.debug('Inside Delete Trigger');
        }
    }
}