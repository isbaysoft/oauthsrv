$(document).ready ->
  if $("#megatabs a").size() > 0
    tabs = []
    hash = window.location.hash.split("#").slice("1")
    $("#megatabs a").each (i) ->
      tabs.push $(this).attr("href")

    if tabs.indexOf("#" + hash[0]) >= 0
      $("#megatabs a[href=\"#" + hash[0] + "\"]").tab "show"
    else
      $("#megatabs a:first").tab "show"
    $("#megatabs a").click (e) ->
      window.location.hash = $(this).attr("href")