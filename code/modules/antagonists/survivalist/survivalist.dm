/datum/antagonist/survivalist
	name = "Survivalist"
	show_in_antagpanel = FALSE
	show_name_in_check_antagonists = TRUE
	var/greet_message = ""

/datum/antagonist/survivalist/proc/forge_objectives()
	var/datum/objective/survive/survive = new
	survive.owner = owner
	objectives += survive

/datum/antagonist/survivalist/on_gain()
	owner.special_role = "survivalist"
	forge_objectives()
	. = ..()

/datum/antagonist/survivalist/greet()
	to_chat(owner, "<B>You are the survivalist![greet_message]</B>")
	owner.announce_objectives()

/datum/antagonist/survivalist/guns
	greet_message = "Your own safety matters above all else, and the only way to ensure your safety is to stockpile weapons! Grab as many guns as possible, by any means necessary. Kill anyone who gets in your way."

/datum/antagonist/survivalist/guns/forge_objectives()
	var/datum/objective/steal_five_of_type/summon_guns/guns = new
	guns.owner = owner
	objectives += guns
	..()
