var webpack = require('webpack')
var path = require('path')

module.exports = {
	entry: {
		app: './javascript/components/ReceiptForm.js'
	},
	output: {
		fileName: 'build/bundle.js',
		sourceMapFilename: 'build/bundle.map'
	},

	devtool: '#source-map',
	module: {
		loaders: [
			{
				loader:'babel',
				exclude: /(node_modules)/,
				query: {
					presents: ['react', 'es2015']
				}
			}
		]
	}
}