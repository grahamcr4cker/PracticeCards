extends Node

enum weapons {mace = 0, longblade, shortblade, arcanecentre, bow, firearm, shield_and_weapon}
enum armor {unarmored = 0, light, heavy}
enum damage_types {Sharp = 0, Blunt, Poison, Bleed, Fire, Cold, Energy, Sun}
enum job {priest = 0, thief, warrior, necromancer, chronomancer, rymmite, flametongue}
enum pos_status_effects {enraged = 0, hidden, shielded, strengthened, surged, warded}
enum neg_status_effects {bleeding = 0, blinded, burned, chilled, corrupted, dazed, exposed, intimidated, numbed, poisoned, stunned, taunted, weakened}
var player_hand_size = 0
var stack_size = 0

const player_deck_size = 52

func _ready():
	for cards in range(player_deck_size):
		pass

func stack_build(weapon_class):
	if stack_size >= 10:
		print(weapon_class.stack)
