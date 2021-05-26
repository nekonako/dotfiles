local naughty = require("naughty")
if awesome.startup_errors then
	naughty.notify({
    preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors
  })
end

do
	local in_error = false
	awesome.connect_signal("debug::error", function(e)
    if in_error then
      return
    end
    in_error = true
    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(e)
    })
    in_error = false
  end)
end
