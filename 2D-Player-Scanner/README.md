# 2D Target Scanner

![](readme_images/bottomless_scanner.gif?raw=true)

This script comes in two variants:

With debug lines and the more performant version without debug lines.

I made this script for some of my enemies to scan for the player with a certain margin.

Scanning for the player using a RayCast2D or a single ray is very limited and oftentimes the enemy loses the player very quickly due to terrain or small objects.

This script sets four points around the central point, checks if the points can see the cental point and act as "external eyes" to make it feel a bit more natural.

## 1) Attach the Script to a Node2D node in your entity

## 2) Set the exported variables to the correct settings

*On the script you will find three exported variables:*

**Scanner Size:**
Here you can set the distance to the "external eyes" from the central point in pixels.

![Scanner Size: 8](readme_images/readme_scanner_size_8.jpg?raw=true)

Scanner Size: 8


![Scanner Size: 48](readme_images/readme_scanner_size_48.jpg?raw=true)

Scanner Size: 48


**Scan For:**

This is the collision layer bit that the scanner is looking for (eg. if your player is using the top left checkbox, it's 0)


**Collide With:**

These are the layers the scanner should collide with and that can block the scanner. This also MUST include the layer that the scanner is scanning for ( eg. it should include your player, the environment and if you like, other enemies )


## 3) Call the main function using:

scan( global_position of target , target_scan_points)

**The first argument** is the Vector2 global position of the target the script should look for ( eg. player.global_position ).

**The second argument** is a PoolVector2Array of scan points. In my case I use three points to scan for the player (eg. player head, player center, player feet : [Vector2(0,-8), Vector2(0,0), Vector2(0,8)] ) 

The function returns true if the target is visible to one of the eyes, otherwise it returns false.
