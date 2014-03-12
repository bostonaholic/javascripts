class MixpanelMock
  track: () ->
    console.log("mixpanel.track", arguments)

window.mixpanel = new MixpanelMock()
