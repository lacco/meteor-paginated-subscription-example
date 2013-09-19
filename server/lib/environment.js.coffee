Meteor.publish 'articles', (filters, limit) ->
  sort = Models.Articles.sortKey(filters.sortBy)

  Models.Articles.find({}, {sort: sort, limit: limit})

