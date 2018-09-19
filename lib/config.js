const commander = require('commander')
let version = process.env.npm_package_version ? process.env.npm_package_version : '0.0.0'
commander
.version(version)
.option('-u, --url <url>', 'favorite.rocks/live')
.option('-k, --key <key>', 'test')
.option('-p, --path <path>', '/Users/aminabedi/Desktop/freddie.mp4')
.option('-i, --input <input>', 'Input Stream')
.parse(process.argv)

module.exports = commander
