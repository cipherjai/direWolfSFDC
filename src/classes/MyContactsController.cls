public class MyContactsController {
	
    // Can be called be Aura Components so it is Aura Enabled
    @AuraEnabled
    public static List<Contact> getContacts(List<Id> accountIds){
        // Soql query to get the list of contacts
        // The method is static to access it directly
        
        List<Contact> contactList = [SELECT Id, FirstName, LastName, AccountID, Phone, Email FROM Contact WHERE AccountId in :accountIds];
        return contactList;
    }
    
    @AuraEnabled
    public static Map<String, String> saveContactList(List<Contact> contactList){
        Map<String, String> resultMap = new Map<String, String>();
        try{
            update contactList;
            resultMap.put('status', 'success');
            resultMap.put('message', 'Contacts Updated Successfully');
        }
        catch(Exception e){
            resultMap.put('status', 'failure');
            resultMap.put('message', e.getMessage());
        }
        return resultMap;
    }
}