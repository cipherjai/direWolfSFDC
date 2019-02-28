/**
 * @File Name          : ExampleTrigger.trigger
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 28/2/2019, 10:49:23 AM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    2/14/2019, 11:02:32 AM   codeme.jai@gmail.com     Initial Version
**/
trigger ExampleTrigger on Contact (after insert, after delete) {
    if (Trigger.isInsert) {
        Integer recordCount = Trigger.New.size();
        System.debug('Inside Contact After inser trigger');
        EmailManager.sendMail('codeme.jai@gmail.com', 'Trailhead Trigger Tutorial', recordCount, 'Contact(s) were inserted.');
    }
    else if(Trigger.isDelete){
       System.debug('Process after delete. ');
    }
}

// Contact c = new Contact(LastName='Test Contact');
// insert c;\