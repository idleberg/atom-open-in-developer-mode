
import { getPaths } from './util';
import Logger from './log';

function openDevMode(): void {
  if (atom.inDevMode()) {
    atom.notifications.addInfo("You're already in Developer Mode", {
      dismissable: false
    });

    return;
  }

  const pathsToOpen = getPaths();
  Logger.log('Opening paths developer mode', pathsToOpen);

  return atom.open({
    pathsToOpen: pathsToOpen,
    newWindow: false,
    devMode: true
  });
}

function toggleDevMode(): void {
  const pathsToOpen = getPaths();

  if (!pathsToOpen?.length) {
    atom.commands.dispatch(atom.views.getView(atom.workspace), 'application:open-dev');
    return;
  }

  Logger.log(`Opening paths ${!atom.inDevMode() ? 'normal' : 'developer'} mode`, pathsToOpen);

  atom.open({
    pathsToOpen: pathsToOpen,
    newWindow: false,
    devMode: !atom.inDevMode()
  });

  // return atom.close();
}

export {
  openDevMode,
  toggleDevMode
};
