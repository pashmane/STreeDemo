public with sharing class DemoClass2 {

     @AuraEnabled
    public static string getobjName()
    {
        string allstr ='Account,Contact,Lead,Opportunity,Campaign,Job__c,Candidate__c';
       // Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
       
        return allstr;
    }
}