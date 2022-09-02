--***********************************************
--** Author: github.com/Exodus
--***********************************************

require "Recipecode"
require "XpSystem/XpUpdate"

ExoRecipes = ExoRecipes or {};
ExoRecipes.OnGiveXP = {};
ExoRecipes.OnCreate = {};
ExoRecipes.OnTest = {};

-- We want to destroy the Flint Knife if it's used
-- but not if there's a more durable knife
function ExoRecipes.OnCreate.ExoDestroyFlintKnife(items, result, player)
  local inv = player:getInventory();
  local keepFlint = false;

  -- Check in inventory if there's any knife to keep so we don't destroy the Flint Knife
  if inv:containsTypeRecurse("HuntingKnife") or inv:containsTypeRecurse("KitchenKnife") or inv:containsTypeRecurse("Scissors") then
    keepFlint = true;
  end

  -- Check the inventory for the Flint Knife if there's no other knife and delete it
  if inv:containsTypeRecurse("FlintKnife") and not keepFlint then
    local item = inv:getFirstTypeRecurse("FlintKnife");
    inv:DoRemoveItem(item);
  end
end


function ExoRecipes.OnGiveXP.Tailoring15(ExoRecipes, ingredients, result, player)
  player:getXp():AddXP(Perks.Tailoring, 15);
end

ExoGive15TailoringXP = ExoRecipes.OnGiveXP.Tailoring15;
ExoDestroyFlintKnife = ExoRecipes.OnCreate.ExoDestroyFlintKnife;