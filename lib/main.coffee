meta = require '../package.json'

module.exports =
  activate: (state) ->
    {CompositeDisposable} = require 'atom'

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-workspace', 'open-in-developer-mode:toggle': => @toggleDevMode()
    @subscriptions.add atom.commands.add 'atom-workspace', 'open-in-developer-mode:load': => @enableDevMode()
    @subscriptions.add atom.commands.add 'atom-workspace', 'open-in-developer-mode:unload': => @disableDevMode()

  deactivate: ->
    @subscriptions?.dispose()
    @subscriptions = null

  toggleDevMode: () ->
    paths = @getPaths()

    unless paths
      atom.commands.dispatch(atom.views.getView(atom.workspace), 'application:open-dev')
      return

    if atom.inDevMode()
      @disableDevMode(paths)
    else
      @enableDevMode(paths)

  enableDevMode: (paths) ->
    return if atom.inDevMode()

    paths = @getPaths() unless paths

    atom.open({ pathsToOpen: paths, newWindow: true, devMode: true })
    atom.close()

  disableDevMode: (path) ->
    return unless atom.inDevMode()

    paths = @getPaths() unless paths

    atom.open({ pathsToOpen: paths, newWindow: true, devMode: false })
    atom.close()

  getPaths: () ->
    projectPaths = atom.project.getPaths()
    return projectPaths if projectPaths

    editorPath = atom.workspace.getActiveTextEditor()?.getPath()
    return editorPath if editorPath

    atom.beep()
