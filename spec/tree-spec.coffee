describe "Tree", ->
  Given -> @subject = new Tree(0)

  describe "#addChild", ->
    describe "first initialized", ->
      Then -> @subject.children.length == 0

    describe "two children added", ->
      When -> @subject.addChild(new Tree(1))
      And  -> @subject.addChild(new Tree(2))
      Then -> @subject.children.length == 2

  describe "#copy", ->
    Given -> @subject.addChild(new Tree(1))
    Given -> @subject.addChild(new Tree(2))

    When -> @subjectCopy = @subject.copy()

    Then -> @subjectCopy.root == 0
    And  -> @subjectCopy.children.length == 2
    And  -> @subjectCopy.children[0].root == 1
    And  -> @subjectCopy.children[1].root == 2

    describe "it is in fact a copy", ->
      When -> @subject.addChild(new Tree(3))
      Then -> @subject.children.length == 3
      
  describe "#equals", ->
    Given -> @other = new Tree(0)

    describe "same children", ->
      Given -> @subject.addChild(new Tree(1))
      Given -> @other.addChild(new Tree(1))
      Then  -> @subject.equals(@other) == true

    describe "different number of children", ->
      Given -> @subject.addChild(new Tree(1))
      Then  -> @subject.equals(@other) == false

    describe "same number of children but different roots", ->
      Given -> @subject.addChild(new Tree(1))
      Given -> @other.addChild(new Tree(10))
      Then  -> @subject.equals(@other) == false
