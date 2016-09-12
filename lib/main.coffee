meta = require '../package.json'

module.exports =
  activate: (state) ->
    require('atom-package-deps').install(meta.name)

    {CompositeDisposable} = require 'atom'

    if atom.inDevMode()
       atom.notifications.addInfo("You're now in developer mode", dismissable: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-workspace', 'open-in-developer-mode:toggle': => @toggleDevMode()
    @subscriptions.add atom.commands.add 'atom-workspace', 'open-in-developer-mode:reopen-file-in-dev-mode': => @enableDevMode()
    @subscriptions.add atom.commands.add 'atom-workspace', 'open-in-developer-mode:reopen-file-in-normal-mode': => @disableDevMode()

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
