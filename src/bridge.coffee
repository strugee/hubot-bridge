# Description
#   Accept Hubot commands that come over a bridge to another chatroom
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Notes:
#   Assumes messages come over the bridge in the following format:
#   `[<user>] <message>`
#
# Author:
#   Alex Jordan <alex@strugee.net>

# Not inline for perf
bridgeRegexp = /\[(.*)\] (.*)/

module.exports = (robot) ->

	robot.receiveMiddleware (context, next, done) ->
		if context.response.message.user.name is 'xmpp-pump'
			result = bridgeRegexp.exec context.response.message.text

			if result
				context.response.message.user.name = result[1]
				context.response.message.text = result[2]
			else
				# TODO: handle this

		next(done)
