

//router for Todos
Todos.Router.map(function(){
    this.resource('todos',
        {'path': '/'}, //detect when the URL matches '/' and render the 'todos' template
        function(){
            //additional child routes
            this.route('active');
            this.route('completed');
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

//corresponds with todos.active route
Todos.TodosActiveRoute = Ember.Route.extend({
    //model for this route is the collection of todos whose isCompleted property is false
    //when a todo's isCompleted property changes, this collection will automatically update to add or remove the todo
    model : function(){
        return this.store.filter('todo', function(_todo){
            return !_todo.get('isCompleted');
        });
    },
    //normally transitioning to a new route changes the template rendered into the parent {{outlet}},
    //but since we want to reuse the template 'todos/index' just updating the list of todos to render based on model,
    //we implement the renderTemplate method and call render with the desired template and controller
    renderTemplate : function(_controller){
        this.render('todos/index', {controller: _controller});
    }
});

//corresponds with todos.completed route
Todos.TodosCompletedRoute = Ember.Route.extend({
    //model for this route is the collection of todos whose isCompleted property is true
    //when a todo's isCompleted property changes, this collection will automatically update to add or remove the todo
    model : function(){
        return this.store.filter('todo', function(_todo){
            return _todo.get('isCompleted');
        });
    },
    //see comment over TodosActiveRoute renderTemplate function
    renderTemplate : function(_controller){
        this.render('todos/index', {controller: _controller});
    }
});