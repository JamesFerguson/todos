App = require('./../public/javascripts/todos')

task = null
Task = App.Task

# Tasks = App.Tasks

describe 'Task', ->
  before ->
    task = new Task()

  it 's status defaults to incomplete', ->
    task.get('status').should.equal('incomplete')

  it 'is not complete when it is incomplete', ->
    task.isComplete().should.be.false

  it 's status is not what it was before after toggling', ->
    oldStatus = task.get('status')
    task.toggleStatus()
    task.get('status').should.not.equal(oldStatus)

# describe 'Tasks', ->
#   it 's model is Task', ->
#     tasks = new Tasks()
#     tasks.should.have.property('model').obj.should.be.an.instanceof(Task)
