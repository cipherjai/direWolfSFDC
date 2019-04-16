/**
 * @File Name          : BulkTriggerDesignPattern.cls
 * @Description        : 
 * @Author             : suryaprakash.gupta@adrosonic.com
 * @Group              : 
 * @Last Modified By   : suryaprakash.gupta@adrosonic.com
 * @Last Modified On   : 29/3/2019, 7:04:04 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    28/3/2019, 7:07:14 PM   suryaprakash.gupta@adrosonic.com     Initial Version
**/
public with sharing class BulkTriggerDesignPattern {
    // bulkify your Trigger 
    Account acc = [Select Id, Name from Account where Id In : Trigger.New AND Id Not In (Select AccountId from Opportunity)];
    
}