Handlebars.registerHelper 'formatDateTime', ( date ) ->
  return "" unless date

  new Handlebars.SafeString("<span title='#{moment(date).format('LLL')}'>#{moment(date).fromNow()}</span>")
