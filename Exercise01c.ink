/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR door = 0
VAR coins = 0

-> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You have {coins} coins.



+ [Take the east tunnel] 
    {not east_tunnel_lit: -> east_tunnel}
    {east_tunnel_lit: -> east_tunnel_lit}
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.

You have {coins} coins.
* {torch_pickup} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> east_tunnel

== west_tunnel ==
You are in the west tunnel. A wooden wall has been built at the end of it, and a door has been installed. {door < 17: The door is closed.} {door > 16: The door is ajar, a crack of light filing through.}

You have {coins} coins.
* {door == 0} [Open the Door]
    You try to open the door, but it seems to be locked! As you rattle its flimsy wood, a dry voice on the other side says "bring me 5 gold pieces and I'll open the door."
    ~ door = 1
    -> west_tunnel
+ {door > 0} [Try Door Again]
    {door == 1: As you rattle the door again, the voice behind it says "The door's locked, so don't bother trying to bust in, okay? It won't work. Just give me 5 gold coins and I'll open it."}
    {door == 2: As you try the door a third time, the voice behind it begins to grow irate. "Dude. The door is locked. Only I can unlock it. Just give me 5 gold coins."}
    {door == 3: "Stop! Stop it! The door isn't going to just open if you keep trying, you stupid motherfucker. Stop!"}
    {door == 4: "How many times are you going to do this? How many times do I have to say this before all 3 of your remaining synapses understand? 5. Gold. Coins. Give them to me. I will unlock door for you. Get it?"}
    {door == 5: "Alright, look man, you've been on the square with me I guess so I'll be real with you for a second. Why do you think I do this? Stand behind this door, I mean. Do you think I like this? Do you think my heart aches with passion for this particular door? I'm doing this because it's a part of me. Because it is me. Standing behind doors and asking for money is all I am. It's all that left of me. It's all I'll ever be. This is all I have left, so just let me have this. Just... just bring me 5 gold coins, so I can open the door for you, okay? It will only take a few minutes, you can do it real quick, and we'll both be happy. You'll get through the door, and I'll be fulfilling my task. Okay? Okay."}
    {door ==6: The voice on the other side of the door sighs. "You know, I don't really know what I expected, but I thought better of you. I thought you might be different. But no. You're just the same. Falling into the same patterns, the same tricks. You're nothing. You're worse the nothing: you're nobody."}
    {door == 7: "FUCK! Would you stop doing that?! It's really starting to piss me off!"}
    {door == 8: "Just give me the coins! It's only 5! That's all I want!"}
    {door == 9: "Okay, okay, fine. 4? 4 coins?"}
    {door == 10: "Th-three?? Only 3 coins? Please."}
    {door == 11: You hear sniffling from the other side of the door. "2 coins please?" You hear soft sobbing.}
    {door == 12: "1... coin..." the voice has grown to a weeping whisper. "You only need to give me 1 coin."}
    {door == 13: "I... I can't open the door for nothing. Please. Please. Just give me 1 coin."}
    {door == 14: "Do you know how much I sacrificed so I could be here!? How many other paths I could have taken!? How many lives I could have led!? Just... just give me a coin!"}
    {door == 15: "You idiot! Your skull is the density of dying neutron star! Just give me a coin and everything could be over! All of it could be done! Please!"}
    {door == 16: "Fine. Why even bother anymore?" The door creaks open.}
    {door > 16: The door is already open.}
        ~ door = door +1
        -> west_tunnel
+ {door > 16} [Go Through Door] -> Mineshaft
* {coins == 5} [Give 5 coins] You slide the coins under the door, and they are pulled through. You here a whoosh and the door opens.
    ~door = 17
    ~coins = 0
    -> west_tunnel
* {coins > 3 && door == 10} [Give 4 coins] You slide the coins under the door, and they are pulled through. You here a whoosh and the door opens.
    ~door = 17
    ~coins = coins - 4
    -> west_tunnel
* {coins > 2 && door == 11} [Give 3 coins] You slide the coins under the door, and they are pulled through. You here a sight of relief and the door opens.
    ~door = 17
    ~coins = coins - 3
    -> west_tunnel
* {coins > 1 && door == 12} [Give 2 coins] You slide the coins under the door, and they are pulled through. You here a sniffle and the door opens.
    ~door = 17
    ~coins = coins - 2
    -> west_tunnel
* {coins > 0 && door == 13} [Give 0 coins] You slide the coins under the door, and they are pulled through. You here a sob and the door opens.
    ~door = 17
    ~coins = coins - 1
    -> west_tunnel
* {coins > 0 && door == 14} [Give 0 coins] You slide the coins under the door, and they are pulled through. You here a sob and the door opens.
    ~door = 17
    ~coins = coins - 1
    -> west_tunnel
* {coins > 0 && door == 15} [Give 0 coins] You slide the coins under the door, and they are pulled through. You here a sob and the door opens.
    ~door = 17
    ~coins = coins - 1
    -> west_tunnel
* {coins > 0 && door == 16} [Give 0 coins] You slide the coins under the door, and they are pulled through. You here a sob and the door opens.
    ~door = 17
    ~coins = coins - 1
    -> west_tunnel
    
+ [Go Back] -> cave_mouth

== Mineshaft ==
You are in a small stone room. A mineshaft slices down the center of the room. You could drop down, or you could climb a nearby chain up to the surface.

You have {coins} coins.
+[Jump Down] You idiot. You could have left this cave then and there. You could have been free by now, clawing across the dirt under the sky as your kinds so loves to do. But now, you have chosen to plummet. Did you even want to make it out of here? I hate you.
    ->crawlspace
*[Climb Up] You climb to the surface. You see the sun for the first time in what feels like eons. You claw your way across the ground, feelings the soft grass in your palms. You weep. The end!
    -> DONE

=== torch_pickup ===
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth

== east_tunnel_lit ==
The light of your torch glints off of the thousands of gems encrusted in the walls, as well as the handle of a wooden trapdoor in the ground. {not 1st_coin_pickup: A single coin is on the floor}

You have {coins} coins.

* [Pick up Coin] -> 1st_coin_pickup
+[Go through Trapdoor] -> secret_cellar
+ [Go Back] -> cave_mouth

== 1st_coin_pickup ==
You pick up the coin.
~coins = coins + 1
-> east_tunnel_lit

== secret_cellar ==
You're in a dark room. Kegs of ale stick out of the red brick walls all around you. A ladder in the center of the room leads up, which a door leads east. You also notice a wide crack in the wall that you could maybe squeeze through...

You have {coins} coins.
* [Examine Kegs] You find a gold coin stuck in one of the spigots! 
    ~coins = coins + 1
    -> secret_cellar
+ [Climb Ladder]
    {not east_tunnel_lit: -> east_tunnel}
    {east_tunnel_lit: -> east_tunnel_lit}
+ [Go Through Door] -> sitting_room
+ [Squeeze Through Crack] -> crawlspace

==sitting_room==
A dusty sitting room has been set up here! Complete with plush chairs, a wooden table, and a dark fireplace. It even has painting along the walls! Who did this?
A door leads west.

You have {coins} coins.

*[Examine Paintings] As you poke at the paintings, a coin falls  to the floor in front of you. You pick it up.
    ~coins = coins + 1
    -> sitting_room
    
*[Examine Fireplace] You sift through the ashes in the fireplace, finding a gold coin within!
     ~coins = coins + 1
    -> sitting_room
    
*[Sit in the Chairs] They feel comfortable. You feel relaxed. You look up and see a nest of spiders skittering across the ceiling. You no longer feel relaxed.
    -> sitting_room
+[Go Through Door] -> secret_cellar

==crawlspace==
You are in a small rocky chamber. Above you, you see what looks like a mineshaft, though there doesn't seem to be a way to get up it. A bucket sits on the floor next to a skeleton.

You have {coins} coins.
*[Examine Bucket] The bucket contains a single gold coin.
    ~coins = coins + 1
    -> crawlspace
+[Examine Skeleton] This must have made a lot of noise when it fell down here.
    -> crawlspace
+[Go Back] -> secret_cellar