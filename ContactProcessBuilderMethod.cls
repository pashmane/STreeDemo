global class ContactProcessBuilderMethod {
 //@InvocableMethod(label='label' description='description')
    public static void getAccountNames(List<ID> ids) {
        System.debug('hello inside invocable id = '+ids);
    List<String> contactNames = new List<String>();
    List<Contact> contacts = [SELECT AccountId,Name FROM Contact WHERE Id =: ids];
    ID accid = contacts[0].AccountId;
        System.debug('accid...'+accid);
    for (Contact cont : contacts) {
      contactNames.add(cont.Name);
    }
        list<Account> lstAcccount = [SELECT Count__c FROM Account WHERE ID =:contacts[0].AccountId];
        System.debug('lstAcccount......'+lstAcccount);
        System.debug('lstAcccount[0].Count__c....'+lstAcccount[0].Count__c);
        integer count = (Integer)lstAcccount[0].Count__c;
        System.debug('count....'+count);
        count++;
        Account acc = new Account();
        acc.Id = contacts[0].AccountId;
  		acc.Count__c = count;
        System.debug('acc...'+acc);
        update acc;
  }
}