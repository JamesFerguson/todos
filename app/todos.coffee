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
    # @collection.trigger('status-changed')

module.exports.Task = Task

# class Tasks extends Backbone.Collection
#   model: Task

# module.exports.Tasks = Tasks
