import Logger from './log';

function getPaths(): readonly string[] {
  const projectPaths = atom.project.getPaths();

  if (projectPaths?.length) {
    Logger.log('Found project paths');
    return projectPaths;
  }

  const editorPath = atom.workspace.getActiveTextEditor()?.getPath();

  if (editorPath?.length) {
    Logger.log('Found text editor path');
    return [ editorPath ];
  }

  Logger.warn('No paths founds');
  return [];
}

export {
  getPaths
};
