public class JavascriptDemo1Handler {
    
 	list<Account> acts;
    list<Contact> contacts;
    
    public list<Account> getacts()
    {
        return acts;
    }
    public list<Contact> getcontacts()
    {
        return contacts;
    }
    
    public PageReference myActionInController()
    {
        contacts = [SELECT Name,Email FROM Contact]; 
        acts = [SELECT Name,Phone FROM Account]; 
        return null ;
    }
    
}