--***********************************************
--** Author: github.com/Exodus
--***********************************************

require "Recipecode"
require "XpSystem/XpUpdate"

ExoRecipes = ExoRecipes or {};
ExoRecipes.OnGiveXP = {};
ExoRecipes.OnCreate = {};
ExoRecipes.OnTest = {};

function ExoRecipes.OnGiveXP.Tailoring15(ExoRecipes, ingredients, result, player)
  player:getXp():AddXP(Perks.Tailoring, 15)
end

ExoGive15TailoringXP = ExoRecipes.OnGiveXP.Tailoring15