@isTest
public class ContactTriggerTest {
    @isTest static void TestActiveContactIncrease() {
        // Test data setup
        // Create an account, and then add related contact
        Account acct = new Account(Name='Test Account');
        insert acct;
        Contact con1 = new Contact(FirstName= 'Remo', LastName= 'Thommen', Is_Active__c= true, AccountId= acct.Id);
        insert con1;
        //Contact con2 = new Contact(FirstName= 'Pepa', LastName= 'Gorgan', Is_Active__c= false, AccountId= acct.Id);
        //insert con2;

        // load data
        acct = [SELECT Id, Nr_Active_Contacts__c FROM Account WHERE Id = :acct.Id];
        // Perform test
        // Test.startTest();
        // Database.DeleteResult result = Database.delete(acct, false);
        // Test.stopTest();

        // Verify 
        // In this case the Nr. Active Contacts should be 1
        System.assertEquals(1, acct.Nr_Active_Contacts__c);
    }
}
