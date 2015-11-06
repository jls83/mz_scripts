module.exports = (robot) ->
    robot.respond /info (.*)/i, (msg) ->
        # Request information in [data] [user] format
        info_query = msg.match[1].split(' ')
        query_user = info_query[1]
        query_data = info_query[0]
        token = process.env.HUBOT_SLACK_TOKEN
        msg.http("https://slack.com/api/users.list?token=#{token}&pretty=1")
            .get() (err, res, body) ->
                try
                    json = JSON.parse(body)
                    if json.ok
                        for i in json.members
                            if i.name is query_user or i.profile.first_name.toLowerCase() is query_user.toLowerCase()
                                if i.profile[query_data]
                                    msg.send "#{query_user}'s #{query_data} is: #{i.profile[query_data]}"
                                else
                                    msg.send "#{i.name} doesn't have that info in their profile"
                                break
                    else
                        msg.send "There was an error with the JSON sync!"
                catch error
                    msg.send "There was an error! #{err}"
