@CookieManager =
  enabled: ->
    return true if navigator.cookieEnabled

    test = this.set('_', '_').get('_') == '_'
    @remove('_')
    return test

  set: (name, value, expiresIn) ->
    if expiresIn
      date = new Date()
      date.setTime(date.getTime()+expiresIn)
      expires = "; expires=#{date.toGMTString()}"
    document.cookie="#{name}=#{value}#{expires if expires}"

  get: (item) ->
    document.cookie.replace(///(?:(?:^|.*;\s*)#{item}\s*\=\s*([^;]*).*$)|^.*$///, "$1")

  all: ->

  remove: (item) ->

  empty: ->
