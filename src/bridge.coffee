# Description
#	 Accept Hubot commands that come over a bridge to another chatroom
#
# Configuration:
#	 HUBOT_BRIDGE_USER
#
# Notes:
#	 Assumes messages come over the bridge in the following format:
#	 `[<user>] <message>`
#
# Author:
#	 Alex Jordan <alex@strugee.net>

# Not inline for perf
bridgeRegexp = /\[(.*)\] (.*)/

module.exports = (robot) ->

	if not process.env.HUBOT_BRIDGE_USER
		robot.logger.error "HUBOT_BRIDGE_USER is not defined; try: export HUBOT_BRIDGE_USER='bridge-username'"

	robot.receiveMiddleware (context, next, done) ->
		if context.response.message.user.name is process.env.HUBOT_BRIDGE_USER
			result = bridgeRegexp.exec context.response.message.text

			if result
				context.response.message.user.name = result[1]
				context.response.message.text = result[2]
			else
				# TODO: handle this

		next(done)
