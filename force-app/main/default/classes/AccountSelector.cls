public class AccountSelector {
    public Account getAccountById(Id accId){
        return [SELECT Id, Nr_Active_Contacts__c FROM Account WHERE Id = :accId];
    }
}
