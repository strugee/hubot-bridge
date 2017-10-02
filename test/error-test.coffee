Helper = require('hubot-test-helper')
chai = require 'chai'
sinon = require 'sinon'

expect = chai.expect

helper = new Helper('./src')

describe 'bridge error handling', ->
	beforeEach ->
		@room = helper.createRoom(httpd: false)
		@room.robot.logger.error = sinon.spy @room.robot.logger.error

	it 'logs an error if HUBOT_SOURCE_URL is undefined', ->
		expect(@room.robot.logger.error.called).to.be.true
		expect(@room.robot.logger.error.args[0][0]).to.include 'is not defined'
