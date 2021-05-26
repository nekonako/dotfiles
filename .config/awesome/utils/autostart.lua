local awful = require('awful')

do
   local cmds = {
      -- "redshift",
      "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &",
      "mpd &",
       -- "sh /home/nako/screen.sh"
   }
   for _,i in pairs(cmds) do
      awful.spawn.with_shell(i .. "&")
   end
end
