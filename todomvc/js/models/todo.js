
//create a new class called "Todo" within application namespace
//with the included attributes
Todos.Todo = DS.Model.extend({
    title: DS.attr('string'),
    isCompleted: DS.attr('boolean')
});


//this is no longer used since we changed from using the FixtureAdapter to LSAdapter (local-storage)
//example of fixture data that would work with the application's fixture adapter:
// Todos.Todo.FIXTURES = [
//     {
//         id: 1,
//         title: 'Learn Ember.js',
//         isCompleted: true
//     },
//     {
//         id: 2,
//         title: '...',
//         isCompleted: false
//     },
//     {
//         id: 3,
//         title: 'Profit!',
//         isCompleted: false
//     }
// ];