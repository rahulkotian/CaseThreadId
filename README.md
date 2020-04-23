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


<a href="https://githubsfdeploy.herokuapp.com?owner=&repo=">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>


	
	



