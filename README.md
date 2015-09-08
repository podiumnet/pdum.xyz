[![Build Status](https://travis-ci.org/podiumnet/podium.svg?branch=master)](https://travis-ci.org/podiumnet/podium)
[![Stories in Ready](https://badge.waffle.io/podiumnet/podium.svg?label=ready&title=Ready)](http://waffle.io/podiumnet/podium)
# Podium
Podium is a great social network dedicated to bringing all online social activity to one place.
We are the one network to rule them all.
Ironically, since we aren't ready for action yet, we post updates on twitter under [@podium_snw](https://twitter.com/podium_snw).

** Our Case Against Many Networks: **
What's the point of having Twitter *and* Instagram if the former has the same features as the latter, and more?
Using both is just bringing conversations further apart - one network would be much better for bringing the world together.

As a company, podium is a subsidiary controlled by [VKHSoft](http://vkhsoft.cu.cc). We don't just make the social network, we have other side projects that are only in the planning stage.

## Project Dependencies

### Podium-Specific
* [podium-data-backend](https://github.com/podiumnet/podium-data-backend) is used for the server-side logic (accounts, sessions, posting, etc.) of podium.

### Made by Podium for Podium
* [ecostat](https://github.com/podiumnet/ecostat) is used for serving embedded coffeescript files.

### Third-Party
* [Express.JS](http://expressjs.com) is used for the web server.
* [cookie-parser](https://github.com/expressjs/cookie-parser) is used for browser cookies.
* [node-mysql](https://github.com/felixge/node-mysql) is used for MySQL database communications.
* [node_hash](https://github.com/fabriziomoscon/node-hash) is used for password hashing. *
* [socket.io](http://socket.io) is used for server-client communications. *

\*: Transitioning away in favor of ecostat.

## Contribute to Podium
We will evaluate contributions submitted as pull requests, and accept those that
are beneficial to the service.
