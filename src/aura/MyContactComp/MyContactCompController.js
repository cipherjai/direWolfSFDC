({
	getContactList : function(component, event, helper) {
		helper.fetchContacts(component, event, helper);
	},
    
    newContact : function(component, event, helper){
        // These global actions only work under one app Container
        var createContact = $A.get("e.force:createRecord");
        createContact.setParams({
            'entityApiName' : 'Contact',
            'defaultFieldValues' : {
                'AccountId' : component.get("v.recordId")
            }
        });
        createContact.fire();
        console.log("de rigueur");
    },
    
    editContacts: function(component, event, helper){
        var btn = event.getSource();
        var name = btn.get('v.name');
        var recordViewForm = component.find('recordViewForm');
        var recordEditForm = component.find('recordEditForm');
        if(name == 'edit'){
                        
        }
        else if(name == 'save')
        {
            helper.saveContacts(component, event, helper);
        }
         
    },
    
    saveContacts: function(component, event, helper){
        var contactList = compnent.get('v.contactList');
        var recordViewForm = component.find('recordViewForm');
        var recordEditForm = component.find('recordEditForm');
        var saveAction = component.get('c.saveContactList');
        var toastEvent = $A.get('e.force:showToast');
        saveAction.setParams({
            contactList: contactList
        });
        saveAction.setCallback(this, function(response){
            var state =  response.getState();
            if(state === 'SUCCESS'){
                var dataMap = response.getState();
                // one app component container
                // runs inside one only 
                
                if(dataMap.status == 'success'){
                    $A.util.addClass(recordEditForm, 'formHide');
                    $A.util.removeClass(recordViewForm, 'formHide');
                    btn.set('v.name', 'edit');
                    btn.set('v.label', 'Edit');
                    toastEvent.setParams({
                        'title' :  'success',
                        'type' : 'success',
                        'mode' : 'dismissable',
                        'message' : dataMap.message
                    });
                    toastEvent.fire();
                }
                else if(dataMap.status == 'error'){
                    $A.util.addClass(recordEditForm, 'formHide');
                    $A.util.removeClass(recordViewForm, 'formHide');
                    btn.set('v.name', 'edit');
                    btn.set('v.label', 'Edit');
                    toastEvent.setParams({
                        'title' :  'Error!',
                        'type' : 'error',
                        'mode' : 'dismissable',
                        'message' : dataMap.message
                    });
                    toastEvent.fire();
                }
            }
            else
            {
                alert('Error in getting data');                
            }
        })
    }
})