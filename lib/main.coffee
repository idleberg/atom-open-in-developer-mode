meta = require '../package.json'

module.exports =
  activate: (state) ->
    {CompositeDisposable} = require 'atom'

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-workspace', 'open-in-developer-mode:toggle': => @toggleDevMode()
    @subscriptions.add atom.commands.add 'atom-workspace', 'open-in-developer-mode:open': => @openDevMode()

  deactivate: ->
    @subscriptions?.dispose()
    @subscriptions = null

  toggleDevMode: () ->
    paths = @getPaths()

    if paths.length is 0
      atom.commands.dispatch(atom.views.getView(atom.workspace), 'application:open-dev')
      return

    if atom.inDevMode()
      atom.open({ pathsToOpen: paths, newWindow: true, devMode: false })
    else
      atom.open({ pathsToOpen: paths, newWindow: true, devMode: true })

    atom.close()

  openDevMode: () ->
    if atom.inDevMode()
      atom.notifications.addInfo("You're already in Developer Mode", dismissable: false)
      return

    atom.open({ pathsToOpen: @getPaths(), newWindow: true, devMode: true })

  getPaths: () ->
    projectPaths = atom.project.getPaths()
    return projectPaths if projectPaths?

    editorPath = atom.workspace.getActiveTextEditor()?.getPath()
    return editorPath if editorPath?

    atom.beep()
