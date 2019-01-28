/**
 * @File Name          : EmailManager.cls
 * @Description        : 
 * @Author             : phUser@phDomain.com
 * @Group              : 
 * @Last Modified By   : phUser@phDomain.com
 * @Last Modified On   : 1/25/2019, 4:22:26 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    1/13/2019, 6:29:49 PM   phUser@phDomain.com     Initial Version
**/
public with sharing class EmailManager {
    
    public static void sendMail(String address, String subject, String body){
        
        // Create an email message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);

        // Pass this email message to the built in sendEmail method of the Messaging Class 
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        inspectResults(results);
    }

    // Helper method
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
        
        // sendEmail returns an array of result objects.
        // Iterate through the list to inspect results. 
        // In this class, the methods send only one email, 
        // so we should have only one result.
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email sent successfully');
            }
            else {
                sendResult = false;
                System.debug('The following errors occurred: ' + res.getErrors());                 
            }
        }
        
        return sendResult;
    }
    
    // Helper Method
    
}