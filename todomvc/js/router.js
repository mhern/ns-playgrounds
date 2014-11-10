

//router for Todos
Todos.Router.map(function(){
    this.resource('todos',
        {'path': '/'}, //detect when the URL matches '/' and render the 'todos' template
        function(){
            //additional child routes will go here later
        }
    );
});

//add class for custom behavior: return all existing todos
Todos.TodosRoute = Ember.Route.extend({
    model : function(){
        return this.store.find('todo');
    }
});

//corresponds with todos.index route and todos/index template
Todos.TodosIndexRoute = Ember.Route.extend({
    model : function(){
        return this.modelFor('todos'); //model for this route is the same model as for the TodosRoute
    }
});