App = require('./../public/javascripts/todos')

task = null
Task = App.Task

# Tasks = App.Tasks
tasks = App.tasks

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

describe 'Tasks', ->
  it 's model is Task', ->
    tasks.should.have.property('model').obj.name.should.equal('Task')

  it 'finds completed tasks', ->
    aye = new Task(name: 'aye', id: tasks.length)
    aye.save()

    bee = new Task(name: 'bee', id: tasks.length)
    bee.save()
    bee.toggleStatus()

    cee = new Task(name: 'cee', id: tasks.length)
    cee.toggleStatus()
    cee.save()

    tasks.should.include(bee)

    tasks.completed().should.include(bee)
