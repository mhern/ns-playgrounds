

//router for Todos
Todos.Router.map(function(){
    this.resource('todos', {'path': '/'}); //detect when the URL matches '/' and render the 'todos' template
});

//add class for custom behavior: return all existing todos
Todos.TodosRoute = Ember.Route.extend({
    model : function(){
        return this.store.find('todo');
    }
});