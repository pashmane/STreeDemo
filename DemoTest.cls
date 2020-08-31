@isTest
public class DemoTest {
@isTest(SeeAllData=true)
 static void getMessageTest()
	{
    list<Account> lstAcc  = new list<Account>();
        for(integer index=0;index<2000;index++)
        {
            Account objacc = new Account();
            objacc.name = 'WeWork '+index;
            objacc.Fax = '12121212';
            lstAcc.add(objacc);
        }
        insert lstAcc;
        list<Account> lstids = [SELECT Id, Name, CreatedDate FROM Account ORDER BY CreatedDate LIMIT 2000];
        integer count = lstids.size();
        System.debug('count...'+count);
        Account id1 = lstids[count];
        System.debug('id1...'+id1);
	}

}