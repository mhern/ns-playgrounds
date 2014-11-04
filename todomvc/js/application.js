

//create application
window.Todos = Ember.Application.create();

//ApplicationAdapter communicates with the source of data for app;
//FixtureAdapter is an adapter designed to load fixture data
Todos.ApplicationAdapter = DS.FixtureAdapter.extend();