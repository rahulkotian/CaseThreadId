global class EmailUtilityClass {
	private static String getTextBody(String templateId, String WhatId , String WhoId)
    {
        String body ='';
        Messaging.SingleEmailMessage email = Messaging.renderStoredEmailTemplate(templateId,WhoId, WhatId);
        body= email.getPlainTextBody() ;
        return body;
        
    }
    //Get case thread id ,
    //Parameter: Case id of the case for which case thread is needed
    @InvocableMethod(label='Get Case thread ID' description='Returns thread id for Case and Template id')
    global static List<String> getCaseThreadID(List<CaseTemplate> caseTemplate){
        List<String> caseThreadId = new List<String>();
        try{
             if( caseTemplate != null && caseTemplate.size() > 0 )
             {
                CaseTemplate csTemplate = caseTemplate[0];
                EmailTemplate emt = [select id from EmailTemplate where developername = 'Case_Thread_Id_Email_Template'];
                Case tempCase = [select id , contactid from case where id =:csTemplate.caseId  limit 1] ;
                String caseThrd = getTextBody(emt.id, tempCase.contactid , csTemplate.caseId );
                caseThreadId.add(caseThrd);
             }
        }catch(Exception ex){
            System.debug('Exception : '+ex.getMessage());
        }
        return caseThreadId;
    }

	global class CaseTemplate{
        @InvocableVariable(label='Case Id')
        public String caseId ;
    }    
}