describe "HashTable", ->
  Given -> @subject = new HashTable()

  describe "#set and #get", ->
    When -> @subject.set("foo", "bar")
    Then -> @subject.get("foo") == "bar"

    When -> @subject.set("baz", "quxx")
    Then -> @subject.get("baz") == "quxx"

    context "setting existing keys", ->
      When -> @subject.set("foo", "foo")
      Then -> @subject.get("foo") == "foo"
      Then -> @subject.size() == 2

  describe "#size", ->
    When -> @subject.set("foo", "bar")

    context "adding one item", ->
      Then -> @subject.size() == 1

    context "adding multiple items", ->
      When -> @subject.set("baz", "quxx")
      Then -> @subject.size() == 2
