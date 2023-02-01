/**
* TestDataFactory is used to create data in our unit tests.
*
* @author  Remo Thommen
* @version 1.0
* @since   2023-01-20
*/
@IsTest
public class TestDataFactory {

    private SObject obj;

    public TestDataFactory(SObject obj){
        this.obj = obj;
    }

    public SObject insertObj(){
        insert this.obj;
        return this.obj;
    }

    public SObject getObj(){
        return this.obj;
    }

    public static TestDataFactory createSimpleAccount(String accountName){
        Account a = new Account(
            Name = accountName
        );

        return new TestDataFactory((SObject) a);
    }

    public static TestDataFactory createSimpleContact(Id accountId, String lastName, String firstName, Boolean isActive){
        Contact c = new Contact(
            AccountId = accountId,
            LastName = lastName,
            FirstName= firstName,
            Is_Active__c= isActive
        );

        return new TestDataFactory((SObject) c);
    }
	    
}