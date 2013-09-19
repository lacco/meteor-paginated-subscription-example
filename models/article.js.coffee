@Models = {}
Models.Articles = new Meteor.Collection("articles")

# Converts given sort key into something for mongodb
Models.Articles.sortKey = (key) ->
  switch key
    when "created_at" then {created_at: -1}
    when "priority" then {priority: -1}
    else console.error("Unknown sort key #{filters.channel.sortBy}")

