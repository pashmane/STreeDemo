public class AccountQuableApex implements Queueable {
 public void execute(QueueableContext context) {
        Account a = new Account(Name='TestAccount1',Phone='(415) 555-1212');
        insert a;      
     
    }
}