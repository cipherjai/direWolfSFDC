/**
 * @File Name          : DeepakTest.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 1/28/2019, 11:36:12 AM
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

        
    }
}