
//coupled with itemController todo
Todos.TodoController = Ember.ObjectController.extend({
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