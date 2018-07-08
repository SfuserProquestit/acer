public class ContactTriggerHandler {
    public static void isMainContact(List<Contact> newContacts, map<Id,Contact> contactOldMap){
        set<Id> acctIds = new set<Id>();
        Map<Id,Id> newMainContactIds = new Map<Id,ID>();
        for(Contact cnt:newContacts){
            if((contactOldMap == null || (contactOldMap != null && contactOldMap.get(cnt.Id).Main_contact__c != cnt.Main_contact__c)) && cnt.Main_contact__c == true){
                acctIds.add(cnt.AccountId);
                newMainContactIds.put(cnt.AccountId,cnt.Id);
            }
        }
        if(!acctIds.isEmpty()){
			list<Contact> allRelatedMainContacts = ContactDAO.getContacts(acctIds, true);            
            if(allRelatedMainContacts!=null && allRelatedMainContacts.size()>0){
                for(Contact cnt : allRelatedMainContacts){
                    if(newMainContactIds.containsKey(cnt.AccountId) && newMainContactIds.get(cnt.AccountId) != cnt.Id){
                    	cnt.Main_Contact__c = false;
                    }
                }
            }
            update allRelatedMainContacts;
        }

        
    }
}