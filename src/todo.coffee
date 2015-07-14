require './todo.sass'

document.addEventListener 'DOMContentLoaded', ->
  'use strict'

  ref = new Firebase 'https://amber-fire-5590.firebaseio.com'
  
  todo = new Vue
    el: '#todo'
    data:
      todos: [
        done: false
        content: 'Loading data from Firebase...'
      ]
    methods:
      #
      # Adds todo to list
      #
      addTo: ->
        newTodo = document.getElementById('newTodo').value 
        if newTodo.trim() isnt ''
          ref.push
            done: false
            content: newTodo
          newTodo = ''
      #
      # Removes all the todos that are done.
      #
      clearCompleted: ->
        _.each todo.$get('todos'), (t, todoKey) ->
          if t and t.done
            ref.child(todoKey).remove()
  ref.on 'value', (snapshot) ->
    todo.$set 'todos', snapshot.val()