({
  tabinit: function(cmp)
  {
    cmp.set('v.columns', [
      {label: 'Contact Id', fieldName: 'Id', type: 'id'},
      {label: 'Contact Name', fieldName: 'Name', type: 'text'},
      {label: 'Contact Last Name', fieldName: 'LastName', type: 'text'}
    ]);
  }
  // getStrippedContacts : function(cmp){
  //   var action = cmp.get("c.stripInaccessibleMethod");
  //   action.setCallback(this, function(response){
  //     var state = response.getState();
  //     if (state === "SUCCESS") {
  //       cmp.set("v.strippedCons", response.getReturnValue());
  //     }
  //   });
    
  //   $A.enqueueAction(action);
  // },

  // getSecurityEnforced : function(cmp){
  //   console.log("Inside the getSecurityEnforced function");
  //   var action = cmd.get("c.withSecurityEnforcedClause");
  //   action.setCallback(this, function(response){
  //     var state = response.getState();
  //     if (state === "SUCCESS"){
  //       cmp.set("v.enforcedCons", response.getReturnValue());
  //     }
  //   });

  //   $A.enqueueAction(action);
  // },

  // getAwfulCons : function(cmp){
  //   var action = cmp.get("c.schemaNamespaceClasses");
  //   action.setCallback(this, function(resonse){
  //     var state = response.getState();
  //     if (state === "SUCCESS"){
  //       cmp.set("v.awfulCons", response.getReturnValue());
  //     }
  //   });
  // }
})