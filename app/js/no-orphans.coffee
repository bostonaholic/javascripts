# usage:
#   Orphans.remove('article p');
window.Orphans =
  remove: (selector) ->
    $(selector).each (n,obj) ->
      $(obj).html $(obj).text().replace(/(\s)(\w+\)?\.\s*)/g, '&nbsp;$2')
