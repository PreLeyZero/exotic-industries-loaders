function reapply_research(force, research) 
	if force.technologies[research] and force.technologies[research].researched then
		for _, effect in pairs(force.technologies[research].effects) do
			if effect.type == "unlock-recipe" then force.recipes[effect.recipe].enabled = true end
		end
	end
end

for _, force in pairs(game.forces) do
	reapply_research(force, "logistics")
  reapply_research(force, "logistics-2")
  reapply_research(force, "logistics-3")
end