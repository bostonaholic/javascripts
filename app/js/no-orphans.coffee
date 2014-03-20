# usage:
#   Orphans.remove('article p');
window.Orphans =
  remove: (selector) ->
    $(selector).each (n,obj) ->
      $(obj).html $(obj).html().replace(/(\s)(\w+\)?\.)$/g, '&nbsp;$2')
