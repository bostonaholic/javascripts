describe 'SingleLinkNode', ->
  Given -> @subject = new SingleLinkNode('foo')

  describe 'constructor', ->
    Then  -> @subject.data == 'foo'
    And   -> @subject.next == undefined

  describe '#appendToTail', ->
    context 'once', ->
      When -> @subject.appendToTail('bar')
      Then -> @subject.next.data == 'bar'
      And  -> @subject.next.next == undefined

    context 'twice', ->
      When -> @subject.appendToTail('bar')
      When -> @subject.appendToTail('baz')
      Then -> @subject.next.data == 'bar'
      Then -> @subject.next.next.data == 'baz'

  describe '#deleteNode', ->
    context 'delete second of two nodes', ->
      Given -> @subject.appendToTail('bar')
      When  -> @subject.deleteNode('bar')
      Then  -> @subject.next == undefined

    context 'delete last of many nodes', ->
      Given -> @subject.appendToTail('bar')
      Given -> @subject.appendToTail('baz')
      When  -> @subject.deleteNode('baz')
      Then  -> @subject.next.next == undefined

    context 'delete the middle node', ->
      Given -> @subject.appendToTail('bar')
      Given -> @subject.appendToTail('baz')
      When  -> @subject.deleteNode('bar')
      Then  -> @subject.next.data == 'baz'

    context 'delete the head node', ->
      Given -> @subject.appendToTail('bar')
      When  -> @subject.deleteNode('foo')
      Then  -> @subject.data == 'bar'
      # And   -> @subject.next == undefined
