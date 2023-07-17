extends Node

class_name CARD_STACKER

@export_category("Card")
@export_enum("Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten") var card_rank : String
@export_range(2, 10, 1) var card_value : int
@export_enum("Class 1", "Class 2", "Weapon", "Armor") var card_suit : String
@export_placeholder("Placeholder") var Hover_text: String = "Placeholder"
@export_multiline var stack_effect : String = ""

@export_category("Damage/Healing")
@export_range(0, 10, 1) var damage : int
@export_range(0, 10, 1) var healing : int
@export_flags("Sharp", "Blunt", "Poison", "Bleed") var phys_damage_types
@export_flags("Fire", "Cold", "Energy", "Sun") var arc_damage_types

@export_category("Status Effects")
@export_flags("Enraged", "Hidden", "Shielded", "Strengthened", "Surged", "Warded") var pos_status_effects
@export_flags("bleeding", "blinded", "burned", "chilled", "corrupted", "dazed", "exposed", "intimidated", "numbed", "poisoned", "stunned", "taunted", "weakened") var neg_status_effects
@export_range(0, 10, 1) var rounds_active : int
