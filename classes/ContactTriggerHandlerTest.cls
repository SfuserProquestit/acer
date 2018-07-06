@isTest
private class ContactTriggerHandlerTest {
    private static testmethod void testUniqueMainContactCreation(){

        Account newAccount = new Account(Name = 'Test Account', MFG_ID__c = 'ACC1234', Email__c = 'sfuser@proquestit.com');
        insert newAccount;
        
		Test.startTest();        
            Contact Cont1 = new Contact(Email='a@gmail.com',AccountId = newAccount.Id,Main_Contact__c=true, Is_Decision_Maker__c = 'No', Lastname = 'Cont 1');
	        insert Cont1;
        	Cont1 = [Select Main_Contact__c From Contact Where Id = :Cont1.Id];
	        System.assertEquals(true, Cont1.Main_Contact__c);
                
            Contact Cont2 = new Contact(Email='b@gmail.com',AccountId = newAccount.Id,Main_Contact__c=false, Is_Decision_Maker__c = 'No', Lastname = 'Cont 2');
        	insert Cont2;
        	Cont2 = [Select Main_Contact__c From Contact Where Id = :Cont2.Id];
	        System.assertEquals(false, Cont2.Main_Contact__c);
        
            Contact Cont3 = new Contact(Email='c@gmail.com',AccountId = newAccount.Id,Main_Contact__c=true, Is_Decision_Maker__c = 'No', Lastname = 'Cont 3');
            insert Cont3;
            Cont3 = [Select Main_Contact__c From Contact Where Id = :Cont3.Id];
	        System.assertEquals(true, Cont3.Main_Contact__c);
        	Cont2 = [Select Main_Contact__c From Contact Where Id = :Cont2.Id];
	        System.assertEquals(false, Cont2.Main_Contact__c);
	        Cont1 = [Select Main_Contact__c From Contact Where Id = :Cont1.Id];
	        System.assertEquals(false, Cont1.Main_Contact__c);

            Cont1.Main_Contact__c = true;
        	update Cont1;
        	Cont3 = [Select Main_Contact__c From Contact Where Id = :Cont3.Id];
	        System.assertEquals(false, Cont3.Main_Contact__c);
        	Cont2 = [Select Main_Contact__c From Contact Where Id = :Cont2.Id];
	        System.assertEquals(false, Cont2.Main_Contact__c);
	        Cont1 = [Select Main_Contact__c From Contact Where Id = :Cont1.Id];
	        System.assertEquals(true, Cont1.Main_Contact__c);
        Test.stopTest();
    }
}