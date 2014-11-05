

Todos.EditTodoView = Ember.TextField.extend({
    //called when the element of the view has been inserted into the DOM or after the view was re-rendered
    didInsertElement : function(){
        this.$().focus(); //access jQuery property, apply focus
    }
});

//register as helper so this can be used in handlebars templates
Ember.Handlebars.helper('edit-todo', Todos.EditTodoView);