# hubot-bridge

[![Build Status](https://travis-ci.org/strugee/hubot-bridge.svg?branch=master)](https://travis-ci.org/strugee/hubot-bridge)
[![Coverage Status](https://coveralls.io/repos/github/strugee/hubot-bridge/badge.svg?branch=master)](https://coveralls.io/github/strugee/hubot-bridge?branch=master)
[![Greenkeeper badge](https://badges.greenkeeper.io/strugee/hubot-bridge.svg)](https://greenkeeper.io/)

Accept Hubot commands that come over a bridge to another
chatroom. Assumes bridge messages are in the form:

> [\<username\>] \<message\>

## Installation

In you Hubot project repo, run:

`npm install --save hubot-bridge`

Then add **hubot-bridge** to your `external-scripts.json`:

```json
[
  "hubot-bridge"
]
```

Lastly, configure the username that the bridge user uses by setting
`HUBOT_BRIDGE_USER` in the environment your Hubot runs in.

## License

LGPL 3.0+

## Author

AJ Jordan <alex@strugee.net>
