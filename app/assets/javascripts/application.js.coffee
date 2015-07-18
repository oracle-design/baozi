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

# 選擇包子的 function
Baozi.baoziSelectorInit = ->
  baoziList = $('.baozi-list-wrapper .baozi-list')

  baoziList.on 'click', '.baozi-unit', ->
    # console.log('test')
    baoziList.find('.actived').removeClass('actived')
    $(@).addClass('actived')
  # todo: ajax
