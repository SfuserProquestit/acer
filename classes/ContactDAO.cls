public class ContactDAO {
    public static List<Contact> getContacts(Set<Id> acctIds, Boolean mainContact){
        return [SELECT Id, Main_contact__c, AccountId FROM Contact WHERE AccountId IN :acctIds AND Main_contact__c =:mainContact];
    }
}