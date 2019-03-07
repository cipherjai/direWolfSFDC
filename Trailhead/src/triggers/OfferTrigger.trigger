/**
 * @File Name          : OfferTrigger.trigger
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 1/3/2019, 6:36:51 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    1/3/2019, 6:28:08 PM   codeme.jai@gmail.com     Initial Version
**/
trigger OfferTrigger on Offer (before insert) {
    if (Trigger.isInsert && Trigger.isBefore) {
       System.debug('Inside Offer Trigger');
    }
}