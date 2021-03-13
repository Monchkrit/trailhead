({
    getStrippedContacts : function(cmp){
      let action = cmp.get("c.stripInaccessibleMethod");
      action.setCallback(this, function(response){
        let state = response.getState();
        if (state === "SUCCESS") {
          cmp.set("v.strippedCons", response.getReturnValue());
        }
      });
      
      $A.enqueueAction(action);
    },
  
    getSecurityEnforced : function(cmp){
      let action = cmp.get("c.withSecurityEnforcedClause");
      action.setCallback(this, function(response){
        let state = response.getState();
        if (state === "SUCCESS"){
          cmp.set("v.enforcedCons", response.getReturnValue());
        }
      });
  
      $A.enqueueAction(action);
    },
  
    getAwfulCons : function(cmp){
      let action = cmp.get("c.schemaNamespaceClasses");
      action.setCallback(this, function(response){
        let state = response.getState();
        if (state === "SUCCESS"){
          cmp.set("v.awfulCons", response.getReturnValue());
        }
      });
      $A.enqueueAction(action);
    }
  })