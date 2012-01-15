App = require('./../public/javascripts/todos')

task = aye = bee = cee = null
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

  describe 'search methods', ->
    before ->
      aye = new Task(name: 'aye', id: tasks.length)
      aye.save()

      bee = new Task(name: 'bee', id: tasks.length)
      bee.save()
      bee.toggleStatus()

      cee = new Task(name: 'cee', id: tasks.length)
      cee.toggleStatus()
      cee.save()

    it 'finds tasks', ->
      tasks.should.include(aye)
      tasks.should.include(bee)
      tasks.should.include(cee)

    it 'finds completed tasks', ->
      tasks.completed().should.not.include(aye)
      tasks.completed().should.include(bee)
      tasks.completed().should.include(cee)

    it 'finds incomplete tasks', ->
      tasks.incomplete().should.include(aye)
      tasks.incomplete().should.not.include(bee)
      tasks.incomplete().should.not.include(cee)

