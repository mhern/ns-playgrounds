
//create a new class called "Todo" within application namespace
//with the included attributes
Todos.Todo = DS.Model.extend({
    title: DS.attr('string'),
    isCompleted: DS.attr('boolean')
});

//add fixture data for now
Todos.Todo.FIXTURES = [
    {
        id: 1,
        title: 'Learn Ember.js',
        isCompleted: true
    },
    {
        id: 2,
        title: '...',
        isCompleted: false
    },
    {
        id: 3,
        title: 'Profit!',
        isCompleted: false
    }
];