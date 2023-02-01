public class ContactTriggerHandler {
     public void countNumberOfActiveContactsOnAccount(List<Contact> contacts){
        Map<Id,List<Contact>> accountsContacts  = new Map<Id,List<Contact>>();
        List<Id> contactIds = new List<Id>();
        List<Account> accountsToUpdate = new List<Account>();

        prepareMapOfContactsFromTriggerContext(accountsContacts, contacts, contactIds);
        prepareMapOfContactsFromDB(accountsContacts, contactIds);

        for (Id key : accountsContacts.keySet()){
            List<Contact> contactstoCount = accountsContacts.get(key);
            Integer nrOfActiveContacts = 0;
            for (Contact con : contactstoCount) {
                if (con.Is_Active__c) {
                    nrOfActiveContacts ++;
                }
            }
            updateActiveContactsOnAccount(key, nrOfActiveContacts, accountsToUpdate);
        }
        update accountsToUpdate;
     }

     private void prepareMapOfContactsFromTriggerContext(Map<Id,List<Contact>> accountsContacts, List<Contact> contacts, List<Id> contactIds){
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
     }

     private void prepareMapOfContactsFromDB(Map<Id,List<Contact>> accountsContacts, List<Id> contactIds){
        List<Contact> contactsFromDB = new ContactSelector().activeContactsFromAccount(accountsContacts.keySet(), contactIds);
        for(Contact con : contactsFromDB){
            accountsContacts.get(con.AccountId).add(con);
        }
     }
     
     private void updateActiveContactsOnAccount(Id key, Integer nrOfActiveContacts, List<Account> accountsToUpdate){
        Account a = new Account();
        a.Id = key;
        a.Nr_Active_Contacts__c = nrOfActiveContacts;
        accountsToUpdate.add(a);
     }
}
