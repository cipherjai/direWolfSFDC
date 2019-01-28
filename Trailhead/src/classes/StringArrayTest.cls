/**
 * @File Name          : StringArrayTest.cls
 * @Description        : 
 * @Author             : phUser@phDomain.com
 * @Group              : 
 * @Last Modified By   : phUser@phDomain.com
 * @Last Modified On   : 1/25/2019, 4:54:39 PM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    1/25/2019, 4:51:48 PM   phUser@phDomain.com     Initial Version
**/
public with sharing class StringArrayTest {
    public static List<String> generateStringArray(Integer returnStrings){
        List<String> listOfString =  new List<String>();
        for (Integer i = 0; i < returnStrings; i++) {
            listOfString.add('Test '+i);
        }        
        return listOfString;
    }
}