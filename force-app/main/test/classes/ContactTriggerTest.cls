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
        Account acct = (Account) TestDataFactory.createSimpleAccount('Test Account').insertObj();
        Contact con1 = (Contact) TestDataFactory.createSimpleContact(acct.Id, 'Thommen', 'Remo', true).insertObj();
        Contact con2 = (Contact) TestDataFactory.createSimpleContact(acct.Id, 'Gorgan', 'Pepa', true).insertObj();
        acct = new AccountSelector().getAccountById(acct.Id);

        // Verify 
        // In this case the Nr. Active Contacts should be 2
        System.assertEquals(2, acct.Nr_Active_Contacts__c);
    }

    @isTest static void TestActiveContactIncrease0() {
        Account acct = (Account) TestDataFactory.createSimpleAccount('Test Account').insertObj();
        Contact con1 = (Contact) TestDataFactory.createSimpleContact(acct.Id, 'Thommen', 'Remo', false).insertObj();
        Contact con2 = (Contact) TestDataFactory.createSimpleContact(acct.Id, 'Gorgan', 'Pepa', false).insertObj();
        acct = new AccountSelector().getAccountById(acct.Id);
        
        // Verify 
        // In this case the Nr. Active Contacts should be 0
        System.assertEquals(0, acct.Nr_Active_Contacts__c);
    }

    @isTest static void TestActiveContactIncreaseAndUpdate() {
        Account acct = (Account) TestDataFactory.createSimpleAccount('Test Account').insertObj();
        Contact con1 = (Contact) TestDataFactory.createSimpleContact(acct.Id, 'Thommen', 'Remo', true).insertObj();
        Contact con2 = (Contact) TestDataFactory.createSimpleContact(acct.Id, 'Gorgan', 'Pepa', false).insertObj();
        acct = new AccountSelector().getAccountById(acct.Id);
        
        // Verify 
        // In this case the Nr. Active Contacts should be 1
        System.assertEquals(1, acct.Nr_Active_Contacts__c);

        // Update
        new ContactSelector().updateContactIsActive(con1.Id, false);

        // old version
        // con1.Is_Active__c= false;
        // update con1;
        
        acct = [SELECT Id, Nr_Active_Contacts__c FROM Account WHERE Id = :acct.Id];
        System.assertEquals(0, acct.Nr_Active_Contacts__c);
    }
}

