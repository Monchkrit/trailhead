public with sharing class ThreeMethods {
    /* create a SOQL query that queries for the Id, LastName, Name, and CreatedDate fields from the Contact sObject
     * once you've retrieved your results, use the Security.stripInaccessible() method to remove any fields that the running user
     * cannot update before returning the list of results, stripped of the non-updateable fields
    */
    
    @AuraEnabled
    public static List<Contact> stripInaccessibleMethod() {
        
            List<Contact> cons = [SELECT Id, LastName, Name, CreatedDate FROM Contact];

       	    SObjectAccessDecision result = Security.stripInaccessible(AccessType.UPDATABLE, cons);
            List<Contact> strippedCons = (List<Contact>) result.getRecords();
            System.debug(cons[0].isSet('Name')); // prints "false"
            return strippedCons;
    }
    
    /* create a SOQL query that queries for the Id, LastName, and Birthdate fields from the Contact sObject using the
     * WITH SECURITY_ENFORCED SOQL clause
     * create exception handling to catch the QueryException that will be thrown if the running user does not have access to the fields
     * or contact object, debugging the type of the exception or the message of the exception
     * if there is no exception thrown, return the results of your query
    */ 
    @AuraEnabled
    public static List<Contact> withSecurityEnforcedClause() {
        System.debug('Does this even run?');
        try{
            List<Contact> cons = [SELECT Id, LastName, Birthdate FROM Contact WITH SECURITY_ENFORCED];
            
        	return cons;
        } catch(QueryException qe) {
            System.debug(qe.getTypeName() + ': ' + qe.getMessage());
            return null;
        }
    }
    
    /* create a SOQL query that retrieves the LastName, Name, and Birthdate fields from the Contact sObject
     * before executing this query, you should check for the accessibility of the object and fields for the running user through use
     * of the Schema namespace classes and methods
     * if the running user does not have access to the object, do not execute the query
     * if the running user does not have access to the LastName, Name, and/or Birthdate fields, do not include them in the query
     * your method should end by returning the results from the query
    */
    @AuraEnabled
    public static List<Contact> schemaNamespaceClasses() {
        String selectClause = 'SELECT';
        if(!Schema.SObjectType.Contact.isAccessible()) {
            return null;
        }
        if(Schema.SObjectType.Contact.fields.LastName.isAccessible()) {
            selectClause += ' LastName';
        }
        if(Schema.SObjectType.Contact.fields.Name.isAccessible()) {
            if(selectClause != 'SELECT') {
                selectClause += ', Name';
            } else {
                selectClause += ' Name';
            }
        }
        if(Schema.SObjectType.Contact.fields.Birthdate.isAccessible()) {
            if(selectClause != 'SELECT') {
                selectClause += ', Birthdate';
            } else {
                selectClause += 'Birthdate';
            }
        }

        List<Contact> cons = Database.query(selectClause + ' FROM Contact');
        return cons;
    }
}