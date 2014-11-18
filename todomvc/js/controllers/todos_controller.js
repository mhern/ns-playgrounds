

//Todos Controller, according to Ember Controller naming conventions
Todos.TodosController = Ember.ArrayController.extend({
    actions : {
        clearCompleted : function(){
            var completed = this.filterBy('isCompleted', true); //filterBy returns an instance of EmberArray
            completed.invoke('deleteRecord');                   //invoke is part of the EmberArray API; executes method on each obj in the Array if the method exists on that obj
            completed.invoke('save');
        },
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

    //returns boolean: are there todos where isCompleted is true
    hasCompleted : function(){
        return this.get('completed') > 0;
    }.property('completed'),

    //returns boolean: are all todos completed
    allAreDone : function(_key, _value){
        //get
        if(_value === undefined)
            return !!this.get('length') /* there are todos */ && this.isEvery('isCompleted');
        //set
        else
        {
            this.setEach('isCompleted', _value);
            this.invoke('save');
            return _value;
        }
    }.property('@each.isCompleted'),

    //returns number of todos isCompleted
    completed : function(){
        return this.filterBy('isCompleted', true).get('length');
    }.property('@each.isCompleted'),

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