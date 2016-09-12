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
    path = atom.workspace.getActiveTextEditor()?.getPath()

    unless path
      atom.beep()
      atom.commands.dispatch(atom.views.getView(atom.workspace), 'application:open-dev')
      return

    if atom.inDevMode()
      @disableDevMode(path)
    else
      @enableDevMode(path)

  enableDevMode: (path) ->
    return if atom.inDevMode()

    path = atom.workspace.getActiveTextEditor()?.getPath() unless path

    unless path
      atom.beep()
      return

    atom.open({ pathsToOpen: path, newWindow: true, devMode: true })
    atom.close()

  disableDevMode: (path) ->
    return unless atom.inDevMode()


    path = atom.workspace.getActiveTextEditor()?.getPath() unless path


    unless path
      atom.beep()
      return

    atom.open({ pathsToOpen: path, newWindow: true, devMode: false })
    atom.close()
