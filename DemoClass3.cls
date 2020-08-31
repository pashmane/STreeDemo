public with sharing class DemoClass3 {
@AuraEnabled
public static String getDisplay(String objname,String data)
{
    System.debug('Fields Query'+data);
    string allstirng;
    list<String> lstAcc = new list<String>();
    lstAcc.add(data);
    for(String s: lstAcc){
        allstirng +=',';
    	allstirng += s;
		}
	System.debug('Result of Fields...'+allstirng);
	return allstirng;  
}
}