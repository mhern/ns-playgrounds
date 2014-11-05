
//coupled with itemController todo
Todos.TodoController = Ember.ObjectController.extend({
    actions : {
        editTodo : function(){
            this.set('isEditing', true);
        },
        acceptChanges : function(){
            this.set('isEditing', false);

            if(Ember.isEmpty(this.get('model.title')))//if the title was set to the empty string, remove
                this.send('removeTodo');
            else
                this.get('model').save();
        },
        removeTodo : function(){
            var todo = this.get('model');
            todo.deleteRecord();
            todo.save();
        }
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