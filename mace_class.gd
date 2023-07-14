extends Resource
class_name Mace

var weapon_name = "Mace"
var weapon_damage = 5
var damage_type = "Blunt"


#data order = [type, defense/stacking value, action type, text description]
#Stack: Concuss
#When you build a stack of clubs while wielding a mace, you wallop a target, dealing 5 damage and inflicting them with the Dazed status effect for a number of rounds equal to your Level bonus. If you use Concuss on a target that is already Dazed, they become stunned for the remaining duration. 

#Jack: Follow up
#As an action, you can play this Jack to immediately make a weapon attack against a target that is Dazed. 

#Queen: Crushing Offense
#As an action, you play this Queen and exploit your Dazed foes. The Queen is in play for a number of rounds equal to your Level Bonus, and while it is in play, your weapon attacks have advantage on Dazed targets.

#King: Blackout
#As a reaction to hitting with a weapon attack, you play this King and inflict the target with the Dazed status effect for a number of rounds equal to your Level bonus. If the target is already Dazed, you instead stun them until the end of their next turn.

#Ace: Flanged Whirlwind
#As an action, you play this Ace. Every Dazed or Stunned target of your choice takes 5 damage, and you gain the Enraged status effect until the end of your next turn. 


enum {mace_two=2, mace_three, mace_four, mace_five, mace_six, mace_seven, mace_eight, mace_nine, mace_ten, mace_jack, mace_queen, mace_king, mace_ace}

const data = {
	mace_two : 
		["Stacker", 2, "Action", "Increases your weapon stack"],
	mace_three : 
		["Stacker", 3, "Action", "Increases your weapon stack"],
	mace_four : 
		["Stacker", 4, "Action", "Increases your weapon stack"],
	mace_five : 
		["Stacker", 5, "Action", "Increases your weapon stack"],
	mace_six : 
		["Stacker", 6, "Action", "Increases your weapon stack"],
	mace_seven : 
		["Stacker", 7, "Action", "Increases your weapon stack"],
	mace_eight : 
		["Stacker", 8, "Action", "Increases your weapon stack"],
	mace_nine : 
		["Stacker", 9, "Action", "Increases your weapon stack"],
	mace_ten : 
		["Stacker", 10, "Action", "Increases your weapon stack"],
	mace_jack : 
		["Face", 20, "Action", "As an action, you can play this Jack to immediately make a weapon attack against a target that is Dazed."],
	mace_queen : 
		["Face", 20, "Action", "As an action, you play this Queen and exploit your Dazed foes. The Queen is in play for a number of rounds equal to your Level Bonus, and while it is in play, your weapon attacks have advantage on Dazed targets."],
	mace_king : 
		["Face", 20, "Reaction", "As a reaction to hitting with a weapon attack, you play this King and inflict the target with the Dazed status effect for a number of rounds equal to your Level bonus. If the target is already Dazed, you instead stun them until the end of their next turn."],
	mace_ace :
		["Face", 20, "Action", "As an action, you play this Ace. Every Dazed or Stunned target of your choice takes 5 damage, and you gain the Enraged status effect until the end of your next turn."]
	}
	

