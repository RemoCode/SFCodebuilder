@isTest
public class AccountSelectorTest {
    @isTest static void TestGetAccountById() {
        Account acct = (Account) TestDataFactory.createSimpleAccount('Test Account').insertObj();
        Account accountFromDB = new AccountSelector().getAccountById(acct.Id);
        System.assertEquals(acct.Id, accountFromDB.Id);
    }
}
