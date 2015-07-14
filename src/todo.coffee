require './todo.sass'

document.addEventListener 'DOMContentLoaded', ->
  'use strict'

  newTodo = document.getElementById('newTodo').value
  ref = new Firebase 'https://amber-fire-5590.firebaseio.com'
  
  todo = new Vue
    el: '#todo'
    data:
      #The displayed list 
      todos: [
        done: false
        content: 'Loading data from Firebase...'
      ]
    methods:
      #Takes the input box and pushes it to Firebase
      addTo: -> 
        if newTodo.trim() isnt ''
          ref.push
            done: false
            content: newTodo
          newTodo = ''
      #Removes all the todos that are done.
      clearCompleted: ->
        _.each todo.$get('todos'), (t, todoKey) ->
          if t and t.done
            ref.child(todoKey).remove()
  ref.on 'value', (snapshot) ->
    todo.$set 'todos', snapshot.val()