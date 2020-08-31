public class ContactTriggerHandler {
    public static void checkManager(list<Contact> TriggerNewList)
    {
          list<RecordType> lstRcrd = new list <RecordType>();
         lstRcrd = [SELECT Name FROM RecordType WHERE sObjectType = 'Job__c'];
    
    for(Contact obj : TriggerNewList)
        {
         
         map <string,string> mapobj = new map<string,string>();
         for(RecordType itrrecord : lstRcrd  ) 
               {
               mapobj.put(itrrecord.Name,itrrecord.Name);
               }
      system.debug('map values are : '+mapobj);

        for (String key : mapobj.keySet())
        {
        system.debug('if condition value : '+(obj.Choose_Domain__c == mapobj.get(key)));
        if(obj.Choose_Domain__c=='none')
        {
        
        }
        if(obj.Choose_Domain__c == mapobj.get(key))
            {
            string domainname = mapobj.get(key);
            //system.debug('domain name :   '+domainname );
             integer acount = [SELECT count() FROM contact WHERE Choose_Domain__c =:+domainname];
             system.debug('Domain value '+acount);
             
             if(acount>=1)
             {
             obj.addError('already prsent');
             }
             
           }
        
       
         }
         } 
    }

}