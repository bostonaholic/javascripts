describe 'DoubleLinkNode', ->
  describe 'constructor', ->
    Given -> @subject = new DoubleLinkNode('foo')
    Then  -> @subject.data == 'foo'
    Then  -> @subject.previous == undefined
    Then  -> @subject.next == undefined

  describe '#appendToTail', ->
    Given -> @subject = new DoubleLinkNode('foo')

    context 'once', ->
      When -> @subject.appendToTail('bar')
      Then -> @subject.next.data == 'bar'
      And  -> @subject.next.previous.data == 'foo'
      And  -> @subject.next.next == undefined

    context 'twice', ->
      When -> @subject.appendToTail('bar')
      When -> @subject.appendToTail('baz')
      Then -> @subject.next.next.data == 'baz'
      And  -> @subject.next.next.previous.data == 'bar'
      And  -> @subject.next.next.next == undefined
