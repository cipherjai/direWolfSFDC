/**
 * @File Name          : ContactSearch.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 2/4/2019, 8:35:58 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    2/4/2019, 8:09:27 PM   codeme.jai@gmail.com     Initial Version
**/
public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String mailingPostalCode){
        List<Contact> cts = [SELECT ID, LastName, Firstname from Contact WHERE (LastName =: lastName OR MailingPostalCode =: mailingPostalCode)];
        return cts;
    }
}