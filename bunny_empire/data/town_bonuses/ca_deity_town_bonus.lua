local DeityTownBonus = require 'stonehearth.data.town_bonuses.deity_town_bonus'

local NaDeityTownBonus = class(DeityTownBonus)

local RECIPES_TO_UNLOCK = {
}

local RECIPE_UNLOCK_BULLETIN_TITLES = {
}

function NaDeityTownBonus:initialize()
   self[DeityTownBonus]._sv = self._sv
   self[DeityTownBonus]:initialize(self)

   self._sv.player_id = nil
   self._sv.display_name = 'i18n(bunny_empire:entities.decoration.shrine_stag.shrine_stag.display_name)'
   self._sv.description = 'i18n(bunny_empire:data.gm.campaigns.town_progression.shrine_choice.deity.description)'
end

function NaDeityTownBonus:create(player_id)
   self._sv.player_id = player_id
end

function NaDeityTownBonus:get_recipe_unlocks()
   return RECIPES_TO_UNLOCK, RECIPE_UNLOCK_BULLETIN_TITLES
end

return NaDeityTownBonus
