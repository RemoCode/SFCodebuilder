public class ContactTriggerHandler {
     public void countNumberOfActiveContactsOnAccount(List<Contact> contacts){
        Map<Id,List<Contact>> accountsContacts  = new Map<Id,List<Contact>>();

        List<Id> contactIds = new List<Id>();

        for(Contact con : contacts){
            contactIds.add(con.Id);
            if (accountsContacts.get(con.AccountId) != null) {
                accountsContacts.get(con.AccountId).add(con);
            } else {
                List<Contact> contactsToPut = new List<Contact>();
                contactsToPut.add(con);
                accountsContacts.put(con.AccountId, contactsToPut);
            }
        }
        List<Contact> contactsFromDB = [SELECT Id, AccountId, Is_Active__c FROM Contact WHERE AccountId IN :accountsContacts.keySet() AND Is_Active__c = true AND Id NOT IN :contactIds];
        for(Contact con : contactsFromDB){
            accountsContacts.get(con.AccountId).add(con);
        }

        List<Account> accountsToUpdate = new List<Account>();

        for (Id key : accountsContacts.keySet()){
            List<Contact> contactstoCount = accountsContacts.get(key);
            Integer nrOfActiveContacts = 0;
            for (Contact con : contactstoCount) {
                if (con.Is_Active__c) {
                    nrOfActiveContacts ++;
                }
            }

            Account a = new Account();
            a.Id = key;
            a.Nr_Active_Contacts__c = nrOfActiveContacts;
            accountsToUpdate.add(a);
        }

        update accountsToUpdate;

     }
}
