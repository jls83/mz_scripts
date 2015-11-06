module.exports = (robot) ->
    robot.respond /file (.*)/i, (msg) ->
        query_file = escape(msg.match[1])
        token = 'xoxp-10226960290-10226641846-10920121635-5cb752eb47'
        api_request = "https://slack.com/api/search.files?token=#{token}&query=#{query_file}&pretty=1"
        msg.http(api_request)
            .get() (err, res, body) ->
                try
                    json = JSON.parse(body)
                    if json.ok
                        msg.send "Number of files matched: #{json.files.total}"
                        if json.files.matches
                            msg.send json.files.matches[0].title
                        else
                            msg.send 'No matches'
                        #msg.send "File name: #{json.files.matches.name}"
                    else
                        msg.send api_request
                catch error
                    msg.send "There was an error! #{err}"
