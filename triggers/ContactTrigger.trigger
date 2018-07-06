trigger ContactTrigger on Contact (after update, after insert) {
   ContactTriggerHandler.isMainContact(Trigger.new, Trigger.oldmap);
}