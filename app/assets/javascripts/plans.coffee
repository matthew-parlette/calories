# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

console.log "In plan.coffee"

ready = ->
  console.log 'Getting ready...'
  $('input').bind 'change', ->
    refresh()
    return
  refresh()

$(document).ready ->
  ready()

$(document).on 'turbolinks:load', ->
  ready()

refresh = ->
  console.log "Refreshing..."
  $('#calories').text 0
  total = 0
  totalP = 0
  totalC = 0
  totalF = 0
  $('table > tbody > tr.entry').each ->
    # console.log $(this)
    checked = $(this).find('td > input#checked').is(':checked')
    quantity = $(this).find('td > input#quantity').val()
    calories_per = $(this).find('td#calories-per').text()
    p = parseFloat($(this).find('td#protein-per').text()) * quantity
    c = parseFloat($(this).find('td#carbs-per').text()) * quantity
    f = parseFloat($(this).find('td#fat-per').text()) * quantity
    if checked
      calories = quantity * calories_per
      total = total + calories
      totalP = totalP + p
      totalC = totalC + c
      totalF = totalF + f
    else
      calories = 0
    $(this).find('td#calories').text "#{calories} (#{parseInt(p)}p, #{parseInt(c)}c, #{parseInt(f)}f)"
    console.log calories
  total = total + parseInt($('input#additional-calories').val())
  console.log total
  $('#calories').text "#{total} (#{parseInt(totalP)}p, #{parseInt(totalC)}c, #{parseInt(totalF)}f)"
