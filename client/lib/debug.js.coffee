Meteor.startup ->
  logRenders = ->
    _.each Template, (template, name) ->
      oldRender = template.rendered
      counter = 0
      template.rendered = ->
        console.log name, "render count: ", ++counter
        oldRender and oldRender.apply(this, arguments)

  logRenders()

