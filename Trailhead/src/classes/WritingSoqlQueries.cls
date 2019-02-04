/**
 * @File Name          : WritingSoqlQueries.cls
 * @Description        : 
 * @Author             : codeme.jai@gmail.com
 * @Group              : 
 * @Last Modified By   : codeme.jai@gmail.com
 * @Last Modified On   : 2/4/2019, 7:56:46 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    2/1/2019, 12:12:10 PM   codeme.jai@gmail.com     Initial Version
**/
public with sharing class WritingSoqlQueries {
    // Salesforce Object Query Language
    // Account [] accts = [Select Name, Phone, From Account];

    // Basic Syntax
    // SELECT fields FROM ObjectName [WHERE Condition]

    // related Query 
    Account[] acctsWithContacts = [SELECT Name, (SELECT FirstName,LastName FROM Contacts)
    FROM Account 
    WHERE Name = 'SFDC Computing'];

    // Contacts [] cts = acctsWithContacts[0].Contacts;
    // System.debug('Name of the first associated contact: ' + cts[0].FirstName + ', ' + cts[0].LastName);
}