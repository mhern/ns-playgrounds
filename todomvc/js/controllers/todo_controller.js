
//place the function outside of controller so that it can be passed to debounce
//otherwise debounce tries to look up string and doesn't search under actions
//we really want this.send('removeTodo'), but since said statement cannot be placed in the debounce
//this is a workaround
var removeTodo = function(){
    var todo = this.get('model');
    todo.deleteRecord();
    todo.save();
};

//coupled with itemController todo
Todos.TodoController = Ember.ObjectController.extend({
    actions : {
        editTodo : function(){
            this.set('isEditing', true);
        },
        acceptChanges : function(){
            this.set('isEditing', false);

            if(Ember.isEmpty(this.get('model.title')))//if the title was set to the empty string, remove
                Ember.run.debounce(this, removeTodo, 0);    //use debounce for the case in which user presses enter and both event handlers are called
            else
                this.get('model').save();
        },
        removeTodo : removeTodo
    },

    isEditing : false,

    isCompleted : function(_key, _value){
        var model = this.get('model');

        //get (read on init)
        if(_value === undefined)
            return model.get('isCompleted');
        //set
        else
        {
            model.set('isCompleted', _value);
            model.save();
            return _value;
        }
    }.property('model.isCompleted') //makes todo.isCompleted a computed property
});