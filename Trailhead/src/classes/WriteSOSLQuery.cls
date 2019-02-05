/**
 * @File Name          : WriteSOSLQuery.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 2/5/2019, 5:38:55 PM
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

    
}

