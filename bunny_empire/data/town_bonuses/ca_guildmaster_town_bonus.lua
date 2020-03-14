local GuildmasterTownBonus = require 'stonehearth.data.town_bonuses.guildmaster_town_bonus'

local NaGuildmasterTownBonus = class(GuildmasterTownBonus)

local RECIPES_TO_UNLOCK = {
}

local RECIPE_UNLOCK_BULLETIN_TITLES = {
}

function NaGuildmasterTownBonus:initialize()
   self[GuildmasterTownBonus]._sv = self._sv
   self[GuildmasterTownBonus]:initialize(self)

   self._sv.player_id = nil
   self._sv.display_name = 'i18n(bunny_empire:entities.decoration.shrine_hare.shrine_hare.display_name)'
   self._sv.description = 'i18n(bunny_empire:data.gm.campaigns.town_progression.shrine_choice.guildmaster.description)'
end

function NaGuildmasterTownBonus:create(player_id)
   self._sv.player_id = player_id
end

function NaGuildmasterTownBonus:get_recipe_unlocks()
   return RECIPES_TO_UNLOCK, RECIPE_UNLOCK_BULLETIN_TITLES
end

return NaGuildmasterTownBonus
