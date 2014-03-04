class MixpanelMock
  track: (eventString) ->
    console.log("Mixpanel:", eventString)

window.mixpanel = new MixpanelMock()
