describe "CookieManager", ->
  describe "#set", ->
    Given -> @subject = CookieManager
    When -> @subject.set 'first', 42
    Then -> expect(document.cookie).toBe("first=42")
