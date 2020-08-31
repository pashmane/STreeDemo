public class WrapperConOppoClass {
     public static  list<Opportunity> lstOpprtunity {set ; get;}
     public static  list<Contact> lstContact {set ; get;}
     public static  set<Id> parentIds = new set<Id>();
     public static set<Id> fetchData(){
     lstOpprtunity = [Select name,Id,AccountId from Opportunity ];
     lstContact = [Select name,Id,AccountId from Contact ];
     for(Opportunity OppertunityRec :lstOpprtunity)
     	{
        	parentIds.add(OppertunityRec.AccountId);
     	}
     for(Contact ContactRec :lstContact)
     	{
        	parentIds.add(ContactRec.AccountId);
     	}
         for(Id ss : parentIds )
         {
         System.debug('set id ids'+ss);
         }
         return parentIds;
	}
}