@isTest
public class EmailUtilityClassTest {
     
	@TestSetUp static void setup()
    {
        //Create Contact:
        Contact cont = new Contact(Firstname='Test', Lastname='testL');
        insert cont;
        
        //Create case:
        Case testCase = new Case(Subject='test case', contactid= cont.Id);
        insert testCase;
    }
    
    @isTest static void testGetCaseThreadID()
    {
        Case testCase = [select id from case limit 1];
        List<EmailUtilityClass.CaseTemplate> caseTemplateList = new List<EmailUtilityClass.CaseTemplate>();
        EmailUtilityClass.CaseTemplate testCaseTemplate = new EmailUtilityClass.CaseTemplate();
        testCaseTemplate.caseId=testCase.Id;
        caseTemplateList.add(testCaseTemplate);
        List<String> caseThreadIdList = EmailUtilityClass.getCaseThreadID(caseTemplateList);
        System.assertEquals(false, String.isBlank(caseThreadIdList[0]) ) ;
    }
}