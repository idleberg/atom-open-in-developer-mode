import { CompositeDisposable } from 'atom';
import { openDevMode, toggleDevMode } from './commands';
import Logger from './log';

const OpenInDeveloperMode = {
  subscriptions: new CompositeDisposable(),

  activate(): void {
    Logger.log('Activating package');

    this.subscriptions.add(
      atom.commands.add("atom-workspace", {
        'open-in-developer-mode:open': () => {
          openDevMode();
        }
      }),
      atom.commands.add("atom-workspace", {
        'open-in-developer-mode:toggle': () => {
          toggleDevMode();
        }
      })
    );
  },

  deactivate(): void {
    Logger.log('Deactivating package');

    this.subscriptions?.dispose();
  }
};

export default OpenInDeveloperMode;
