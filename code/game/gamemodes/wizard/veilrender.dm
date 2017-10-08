/obj/item/weapon/veilrender
	name = "veil render"
	desc = "A wicked curved blade of alien origin, recovered from the ruins of a vast city."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "render"
	item_state = "render"
	force = 15
	throwforce = 10
	w_class = 3
	var/charged = 1


/obj/effect/rend
	name = "Tear in the fabric of reality"
	desc = "You should run. Now!"
	icon = 'icons/obj/biomass.dmi'
	icon_state = "rift"
	density = 1
	unacidable = 1
	anchored = 1.0


/obj/effect/rend/atom_init()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/effect/rend/atom_init_late()
	spawn(50)
		new /obj/singularity/narsie/wizard(get_turf(src))
		qdel(src)

/obj/item/weapon/veilrender/attack_self(mob/user)
	if(charged == 1)
		new /obj/effect/rend(get_turf(usr))
		charged = 0
		visible_message("\red <B>[src] hums with power as [usr] deals a blow to reality itself!</B>")
	else
		to_chat(user, "\red The unearthly energies that powered the blade are now dormant")

