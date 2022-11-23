trigger ContactTrigger on Contact (after update, after insert) {
    new ContactTriggerHandler().countNumberOfActiveContactsOnAccount(trigger.new);
}