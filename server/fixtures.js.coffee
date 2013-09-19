Meteor.startup ->
  return if Models.Articles.find().count() > 0

  console.log "Loading fixtures"

  makeTitle = ->
    text = "";
    possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for i in [0...4]
      text += possible.charAt(Math.floor(Math.random() * possible.length))

    return text

  for i in [1..1000]
    Models.Articles.insert(
      title: "#{makeTitle()} ##{i}"
      description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
      priority: Math.floor((Math.random()*10))
      created_at: moment().subtract('days', Math.floor((Math.random()*1000))).toDate()
    )
