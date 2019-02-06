/**
 * @File Name          : WriteSOSLQuery.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 2/5/2019, 6:47:05 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    2/5/2019, 11:50:01 AM   codeme.jai@gmail.com     Initial Version
**/
public with sharing class WriteSOSLQuery {

    public static void dummySearch(){
        List<List<sObject> searchList = [FIND 'SFDC' IN ALL FIELDS RETURNING Account(Name), Contact(FirstName, LastName)];
        System.debug('List --> '+searchList);
    }

    /* Fields available for searching
        *ALL FIELDS
        *NAME FIELDS
        *EMAIL FIELDS
        *PHONE FIELDS
        *SIDEBAR FIELDS
    */

    public static void dummyQuery(){
        List<List<sObject>> searchList = [FIND 'Wingo OR SFDC' IN ALL FIELDS 
                        RETURNING Account(Name),Contact(FirstName,LastName,Department)];
        Account[] searchAccounts = (Account[])searchList[0];
        Contact[] searchContacts = (Contact[])searchList[1];
        System.debug('Found the following accounts.');
        for (Account a : searchAccounts) {
            System.debug(a.Name);
        }
        System.debug('Found the following contacts.');
        for (Contact c : searchContacts) {
            System.debug(c.LastName + ', ' + c.FirstName);
        }
    }
    
                
}

