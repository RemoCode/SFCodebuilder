@isTest
public class ContactSelectorTest {
    @isTest static void TestGetContactById() {
        Account acct = (Account) TestDataFactory.createSimpleAccount('Test Account').insertObj();
        Contact con = (Contact) TestDataFactory.createSimpleContact(acct.Id, 'Thommen', 'Remo', true).insertObj();
        Contact contactFromDB = new ContactSelector().getContactById(con.Id);
        System.assertEquals(con.Id, contactFromDB.Id);
    }

    @isTest static void TestGetContactByFirstName() {
        Account acct = (Account) TestDataFactory.createSimpleAccount('Test Account').insertObj();
        Contact con = (Contact) TestDataFactory.createSimpleContact(acct.Id, 'Thommen', 'Remo', true).insertObj();
        Contact contactFromDB = new ContactSelector().getContactByFirstName('Remo');
        System.assertEquals(con.Id, contactFromDB.Id);
    }

    @isTest static void TestUpdateContactIsActive() {
        Account acct = (Account) TestDataFactory.createSimpleAccount('Test Account').insertObj();
        Contact con = (Contact) TestDataFactory.createSimpleContact(acct.Id, 'Thommen', 'Remo', true).insertObj();
        System.assertEquals(true, con.Is_Active__c);
        new ContactSelector().updateContactIsActive(con.Id, false);
        Contact contactFromDBAfterUpdate = new ContactSelector().getContactById(con.Id);
        System.assertEquals(false, contactFromDBAfterUpdate.Is_Active__c);
    }
}
