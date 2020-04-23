# Case Scenario
There are scenarios when you need a case thread id , either in your flow or in Apex. Currently you cannot use SOQL to get the case id. There are some workarounds as creating a formula but they are not reliable as can be seen in comments in this idea ->
Open idea: https://success.salesforce.com/ideaView?id=08730000000XvdHAAS

## Components
		1) Email Template:  Case_Thread_Id_Email_Template
	  2) Apex class: EmailUtilityClass, EmailUtilityClassTest
	  3) Flow: Test_Flow_for_case_thread_id



## Solution description
By using a combination of email template and the "Messaging" class we can generate the case thread id based on incoming case id.
There is a test flow and test class included to help understand the usage.


## Deploy to Org

Do you want to try in your own org ?

<a href="https://githubsfdeploy.herokuapp.com?owner=rahulkotian&repo=CaseThreadId">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>


## Screenshots
1) Debug flow (Test_Flow_for_case_thread_id) by passing parameters :
<img alt="Debug flow"
       src="https://user-images.githubusercontent.com/3289974/80146443-77754d00-8577-11ea-87c6-db1ff84f4fa2.png">

<img alt="Email example"
       src="https://user-images.githubusercontent.com/3289974/80146505-8e1ba400-8577-11ea-83c1-b71fa22e420a.png">
 
 2) Use anonymous window to run test code:
	
	```
	List<EmailUtilityClass.CaseTemplate> caseTemplateList = new List<EmailUtilityClass.CaseTemplate>();
	EmailUtilityClass.CaseTemplate testCase = new EmailUtilityClass.CaseTemplate();
	testCase.caseId='5004100000WcHURAA3';
	caseTemplateList.add(testCase);
	System.debug('Case thread id :'+ EmailUtilityClass.getCaseThreadID(caseTemplateList));
	```
<img alt="Anonymous code"
       src="https://user-images.githubusercontent.com/3289974/80146733-e488e280-8577-11ea-91c9-12f901f65164.png">

<img alt="Anonymous code"
       src="https://user-images.githubusercontent.com/3289974/80146586-af7c9000-8577-11ea-8597-c4df29ce3099.png">

