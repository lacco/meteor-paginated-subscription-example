Session.setDefault("articles.filters", {sortBy: "created_at"})

articlesHandle = Meteor.subscribeWithPagination('articles', (-> Session.get("articles.filters")), 40)

selectedArticles = ->
  selArticles = Session.get("articles.selected")
  _.filter(Session.get("articles.current"), (article) -> selArticles[article._id])

updateFilters = (attrs) ->
  filters = Session.get("articles.filters")
  Session.set("articles.filters", $.extend(filters, attrs))

############################################################
########## articles_table
############################################################
Template.articles_table.helpers(
  articles: ->
    return Models.Articles.find({}, {sort: Models.Articles.sortKey(Session.get("articles.filters").sortBy), limit: articlesHandle.limit()})
)

############################################################
########## articles_toolbar
############################################################
Template.articles_toolbar.events(
  "click .sort-by-select button": (e) ->
    updateFilters(sortBy: $(e.target).data("sort-by"))
)

############################################################
########## articles_load_more
############################################################
Template.articles_load_more.helpers(
  articlesReady: ->
    return !articlesHandle.loading()
  allArticlesLoaded: ->
    return !articlesHandle.loading() && Models.Articles.find().count() < articlesHandle.loaded()
)

Template.articles_load_more.events(
  "click .load-more": (e) ->
    e.preventDefault()
    articlesHandle.loadNextPage()
)