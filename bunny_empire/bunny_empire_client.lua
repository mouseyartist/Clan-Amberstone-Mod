bunny_empire = {
   constants = require 'constants'
}
local player_service_trace = nil

local function check_override_ui(players, player_id)
   --Load ui mod
   if not player_id then
      player_id = _radiant.client.get_player_id()
   end
   
   local client_player = players[player_id]
   if client_player then
      if client_player.kingdom == "bunny_empire:kingdoms:bunny_empire" then
         -- hot load ca ui mod
         _radiant.res.apply_manifest("/bunny_empire/ui/manifest.json")
      end
   end
end

local function trace_player_service()
   _radiant.call('stonehearth:get_service', 'player')
      :done(function(r)
         local player_service = r.result
         check_override_ui(player_service:get_data().players)
         player_service_trace = player_service:trace('northern alliance ui change')
               :on_changed(function(o)
                     check_override_ui(player_service:get_data().players)
                  end)
         end)
end

radiant.events.listen(bunny_empire, 'radiant:init', function()
   radiant.events.listen(radiant, 'radiant:client:server_ready', function()
         trace_player_service()
      end)
   end)

return bunny_empire
