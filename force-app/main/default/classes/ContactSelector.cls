public class ContactSelector {
    public Contact getContactById(Id conId){
        return [SELECT Id, Is_Active__c FROM Contact WHERE Id = :conId];
    }

    public Contact getContactByFirstName(String firstName){
        return [SELECT Id FROM Contact WHERE firstName = :firstName];
    }

    public Boolean updateContactIsActive(Id conId, Boolean isActive){
        List<Contact> contactFromDB = [SELECT Id FROM Contact WHERE Id = :conId];
        contactFromDB[0].Is_Active__c = isActive;
        update contactFromDB[0];
        return contactFromDB[0].Is_Active__c;
    }

    public List<Contact> activeContactsFromAccount(Set<Id> accIds, List<Id> conIds){
        return [SELECT Id, AccountId, Is_Active__c FROM Contact WHERE AccountId IN :accIds AND Is_Active__c = true AND Id NOT IN :conIds];
    }
}
