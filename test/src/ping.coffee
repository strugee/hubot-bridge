# Description
#   Some bogus commands that we need available in the test environment to exercise the middleware

module.exports = (robot) ->

	robot.hear /hear test/i, (res) ->
		res.reply 'hear response'

	robot.respond /ping/i, (res) ->
		res.reply 'PONG'
