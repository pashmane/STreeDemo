public class accountsWithContactsClass {

@auraEnabled
public static list<account> getAllAccounts()
    {
       list<account> accs =[select Id, Name, BillingStreet, BillingCity, BillingCountry,(select lastName from contacts) from account limit 10];
      //  list<account> accs =[select id,name,phone,industry from account limit 10];
     //   return [select Id,Name from account limit 10];
     	system.debug('accinclass'+accs.size());
        return accs;
    }
    
    @auraEnabled
public static list<contact> getRelatedContacts(String AccId)
    {
       list<contact> contcts =[select lastName from contact where accountId=:AccId];
        system.debug('accId='+AccId);
      //  list<account> accs =[select id,name,phone,industry from account limit 10];
     //   return [select Id,Name from account limit 10];
     system.debug('related contacts='+contcts);
     return contcts;
    }
}