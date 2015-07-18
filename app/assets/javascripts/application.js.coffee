# *************************************
#
#   application.js
#
#
# *************************************
#= require _plugins
#= require _app-base

# Now 和 Favorite 兩個 Tab 的切換 function
Baozi.tabSelectorInit = ->
  tabsWrapper = $('.tab-btn-wrapper')
  mainContentWrapper = $('.main-content-wrapper')
  nowBtn = tabsWrapper.find('.now')
  favBtn = tabsWrapper.find('.favorite')

  favBtn.on 'click', ->
    mainContentWrapper.addClass('fav-actived')
  nowBtn.on 'click', ->
    mainContentWrapper.removeClass('fav-actived')

