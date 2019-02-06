/**
 * @File Name          : ContactAndLeadSearch.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 2/6/2019, 2:01:27 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    2/5/2019, 6:58:47 PM   codeme.jai@gmail.com     Initial Version
**/
public with sharing class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String partOfName){
        List<List<SObject>> listName = [FIND :partOfName IN NAME FIELDS RETURNING Contact, Lead];
        return listName;
    }
}

