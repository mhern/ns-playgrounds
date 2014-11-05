

//Todos Controller, according to Ember Controller naming conventions
Todos.TodosController = Ember.ArrayController.extend({
    actions : {
        createTodo : function(){
            var newTitle = this.get('newTitle'); //property of the template's controller that is set when value attr of input field is changed
            if( !newTitle )
                return false;
            if( !newTitle.trim() )
                return;

            //create a new Todo model
            var todo = this.store.createRecord('todo',
                {
                    title : newTitle,
                    isCompleted : false
                });

            //clear input value
            this.set('newTitle', '');

            //save Todo
            todo.save();
        }
    },

    //returns number of todos !isCompleted
    remaining : function(){
        return this.filterBy('isCompleted', false).get('length');
    }.property('@each.isCompleted'), //if isCompleted on any todo changes, this property will be recomputed

    //in relation to remaining(), returns "item" for one remaining, else "items"
    inflection : function(){
        var remaining = this.get('remaining');
        return 'item' + (remaining === 1 ? '' : 's');
    }.property('remaining')
});