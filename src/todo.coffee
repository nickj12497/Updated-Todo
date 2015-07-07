require './todo.sass'

document.addEventListener 'DOMContentLoaded', ->
  'use strict'
  ref = new Firebase 'https://amber-fire-5590.firebaseio.com'
  todo = new Vue
    el: '#todo'
    data: todos: [ {
      done: false
      content: 'Loading data from Firebase...'
    } ]
    methods:
      addTo: ->
        if document.getElementById('newTodo').value isnt ''
            ref.push
            done: false
            content: document.getElementById('newTodo').value
            document.getElementById('newTodo').value = ''
      clearCompleted: ->
        _.each todo.$get('todos'), (t, todoKey) ->
          if t and t.done
            ref.child(todoKey).remove()
      madeDone: ->
        ref.child('done').set({done: true})

  ref.on 'value', (snapshot) ->
    todo.$set 'todos', snapshot.val()