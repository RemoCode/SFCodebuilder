trigger ContactTrigger on Contact (after update, after insert) {
    if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
        new ContactTriggerHandler().countNumberOfActiveContactsOnAccount(trigger.new);
    }
}