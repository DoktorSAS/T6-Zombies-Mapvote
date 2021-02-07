# **New Zombies Mapvote Menu**
Developed by @DoktorSAS & @JezuzLizard 
Version 1.0.0
Of course can't miss a mapvote for the zombies mode too. I decided to go back and work on it. I don't know if I'll take the old design but I think it's an interesting design. The goal is to make a drag and drop file.

In fact, thanks to one of the new Plutonium updates it is possible to perform map rotation.  This feature that the devs have implemented is wonderful because it provides excellent functionality for a mapvote of this kind. 

Obviously I want to thank all those who have donated to allow us to implement this feature and I want to thank the Plutonium team that has worked on it.
Another very interesting [bounty/feature is about some dvar](https://forum.plutonium.pw/topic/7860/feature-t6zm-t6mp-reimplementation-of-sv_cheats-dvars-and-commands), if you are interested pass on [this link](https://forum.plutonium.pw/topic/7860/feature-t6zm-t6mp-reimplementation-of-sv_cheats-dvars-and-commands). If you have the willingness to support the project do it, Plutonium does everything for free and in my opinion we must support the project

# **Insallation Guide**

* Download the file [Zombies Mapvote](https://github.com/DoktorSAS/T6-Zombies-Mapvote/releases/tag/1.0.0) from the github
* Move the file in your *gametypes_zm* folder (t6r\data\maps\mp\gametypes\_scoreboard.gsc)
* Add on your dedicated.cfg file all the this lines and configure your mapvote menu
* Once loaded the written everything in the cfg and set everything you can start the server and play
# **Configuration Lines**
Most of the configuration lines need to be implemented. Without these lines the mapvote menu will not work the way you want it to, but will work in default mode.
```
////////////////////////////////////////////////////////////////////////////////////////////////////
//  DoktorSAS & JezuzLizard Zombies Mapvote Menu
//  Twitter: @DoktorSAS
//  Report any bugs under the right post on the forum
////////////////////////////////////////////////////////////////////////////////////////////////////

set mv_IsMapvoteEnable 1 // 1 to mapvote on and 0 for mapvote off
set mv_NoCurrentMap 1 // The current map will not get chosed in the mapvote
set mv_TimetoVote 25 // Time to vote
set mv_IsGriefEnable 0 // Enable Grief gamemode maps in the map rotation
set mv_Borough 0 // Enable Borough gamemode maps in the map rotation
set blur 1.6 // Background blur strength 

set mv_ShowSocial 1 // 1 to show socials and 0 to don't show socials
set mv_ServerSentence "Thanks for Playing on this Server" // Sentence on bottom left screen
set mv_SocialNane "Discord" // The name of the social of the server if you have it
set mv_SocialLink "Discord.gg/Plutonium" // Link of the server social if you have it

/////////////////////////////////////////////////////
//                                                                    
// List of valid colors:                                      
//                                                                  
/////////////////////////////////////////////////////
//    1. "red"                                                 
//    2. "orange"                                            
//    3. "yellow"                                              
//    4. "purple"                                              
//    5. "pink"                                                
//    6. "cyan"                                                
//    7. "blue"                                                 
//    8. "light blue"                                     
//    9. "green"                                                
//    10. "light green"                                       
//    11. "black"    
//    12. "white"                                          
/////////////////////////////////////////////////////

set mv_SelectColor "light green" // Select color
set mv_ScrollColor "purple" // Scroll color 
set mv_ArrowColor "white" // Arrows color

/////////////////////////////////////////////////////
//                                                                    
// List of The Maps, 1 for Enable and 0 for Disable:                               
//                                                                  
/////////////////////////////////////////////////////

set mv_Origin 1
set mv_Buried 1
set mv_Transit 1
set mv_DieRise 1
set mv_Motd 1
set mv_Town 1
set mv_Farm 1
set mv_Deposit 1 
set mv_Nuketown 1
set mv_Diner 1
set mv_BusDepot 1
```

# **[Preview](https://www.youtube.com/watch?v=oMrE7_Bf4EI&feature=youtu.be)**

![1168c7f4-9f80-4d8d-ab01-f4f5835818b6-image.png](https://forum.plutonium.pw/assets/uploads/files/1612707138446-1168c7f4-9f80-4d8d-ab01-f4f5835818b6-image.png) 

# **Download**

Press on [this](https://github.com/DoktorSAS/T6-Zombies-Mapvote/releases/tag/1.0.0) to download the mod 

# **Source Code**

Press on [this](https://github.com/DoktorSAS/T6-Zombies-Mapvote/) to see the source code

# **Copyright:**
The script was created by DoktorSAS & JezuzLizard and no one else can say they created it. The script is free and accessible to everyone, it is not possible to sell the script. The script has been created to allow everyone to use it and I would like it to be used in the proper way.
