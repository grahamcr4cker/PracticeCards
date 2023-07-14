extends Node

class_name WEAPON

@export_category("Weapons")
@export var weapon_name : String = ""
@export_placeholder("Placeholder") var Hover_text: String = "Placeholder"
@export_multiline var Description : String = ""
@export_enum("Arcane Centre", "Bow", "Firearm", "Longblade", "Mace", "Shield and Weapon", "Shortblade") var Weapon_type : String

@export_category("Stats")
@export_range(1, 10, 1) var damage : int
@export_flags("Sharp", "Blunt", "Poison", "Bleed") var phys_damage_types
@export_flags("Fire", "Cold", "Energy", "Sun") var arc_damage_types
