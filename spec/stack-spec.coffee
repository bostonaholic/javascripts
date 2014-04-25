describe 'Stack', ->
  describe 'constructor', ->
    Given -> @subject = new Stack()
    Then  -> @subject != undefined

  describe '#push', ->
    Given -> @subject = new Stack()

    context 'once', ->
      When -> @subject.push('foo')
      Then -> @subject.length == 1

    context 'twice', ->
      When -> @subject.push('foo')
      When -> @subject.push('bar')
      Then -> @subject.length == 2

  describe '#pop', ->
    Given -> @subject = new Stack()
    Given -> @subject.push('foo')
    When  -> @result = @subject.pop()
    Then  -> @result == 'foo'
