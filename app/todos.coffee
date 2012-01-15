Backbone = require('./backbone')
_ = require('./underscore')._

class Task extends Backbone.Model
  initialize: ->
    @set 'status': 'incomplete'

  isComplete: ->
    @get('status') == 'completed'

  save: ->
    tasks.add(this)

  toggleStatus: ->
    if @get('status') == 'incomplete'
      @set('status': 'completed')
    else
      @set('status': 'incomplete')
    tasks.trigger('status-changed')

module.exports.Task = Task

class Tasks extends Backbone.Collection
  model: Task
  # url: '/tasks'

  completed: ->
    _.select @models, (model) ->
      model.get('status') == 'completed'

  incomplete: ->
    _.select @models, (model) ->
      model.get('status') == 'incomplete'

tasks = new Tasks()
module.exports.tasks = tasks
# module.exports.Tasks = Tasks
