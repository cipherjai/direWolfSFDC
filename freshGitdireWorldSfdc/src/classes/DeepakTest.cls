/**
 * @File Name          : DeepakTest.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 2/1/2019, 11:52:21 AM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    1/25/2019, 6:58:52 PM   codeme.jai@gmail.com     Initial Version
**/
public with sharing class DeepakTest {
    public static void Magan(){
        String stomach;

    }

    public static void createRecord(){
        Account account1 =  new Account(Name='Avengers', Phone='(+1-6667637999');
        try {
            insert account1;
            Id accountId = account1.Id;
            System.debug('accountID -- > ' + accountId);
        } catch (Exception ex) {
           System.debug('In the ` Block -- >' + ex);
        }

        // Create a list of contacts
        List<Contact> conList = new List<Contact> {
            new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
                new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
                new Contact(FirstName='Caroline',LastName='Roth',Department='Finance'),
                new Contact(FirstName='Kim',LastName='Shain',Department='Education')
        };
            
        // Bulk insert all contacts with one DML call
        insert conList;
        
        // List to hold the new contacts to update
        List<Contact> listToUpdate = new List<Contact>();
        
        // Iterate through the list and add a title only
        //   if the department is Finance
        for(Contact con : conList) {
            if (con.Department == 'Finance') {
                con.Title = 'Financial analyst';
                // Add updated contact sObject to the list.
                listToUpdate.add(con);
            }
        }
        // Bulk update all contacts with one DML call
        update listToUpdate;

        // Upserting Record 
        //upsert sObjectList Account.Fields.MyExternalId;
        Contact contactJosh = new Contact(FirstName='Josh', LastName='Kaplan', Department='Finance');
        insert contactJosh;

        contactJosh.Description = 'Josh\'s record has been updated by Upsert Statement';

        Contact contactKathy = new Contact(FirstName='Kathy', LastName='Brown', Department='Technology');
        List<Contact> contacts = new List<Contact> {
            contactJosh,
            contactKathy
        };
        upsert contacts;

        // Jane2
        Contact jane = new Contact(FirstName='Jane', LastName='Smith', Email='jane.smith@example.com', Description='Contact of the Day');
        insert jane;

        Contact jane2 = new Contact(FirstName='Jane', LastName='Smith', Email='jane.Smith@example.com', Description='Prefers to be contacted by Email');

        upsert jane2 Contact.fields.Email;

        System.assertEquals('Prefers to be contacted by Email.', [SELECT Description FROM Contact WHERE Id=:jane.Id].Description);


        // Deleting Records 
        Contact [] contactsDel = [Select Id FROM Contact WHERE LastName = 'Smith'];
        delete contactsDel;

        try {
           Account acct = new Account();
           insert acct;
        } catch (DmlException dmlException) {
            System.debug('DML Exception Occured ' + dmlException.getMessage());
        }

        /* Database.insert()
        Database.update()
        Database.upsert()
        Database.delete()
        Database.undelete()
        Database.merge() */

        // Syntax is Database.insert(recordList, allOrNone);
        // Example :: Database.insert(recordList, false);

        // Return Type for the aboove statements 
        /*
        Database.insert() -- > Database.SaveResult[]
        Database.update() -- > 
        Database.upsert() -- > Database.UpsertResult
        Database.delete() -- > Database.DeleteResult
        Database.undelete() -- >
        Database.merge() -- >
        */
                                
        // Another set of methods for operations
        // Rollback 
        // Transaction COntrol 
        // Emptying the recycle Bin 
        // SOQL

        // Inserting with partial success 
        List<Contact> conLists = new List<Contact>{
            new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
            new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
            new Contact(FirstName='Caroline',LastName='Roth',Department='Finance'),
            new Contact()
        };

        Database.SaveResult[] srList =  Database.insert(conLists, false);
        // Iterate through each returned result 

        for(Database.SaveResult sr : srList){
            if(sr.isSuccess()){
                // Operations if successful
                System.debug('Successfully inserted record with id = ' + sr.getId());
            }
            else {
               for(Database.Error err :  sr.getErrors()){
                   System.debug('The following error has occured!');
                   System.debug(err.getStatusCode()+ ':' + err.getMessage());
                   System.debug('Contacts fields with errors ' + err.getFields());                   
               }
            }
        }
        
        
        // Related Records 
        Account acct = new Account(Name='SFDC Account');
        insert acct;
        // Once the account is inserted, the sObject will be 
        // populated with an ID.
        // Get this ID.
        ID acctID = acct.ID;
        // Add a contact to this account.
        Contact mario = new Contact(
            FirstName='Mario',
            LastName='Ruiz',
            Phone='415.555.1212',
            AccountId=acctID);
        insert mario;

        // Query for the contact, which has been associated with an account.
        Contact queriedContact = [SELECT Account.Name 
                                FROM Contact 
                                WHERE FirstName = 'Mario' AND LastName='Ruiz'
                                LIMIT 1];
        // Update the contact's phone number
        queriedContact.Phone = '(415)555-1213';
        // Update the related account industry
        queriedContact.Account.Industry = 'Technology';
        // Make two separate calls 
        // 1. This call is to update the contact's phone.
        update queriedContact;
        // 2. This call is to update the related account's Industry field.
        update queriedContact.Account; 

        Account[] queriedAccounts = [SELECT Id FROM Account WHERE Name='SFDC Account'];
        delete queriedAccounts;
                 
    }
}