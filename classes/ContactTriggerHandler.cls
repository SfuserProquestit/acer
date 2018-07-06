public class ContactTriggerHandler {
    public static void isMainContact(List<Contact> newContacts, map<Id,Contact> contactOldMap){
        set<Id> acctIds = new set<Id>();
        Set<Id> newMainContactIds = new Set<Id>();
        list<Contact> contactUpdateList = new list<Contact>();
        for(Contact cnt:newContacts){
            if((contactOldMap == null || (contactOldMap != null && contactOldMap.get(cnt.Id).Main_contact__c != cnt.Main_contact__c)) && cnt.Main_contact__c == true){
                acctIds.add(cnt.AccountId);
                newMainContactIds.add(cnt.Id);
            }
        }
        if(!acctIds.isEmpty()){
			list<Contact> allRelatedMainContacts = ContactDAO.getContacts(acctIds, true,newMainContactIds);            
            if(allRelatedMainContacts!=null && allRelatedMainContacts.size()>0){
                for(Contact cnt : allRelatedMainContacts){
                    cnt.Main_Contact__c = false;
                }
            }
            update allRelatedMainContacts;
        }

        
    }
}