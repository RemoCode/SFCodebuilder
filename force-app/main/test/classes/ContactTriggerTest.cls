@isTest
public class ContactTriggerTest {
    @isTest static void TestActiveContactIncrease() {
        Account acct = (Account) TestDataFactory.createSimpleAccount('Test Account').insertObj();
        Contact con1 = (Contact) TestDataFactory.createSimpleContact(acct.Id, 'Thommen', 'Remo', true).insertObj();
        Contact con2 = (Contact) TestDataFactory.createSimpleContact(acct.Id, 'Gorgan', 'Pepa', false).insertObj();
        acct = new AccountSelector().getAccountById(acct.Id);
        // Verify 
        // In this case the Nr. Active Contacts should be 1
        System.assertEquals(1, acct.Nr_Active_Contacts__c);
    }
    @isTest static void TestActiveContactIncreaseMoreThanOne() {
        // Test data setup
        // Create an account, and then add related contact
        Account acct = new Account(Name='Test Account');
        insert acct;
        Contact con1 = new Contact(FirstName= 'Remo', LastName= 'Thommen', Is_Active__c= true, AccountId= acct.Id);
        insert con1;
        Contact con2 = new Contact(FirstName= 'Pepa', LastName= 'Gorgan', Is_Active__c= true, AccountId= acct.Id);
        insert con2;

        // load data
        acct = [SELECT Id, Nr_Active_Contacts__c FROM Account WHERE Id = :acct.Id];
        // Perform test
        // Test.startTest();
        // Database.DeleteResult result = Database.delete(acct, false);
        // Test.stopTest();

        // Verify 
        // In this case the Nr. Active Contacts should be 1
        System.assertEquals(2, acct.Nr_Active_Contacts__c);
    }

    @isTest static void TestActiveContactIncrease0() {
        // Test data setup
        // Create an account, and then add related contact
        Account acct = new Account(Name='Test Account');
        insert acct;
        Contact con1 = new Contact(FirstName= 'Remo', LastName= 'Thommen', Is_Active__c= false, AccountId= acct.Id);
        insert con1;
        Contact con2 = new Contact(FirstName= 'Pepa', LastName= 'Gorgan', Is_Active__c= false, AccountId= acct.Id);
        insert con2;

        // load data
        acct = [SELECT Id, Nr_Active_Contacts__c FROM Account WHERE Id = :acct.Id];
        // Perform test
        // Test.startTest();
        // Database.DeleteResult result = Database.delete(acct, false);
        // Test.stopTest();

        // Verify 
        // In this case the Nr. Active Contacts should be 1
        System.assertEquals(0, acct.Nr_Active_Contacts__c);
    }

    @isTest static void TestActiveContactIncreaseAndUpdate() {
        // Test data setup
        // Create an account, and then add related contact
        Account acct = new Account(Name='Test Account');
        insert acct;
        Contact con1 = new Contact(FirstName= 'Remo', LastName= 'Thommen', Is_Active__c= true, AccountId= acct.Id);
        insert con1;
        Contact con2 = new Contact(FirstName= 'Pepa', LastName= 'Gorgan', Is_Active__c= false, AccountId= acct.Id);
        insert con2;

        // load data
        acct = [SELECT Id, Nr_Active_Contacts__c FROM Account WHERE Id = :acct.Id];
        // Perform test
        // Test.startTest();
        // Database.DeleteResult result = Database.delete(acct, false);
        // Test.stopTest();

        // Verify 
        // In this case the Nr. Active Contacts should be 1
        System.assertEquals(1, acct.Nr_Active_Contacts__c);

        // Update
        con1.Is_Active__c= false;
        update con1;
        // load data
        acct = [SELECT Id, Nr_Active_Contacts__c FROM Account WHERE Id = :acct.Id];
        System.assertEquals(0, acct.Nr_Active_Contacts__c);
    }
}

