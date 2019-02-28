/**
 * @File Name          : HelloWorldTrigger.trigger
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 2/14/2019, 11:55:03 AM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    2/13/2019, 3:57:19 PM   codeme.jai@gmail.com     Initial Version
**/
trigger HelloWorldTrigger on Account (before insert, after insert, after delete) {
    /*System.debug('Hello World');

    for (Account a : Trigger.New) {
       a.Description = 'New Description';
    }

    if(Trigger.isInsert){
        if(Trigger.isBefore){
            System.debug('Is before - insert .');
        }
        else if (Trigger.isAfter) {
            System.debug('Is after - insert');
        }
    }
    else if(Trigger.isDelete){
       System.debug('Process is after - delete');
    }
    */
    
}

