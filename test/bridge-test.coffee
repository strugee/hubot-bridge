Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('./src')

describe 'bridge', ->
	beforeEach ->
		process.env.HUBOT_BRIDGE_USER = 'bridge-user'

		@room = helper.createRoom(httpd: false)

	it 'responds to hear test', ->
		@room.user.say('alice', 'hear test').then =>
			expect(@room.messages).to.eql [
				['alice', 'hear test']
				['hubot', '@alice hear response']
			]

	it 'responds to ping', ->
		@room.user.say('bob', '@hubot ping').then =>
			expect(@room.messages).to.eql [
				['bob', '@hubot ping']
				['hubot', '@bob PONG']
			]

	it 'responds to hear test coming through the bridge', ->
		@room.user.say('bridge-user', '[charlie] hear test').then =>
			expect(@room.messages).to.eql [
				['bridge-user', '[charlie] hear test']
				['hubot', '@charlie hear response']
			]

	it 'responds to ping coming through the bridge', ->
		@room.user.say('bridge-user', '[david] @hubot ping').then =>
			expect(@room.messages).to.eql [
				['bridge-user', '[david] @hubot ping']
				['hubot', '@david PONG']
			]
