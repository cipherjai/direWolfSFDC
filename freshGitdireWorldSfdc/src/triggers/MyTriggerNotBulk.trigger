/**
 * @File Name          : MyTriggerNotBulk.trigger
 * @Description        : 
 * @Author             : suryaprakash.gupta@adrosonic.com
 * @Group              : 
 * @Last Modified By   : suryaprakash.gupta@adrosonic.com
 * @Last Modified On   : 28/3/2019, 8:15:43 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    28/3/2019, 8:15:43 PM   suryaprakash.gupta@adrosonic.com     Initial Version
**/
trigger MyTriggerNotBulk on Account (before insert) {
    Account a = Trigger.New[0];
    a.Description = 'New Description';
    
}