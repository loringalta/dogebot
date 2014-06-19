# Description:
#   Random jokes from /r/dadjokes
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot dadjoke - Pull a random joke from /r/jokes
#
# Author:
#   tombell

module.exports = (robot) ->

  robot.respond /dadjoke/i, (msg) ->
    msg.http('http://www.reddit.com/r/dadjokes.json')
      .get() (err, res, body) ->
        try
          data = JSON.parse body
          children = data.data.children
          joke = msg.random(children).data


          joketext = joke.selftext.replace(/^\.\.\.\s*/, '')

          msg.send joketext.trim()

        catch ex
          msg.send "Erm, something went EXTREMELY wrong - #{ex}"
