describe "HashTable", ->
  context "default bucket size", ->
    Given -> @subject = new HashTable()

    xcontext "numbers as keys", ->
      describe "one item", ->
        When -> @subject.set(1, "one")
        Then -> @subject.get(1) == "one"
        And  -> @subject.size == 1

      describe "two items in separate buckets", ->
        When -> @subject.set(1, "one")
        When -> @subject.set(36, "thirty six")
        Then -> @subject.get(1) == "one"
        Then -> @subject.get(36) == "thirty six"
        And  -> @subject.size == 2
        And  -> @subject._contents.length == 2

      describe "two items in the same bucket", ->
        Given -> @subject.set(1, "one")
        Given -> @subject.set(2, "two")
        Then  -> @subject.get(1) == "one"
        Then  -> @subject.get(2) == "two"
        Then  -> @subject.size == 2

      describe "setting existing number keys", ->
        When -> @subject.set(1, "one")
        When -> @subject.set(1, "foo")
        Then -> @subject.get(1) == "foo"
        Then -> @subject.size == 1

    context "strings as keys", ->
      describe "multiple keys", ->
        When -> @subject.set("foo", "bar")
        Then -> @subject.get("foo") == "bar"

        When -> @subject.set("baz", "quxx")
        Then -> @subject.get("baz") == "quxx"

      describe "setting existing string keys", ->
        When -> @subject.set("foo", "foo")
        When -> @subject.set("foo", "bar")
        Then -> @subject.get("foo") == "bar"
        Then -> @subject.size == 1

  xcontext "larger buckets", ->
    Given -> @subject = new HashTable(500)

    describe "set two items in separate non-adjacent buckets", ->
      When -> @subject.set(1, "one")
      When -> @subject.set(1000, "one thousand")
      Then -> @subject.get(1) == "one"
      Then -> @subject.get(1000) == "one thousand"
      And  -> @subject.size == 2
      And  -> @subject._contents.length == 3
