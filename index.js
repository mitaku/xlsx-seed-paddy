const exec = require('child_process').exec
const glob = require('glob')
const path = require('path')

const {
  VERSION,
  GLOB_TEXT,
  COLUMN_NAMES_ROW,
  DATA_START_ROW
} = process.env;

const DEFAULT_TARGET_VERSION = '9999.9.99'
const DEFAULT_COLUMN_NAMES_ROW = '1'
const DEFAULT_DATA_START_ROW = '2'

function main() {
  let targetVersion = DEFAULT_TARGET_VERSION
  if(VERSION) {
    targetVersion = VERSION
  }

  let columnNamesRow = DEFAULT_COLUMN_NAMES_ROW
  if(COLUMN_NAMES_ROW) {
    columnNamesRow = COLUMN_NAMES_ROW
  }

  let dataStartRow = DEFAULT_DATA_START_ROW
  if(DATA_START_ROW) {
    dataStartRow = DATA_START_ROW
  }

  const configContent = '"' + [
      'column_names_row: ' + columnNamesRow,
      'data_start_row: ' + dataStartRow
  ].join('\n') + '"'

  const xlsx2seedCmd = path.join('node_modules', '.bin', 'xlsx2seed')
  const cmdPrefix = [xlsx2seedCmd, '-R', targetVersion, '-n dummy', '-v version', '-i src', '-o dist', '-C', configContent].join(' ')

  glob(GLOB_TEXT, function(err, files) {
    files.forEach(function(file) {
      const targetFile = path.basename(file)
      const cmd = [cmdPrefix, targetFile].join(' ')
      console.log(cmd)
      exec(cmd, function(error, stdout, stderr) {
        if(stdout){
          console.log('stdout: ' + stdout)
        }
        if(stderr){
          console.log('stderr: ' + stderr)
        }
        if (error !== null) {
          console.log('Exec error: ' + error)
        }
      });
    });
  })
}


module.exports = main
