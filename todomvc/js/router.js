

//router for Todos
Todos.Router.map(function(){
    this.resource('todos', {'path': '/'}); //detect when the URL matches '/' and render the 'todos' template
});