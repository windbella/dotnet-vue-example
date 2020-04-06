const path = require('path');
const fs = require('fs-extra');

const src = path.join(__dirname, '../dist');
const dest = path.join(__dirname, '../../server/wwwroot');

fs.remove(dest).then(() => fs.copy(src, dest)).then(() => console.log('Copy complete.'));
