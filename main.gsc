
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud_message;
#include maps/mp/zombies/_zm_utility;
#include maps/mp/gametypes_zm/_globallogic_player;
#include maps/mp/gametypes_zm/_spectating;
#include maps/mp/gametypes_zm/_globallogic;
#include maps/mp/gametypes_zm/_globallogic_audio;
#include maps/mp/gametypes_zm/_tweakables;
#include maps/mp/_challenges;
#include maps/mp/gametypes_zm/_spawnlogic;
#include maps/mp/gametypes_zm/_weapons;
#include maps/mp/_demo;
#include maps/mp/gametypes_zm/_hud_util;
#include maps/mp/gametypes_zm/_hud_message;
#include maps/mp/gametypes_zm/_spawning;
#include maps/mp/gametypes_zm/_globallogic_utils;
#include maps/mp/gametypes_zm/_spectating;
#include maps/mp/gametypes_zm/_globallogic_spawn;
#include maps/mp/gametypes_zm/_globallogic_ui;
#include maps/mp/gametypes_zm/_hostmigration;
#include maps/mp/gametypes_zm/_globallogic_score;
#include maps/mp/zombies/_zm_stats;
#include maps/mp/gametypes_zm/zm_gametype;
#include maps/mp/zombies/_zm_spawner;
#include maps/mp/zombies/_zm_game_module;
#include maps/mp/zombies/_zm_pers_upgrades_functions;
#include maps/mp/zombies/_zm_blockers;
#include maps/mp/gametypes_zm/_spawning;
#include maps/mp/zombies/_zm_stats;
#include maps/mp/gametypes_zm/_hud;
#include maps/mp/zombies/_zm_audio_announcer;
#include maps/mp/zombies/_zm_audio;
#include maps/mp/zombies/_zm_laststand;
#include maps/mp/gametypes_zm/_globallogic_ui;
#include maps/mp/gametypes_zm/_hud_message;
#include maps/mp/gametypes_zm/_globallogic_score;
#include maps/mp/gametypes_zm/_globallogic_defaults;
#include maps/mp/gametypes_zm/_gameobjects;
#include maps/mp/gametypes_zm/_weapons;
#include maps/mp/gametypes_zm/_callbacksetup;
#include maps/mp/zombies/_zm_utility;
#include common_scripts/utility;
#include maps/mp/gametypes_zm/_hud_util;
#include maps/mp/_utility;

init() //checked matches cerberus output
{
	level.player_out_of_playable_area_monitor = 0;
	setdvar( "g_ScoresColor_Spectator", ".25 .25 .25" );
	setdvar( "g_ScoresColor_Free", ".76 .78 .10" );
	setdvar( "g_teamColor_MyTeam", ".4 .7 .4" );
	setdvar( "g_teamColor_EnemyTeam", "1 .315 0.35" );
	setdvar( "g_teamColor_MyTeamAlt", ".35 1 1" );
	setdvar( "g_teamColor_EnemyTeamAlt", "1 .5 0" );
	setdvar( "g_teamColor_Squad", ".315 0.35 1" );
	if ( level.createfx_enabled )
	{
		return;
	}
	if ( sessionmodeiszombiesgame() )
	{
		setdvar( "g_TeamIcon_Axis", "faction_cia" );
		setdvar( "g_TeamIcon_Allies", "faction_cdc" );
	}
	else
	{
		setdvar( "g_TeamIcon_Axis", game[ "icons" ][ "axis" ] );
		setdvar( "g_TeamIcon_Allies", game[ "icons" ][ "allies" ] );
	}
	precacheshader( "white" );
	
	precacheshader( "ui_scrollbar_arrow_left" );
	precacheshader( "ui_scrollbar_arrow_right" );
	precacheshader( "menu_vis_bracket_small_zm" );
	precacheshader( "gradient_center" );
	precacheshader( "killiconheadshot" );
	precacheshader( "hud_status_dead" );
	precacheshader( "damage_feedback" );
	precacheshader( "zombies_rank_5" );
	precacheshader( "menu_zm_gamertag" );
	level.border = "menu_zm_gamertag";
	precacheshader( level.border );
	
	
	
	SetDvarIfNotInizialized("mv_isMapvoteEnable", 1);
	level.IsMapvoteEnable = getDvarInt("mv_IsMapvoteEnable");
	
	// ui_zm_mapstartlocation 
	
	if(level.IsMapvoteEnable){
		SetDvarIfNotInizialized("blur", 1.6);
		SetDvarIfNotInizialized("mv_NoCurrentMap", 1);
		level.NoCurrentMap = getDvarInt("mv_NoCurrentMap");
		SetDvarIfNotInizialized("mv_ArrowColor", "white");
		level.ArrowColor = getColor(getDvar("mv_ArrowColor"));
		SetDvarIfNotInizialized("mv_SelectColor", "green");
		SetDvarIfNotInizialized("mv_ScrollColor", "purple");
		level.SelectColor = getColor(getDvar("mv_SelectColor"));
		level.ScrollColor = getColor(getDvar("mv_ScrollColor"));
		SetDvarIfNotInizialized("mv_ShowSocial", 1);
		level.ShowSocial = getDvarInt("mv_ShowSocial");
		SetDvarIfNotInizialized("mv_ServerSentence", "Thanks for Playing by @DoktorSAS");
		level.ServerSentence = getDvar("mv_ServerSentence");
    	SetDvarIfNotInizialized("mv_SocialName", "Discord");
   		SetDvarIfNotInizialized("mv_SocialLink", "https://discord.gg/Plutonium");
    	level.SocialName = getDvar("mv_SocialName");
    	level.SocialLink = getDvar("mv_SocialLink");
		SetDvarIfNotInizialized("mv_TimeToVote", 20);
		
		SetDvarIfNotInizialized("mv_Origin", 1);
		SetDvarIfNotInizialized("mv_Buried", 1);
		SetDvarIfNotInizialized("mv_Transit", 1);
		SetDvarIfNotInizialized("mv_DieRise", 1);
		SetDvarIfNotInizialized("mv_Motd", 1);
		SetDvarIfNotInizialized("mv_Town", 1);
		SetDvarIfNotInizialized("mv_Farm", 1);
		SetDvarIfNotInizialized("mv_Deposit", 1);
		SetDvarIfNotInizialized("mv_Nuketown", 1);
		SetDvarIfNotInizialized("mv_Diner", 1);
		SetDvarIfNotInizialized("mv_BusDepot", 1);
		SetDvarIfNotInizialized("mv_IsGriefEnable", 0);
		SetDvarIfNotInizialized("mv_Borough", 0);
		
		level.IsBoroughEnable = getDvarInt("mv_Borough");
		level.IsGriefEnable = getDvarInt("mv_IsGriefEnable");
		SetupAllMaps();
		level thread OnPlayerConnect();
	}
}


SetupAllMaps(){
    level.maps = [];
    
    level.maps[0] = spawnStruct();
    level.maps[0].image = "loadscreen_zm_tomb_zclassic_tomb";
    level.maps[0].display_name = "Origins";
    level.maps[0].ui_zm_mapstartlocation = "tomb";
    level.maps[0].rotation = "exec zm_classic_tomb.cfg map zm_tomb";
    level.maps[0].isEnable = getDvarInt("mv_Origin");
    level.maps[0].choosed = 0;
    
    level.maps[1] = spawnStruct();
    level.maps[1].image = "loadscreen_zm_transit_zstandard_farm";
    level.maps[1].display_name = "Farm Survival";
    level.maps[1].ui_zm_mapstartlocation = "farm";
    level.maps[1].rotation = "exec zm_standard_farm.cfg map zm_transit";
    level.maps[1].isEnable = getDvarInt("mv_Farm");
    level.maps[1].choosed = 0;
    
    level.maps[2] = spawnStruct();
    level.maps[2].image = "loadscreen_zm_transit_zstandard_town";
    level.maps[2].display_name = "Town Survival";
    level.maps[2].rotation = "exec zm_standard_town.cfg map zm_transit";
    level.maps[2].ui_zm_mapstartlocation = "town";
    level.maps[1].isEnable = getDvarInt("mv_Town");
    level.maps[2].choosed = 0;
    
    level.maps[3] = spawnStruct();
    level.maps[3].image = "loadscreen_zm_transit_zstandard_transit";
    level.maps[3].display_name = "Bus Depot";
    level.maps[3].ui_zm_mapstartlocation = "transit";
    level.maps[3].rotation = "exec zm_standard_transit.cfg map zm_transit";
    level.maps[3].isEnable = getDvarInt("mv_BusDepot");
    level.maps[3].choosed = 0;

    level.maps[4] = spawnStruct();
    level.maps[4].image = "loadscreen_zm_transit_zgrief_farm";
    level.maps[4].display_name = "Farm Grief";
    level.maps[4].ui_zm_mapstartlocation = "farm";
    level.maps[4].rotation = "exec zm_grief_farm.cfg map zm_transit";
    level.maps[4].isEnable = getDvarInt("mv_Farm");
    level.maps[4].choosed = 0;
    
    level.maps[5] = spawnStruct();
    level.maps[5].image = "loadscreen_zm_transit_zgrief_town";
    level.maps[5].display_name = "Town Grief";
    level.maps[5].ui_zm_mapstartlocation = "town";
    level.maps[5].rotation = "exec zm_grief_town.cfg map zm_transit";
    level.maps[5].isEnable = getDvarInt("mv_Town");
    level.maps[5].choosed = 0;
    
    level.maps[6] = spawnStruct();
    level.maps[6].image = "loadscreen_zm_transit_zgrief_transit";
    level.maps[6].display_name = "Transit Grief";
    level.maps[6].ui_zm_mapstartlocation = "transit";
    level.maps[6].rotation = "exec zm_grief_transit.cfg map zm_transit";
    level.maps[6].isEnable = getDvarInt("mv_Transit");
    level.maps[6].choosed = 0;

    level.maps[7] = spawnStruct();
    level.maps[7].image = "loadscreen_zm_transit_zclassic_transit";
    level.maps[7].display_name = "Tranzit";
    level.maps[7].ui_zm_mapstartlocation = "transit";
    level.maps[7].rotation = "exec zm_classic_transit.cfg map zm_transit";
    level.maps[7].isEnable = getDvarInt("mv_Transit");
    level.maps[7].choosed = 0;

    level.maps[8] = spawnStruct();
    level.maps[8].image = "loadscreen_zm_buried_zclassic_processing";
    level.maps[8].display_name = "Buried";
    level.maps[8].ui_zm_mapstartlocation = "processing";
    level.maps[8].rotation = "exec zm_classic_processing.cfg map zm_buried";
    level.maps[8].isEnable = getDvarInt("mv_Buried");
    level.maps[8].choosed = 0;

    /*level.maps[9] = spawnStruct();
    level.maps[9].image = "loadscreen_zm_transit_dr_zcleansed_diner";
    level.maps[9].display_name = "Borough Diner";
    level.maps[9].ui_zm_mapstartlocation = "street";
    level.maps[9].rotation = "exec zm_cleansed_street.cfg map zm_buried";
    level.maps[9].isEnable = level.IsBoroughEnable;
    level.maps[9].choosed = 0;*/
    
    level.maps[9] = spawnStruct();
    level.maps[9].image = "loadscreen_zm_buried_zgrief_street";
    level.maps[9].display_name = "Burrier Buried";
    level.maps[9].ui_zm_mapstartlocation = "street";
    level.maps[9].rotation = "exec zm_grief_street.cfg map zm_buried";
    level.maps[9].isEnable = getDvarInt("mv_Buried");
    level.maps[9].choosed = 0;

    level.maps[10] = spawnStruct();
    level.maps[10].image = "loadscreen_zm_prison_zclassic_prison";
    level.maps[10].display_name = "Mob of the Dead";
    level.maps[10].ui_zm_mapstartlocation = "prison";
    level.maps[10].rotation = "exec zm_classic_prison.cfg map zm_prison";
    level.maps[10].isEnable = getDvarInt("mv_Prison");
    level.maps[10].choosed = 0;
    
    level.maps[11] = spawnStruct();
    level.maps[11].image = "loadscreen_zm_prison_zgrief_cellblock";
    level.maps[11].display_name = "Cellblock";
    level.maps[11].ui_zm_mapstartlocation = "cellblock";
    level.maps[11].rotation = "exec zm_grief_cellblock.cfg map zm_prison";
    level.maps[11].isEnable = getDvarInt("mv_Prison");
    level.maps[11].choosed = 0;

    level.maps[12] = spawnStruct();
    level.maps[12].image = "loadscreen_zm_highrise_zclassic_rooftop";
    level.maps[12].display_name = "Die Rise";
    level.maps[12].ui_zm_mapstartlocation = "rooftop";
    level.maps[12].rotation = "exec zm_classic_rooftop.cfg map zm_highrise";
    level.maps[12].isEnable = getDvarInt("mv_DieRise");
    level.maps[12].choosed = 0;

    /*level.maps[14] = spawnStruct();
    level.maps[14].image = "loadscreen_zm_transit_dr_zcleansed_diner";
    level.maps[14].display_name = "Diner Turned";
    level.maps[14].ui_zm_mapstartlocation = "diner";
    level.maps[14].rotation = "exec zm_cleansed_diner.cfg map zm_transit_dr";
    level.maps[14].isEnable = getDvarInt("mv_Diner");
    level.maps[14].choosed = 0;*/
    
    level.maps[13] = spawnStruct();
    level.maps[13].image = "loadscreen_zm_nuked_zstandard_nuked";
    level.maps[13].display_name = "Nuketown";
    level.maps[13].ui_zm_mapstartlocation = "nuked";
    level.maps[13].rotation = "exec zm_standard_nuked.cfg map zm_nuked";
    level.maps[13].isEnable = getDvarInt("mv_Nuketown");
    level.maps[13].choosed = 0;
    
    for ( i = 0; i < level.maps.size; i++ )
    {
        precacheshader( level.maps[i].image );
    }
    level.maps_selected = [];
    getRandomMap( 0 );
    getRandomMap( 1 );
    getRandomMap( 2 );

}
getRandomMap(index){
	stop = false;
	while(!stop){
		random = randomintrange(0,level.maps.size-1);
		if(level.NoCurrentMap)
			while(getDvar("ui_zm_mapstartlocation") == level.maps[random].ui_zm_mapstartlocation) random = randomintrange(0,level.maps.size-1);
		if(!level.IsGriefEnable){
			if(level.NoCurrentMap)
				while(getDvar("ui_zm_mapstartlocation") == level.maps[random].ui_zm_mapstartlocation || isSubStr(level.maps[random].rotation ,"grief")) random = randomintrange(0,level.maps.size-1);
			else
				while(isSubStr(level.maps[random].rotation ,"grief")) random = randomintrange(0,level.maps.size-1);
		}
		if(level.maps[random].choosed == 0 && level.maps[random].isEnable == 1){
		    level.maps_selected[index] = spawnStruct();
			level.maps_selected[index].display_name = level.maps[random].display_name;
			level.maps_selected[index].image = level.maps[random].image;
			level.maps_selected[index].votes = 0;
			level.maps_selected[index].rotation = level.maps[random].rotation;
			level.maps[random].choosed = 1;
			stop = true;
		}
	}
}

ThereAPlayerAlive(){
	foreach(player in level.players){
		if(is_player_valid(player))
			return 0;
	}
	return 1;
}
getVotesForMap( index ){
	cont = 0;
	foreach(player in level.players){
		if(isDefined(player.pers["map_voted"]) && player.pers["map_voted"] == index)
			 cont++;
	}
	return cont;
}
OnPlayerMapvoteStart(){
	self waittill("spawned_player");
	spawn_origin = self.origin;
	spawn_angles = self.angles;
	//self iprintln(spawn_origin);
	while(!flag( "initial_blackscreen_passed" )) wait 0.01;
	self setblur(getDvarFloat("blur"), 0.2);
	if(level.ShowSocial == 1){
		credits = createFontString("hudsmall" , 1.2);
		credits setPoint("BOTTOM_LEFT", "BOTTOM_LEFT");
		credits SetElementText(level.ServerSentence + "\nDeveloped by @^5DoktorSAS ^7&& @^5JezuzLizard ^7\n" + level.SocialName + ": " +  level.SocialLink);
	}
	//self thread Noclip();
	self EnableInvulnerability();
	flag_clear( "spawn_zombies" ); //stop zombie spawn
	maps_loadscrean = [];
	maps_loadscrean[0] = self drawshader( level.maps_selected[0].image, -240, 100, 200, 127, ( 1, 1, 1 ), 100, 2 , "CENTER", "CENTER");
	maps_loadscrean[1] = self drawshader( level.maps_selected[1].image, 0, 100, 200, 127, ( 1, 1, 1 ), 100, 2 , "CENTER", "CENTER");
	maps_loadscrean[2] = self drawshader( level.maps_selected[2].image, 240, 100, 200, 127, ( 1, 1, 1 ), 100, 2 , "CENTER", "CENTER");
	
	text = [];
	text[0] = self createString( level.maps_selected[0].display_name + " ["+ getVotesForMap( 0 ) + "]", "hudsmall", 1.2, "CENTER", "CENTER", -240, 0, (1,1,1), 5, (0,0,0), 0.5, 5);		
	text[1] = self createString( level.maps_selected[1].display_name + " ["+ getVotesForMap( 1 ) + "]", "hudsmall", 1.2, "CENTER", "CENTER", 0, 0, (1,1,1), 5, (0,0,0), 0.5, 5);		
	text[2] = self createString( level.maps_selected[2].display_name + " ["+ getVotesForMap( 2 ) + "]", "hudsmall", 1.2, "CENTER", "CENTER", 240, 0, (1,1,1), 5, (0,0,0), 0.5, 5);
	
	menu_frame = [];
	menu_frame[0] = self drawshader( level.border, -240, 100, 200, 127, level.ScrollColor, 100, 3 , "CENTER", "CENTER");
	menu_frame[1] = self drawshader( level.border, 0, 100, 200, 127, ( 1, 1, 1 ), 100, 3 , "CENTER", "CENTER");
	menu_frame[2] = self drawshader( level.border, 240, 100, 200, 127, ( 1, 1, 1 ), 100, 3 , "CENTER", "CENTER");

	level.SelectColor = getColor(getDvar("mv_SelectColor"));
	level.ScrollColor = getColor(getDvar("mv_ScrollColor"));

	buttons = self createFontString("hudsmall", 2);
	buttons SetElementText( "^7 ^3[{+speed_throw}]                ^7Press ^3[{+gostand}] ^7to select                ^3[{+attack}] ^7" );
	buttons setPoint("center", "center", 0, 100);
	arrow_right = self drawshader( "ui_scrollbar_arrow_right", 200, 290, 25, 25, level.arrow_color, 100, 2 , "CENTER", "CENTER");
	arrow_left = self drawshader( "ui_scrollbar_arrow_left", -200, 290, 25, 25, level.arrow_color, 100, 2 , "CENTER", "CENTER");
	floatOBJ = spawn( "script_origin", self.origin, 1 );
	self.CanVote = true;
	self thread PlayerCanVote();
	self setclientuivisibilityflag( "hud_visible", 0 );
	self disableweapons();
	index = 0;
	switch(getDvar("ui_zm_mapstartlocation")){
		case "town":
			floatOBJ.angles = (8.36471, 305.977, 0);
			self playerlinkto( floatOBJ, undefined );
			floatOBJ moveTo((1174.08, 302.027, 207.14), 1);
		break;
		case "processing":
			floatOBJ.angles = (7.08619, 242.228, 0);
			self playerlinkto( floatOBJ, undefined );
			floatOBJ moveTo((1397.12, 965.639, 217.509), 1);
		break;
		case "diner":
			floatOBJ.angles = (7.19045, 227.078, 0);
			self playerlinkto( floatOBJ, undefined );
			floatOBJ moveTo((-4775.4, -6800.56, 168.98),1);
		break;
		case "tomb":
			floatOBJ.angles =  (10.8379, 219.818, 0);
			self playerlinkto( floatOBJ, undefined );
			floatOBJ moveTo((908.175, 756.254, 692.476),1);
		break;
		case "rooftop":
			floatOBJ.angles = (7.92786, 238.202, 0);
			self playerlinkto( floatOBJ, undefined );
			floatOBJ moveTo((2088.39, -596.027, 3366.17),1);
		break;
		case "farm":
			floatOBJ.angles = (13.3923, 319.41, 0);
			self playerlinkto( floatOBJ, undefined );
			floatOBJ moveTo((7220.28, -5265.22, 302.138),1);
		break;
		case "transit":
			if(getDvar("sv_maprotation") == "exec zm_standard_transit.cfg map zm_transit"){
				floatOBJ.angles = (359, 133.673, 0);
				self playerlinkto( floatOBJ, undefined );
				floatOBJ moveTo((-6188.76, 4381.19, 174.299),1);
			}else{
				floatOBJ.angles = (357.154, 43.673, 0);
				self playerlinkto( floatOBJ, undefined );
				floatOBJ moveTo((1063.96, -187.401, -274.756),1);
			}
		break;
		case "nuked":
			floatOBJ.angles = (5.82274, 89.8417, 0);
			self playerlinkto( floatOBJ, undefined );
			floatOBJ moveTo((10.186, -892.709, 283.939),1);
		break;
		case "prison":
			floatOBJ.angles = (8.49231, 70.5923, 0);
			self playerlinkto( floatOBJ, undefined );
			floatOBJ moveTo((-733.326, 5310.34, 433.494),1);
		break;
		
	}
	//self freezecontrols(true);
	wait 1;
	while(self.CanVote){
		wait 0.01;
		if(self attackbuttonpressed()){
			index++;
			if(index < menu_frame.size){
				for(i = 0; i < menu_frame.size; i++){
					if(i != index){
						menu_frame[i] affectElement("color", 0.1, (1,1,1));
					}else{
						menu_frame[i] affectElement("color", 0.1, level.ScrollColor);
					}
				}
			}else{
				index = 0;
				for(i = 0; i < menu_frame.size; i++){
					if(i != index){
						menu_frame[i] affectElement("color", 0.1, (1,1,1));
					}else{
						menu_frame[i] affectElement("color", 0.1, level.ScrollColor);
					}
				}
			}
			self playsound( "zmb_no_cha_ching" );
			wait 0.4;
		}else if(self adsbuttonpressed()){
			index--;
			if(index >= 0){
				for(i = 0; i < menu_frame.size; i++){
					if(i != index){
						menu_frame[i] affectElement("color", 0.1, (1,1,1));
					}else{
						menu_frame[i] affectElement("color", 0.1, level.ScrollColor);
					}
				}
			}else{
				index = menu_frame.size-1;
				for(i = 0; i < menu_frame.size; i++){
					if(i != index){
						menu_frame[i] affectElement("color", 0.1, (1,1,1));
					}else{
						menu_frame[i] affectElement("color", 0.1, level.ScrollColor);
					}
				}
			}
			self playsound( "zmb_no_cha_ching" );
			wait 0.4;
		}else if(self jumpbuttonpressed()){
			self playsound( "zmb_lid_open" );
			self.pers["map_voted"] = index;
			menu_frame[index] affectElement("color", 0.1, level.SelectColor);
			text[index] SetElementText( level.maps_selected[index].display_name + " ["+ getVotesForMap( index ) + "]");
			self.CanVote = false;
			wait 0.5;
		}
	}
	self setblur(0, 0.2);
	floatOBJ moveto(spawn_origin, 1);
	floatOBJ rotateto(spawn_angles, 1);
	wait 1.1;
	self unlink();
	self.pers["player_voted"] = true;
	if(!isDefined(self.pers["map_voted"]))
		self.pers["map_voted"] = -1;
	arrow_right DestroyElement();
	arrow_left DestroyElement();
	buttons DestroyElement();
	credits DestroyElement();
	for(i = 0; i < menu_frame.size; i++){
		menu_frame[i] DestroyElement();
		maps_loadscrean[i] DestroyElement();
		text[i] DestroyElement();
	}
	self setclientuivisibilityflag( "hud_visible", 1 );
	self enableweapons();
	floatOBJ delete();
	if(!isSomeoneStillVoting())
 		flag_set( "spawn_zombies" ); //start zombie spawn
 	self DisableInvulnerability();
}
OnPlayerDisconnect(){
	level endon("end_game");
	self waittill("disconnect");
	if(!level.gameended)
		self.pers["map_voted"] = index;
}
isSomeoneStillVoting(){
	foreach(player in level.players)
		if(player.CanVote)
			return true;
	return false;
}
PlayerCanVote(){
	time = getDvarInt("mv_TimeToVote");
	while(time > 0){
		wait 1;
		time--;
	}
	self.CanVote = false;
}
OnPlayerConnect(){
	level endon("end_game");
	level thread OnEndGame();
	for(;;){
		level waittill("connected", player);
		player thread OnPlayerMapvoteStart();
	}
}
OnEndGame(){
	level waittill_any("end_game", "game_module_ended");
	setmap( GetMostVotedMap() ); 

}
//Print To All
printToAll(str){
	foreach(player in level.players){
		 if(isDefined(player.pers["isBot"]) && player.pers["isBot"]){	
  		}else player iprintln(str);
	}
}
setmap( index ){
	setdvar( "sv_maprotation", level.maps_selected[index].rotation );
	logprint("\Most Voted Maps;" + index);
	logprint( "\nzm_mapvote;"+ getDvar("sv_maprotation") );
	
}
setVotes(index){
	logprint("\nvotes;" + getVotesForMap(index));
	level.maps_selected[index].votes = getVotesForMap(index);
}
GetMostVotedMap( ){
	setVotes(0);
	setVotes(1);
	setVotes(2);
	/*vector = [];
	vector[0] = -1;
	vi = 0;
	index = 0;
	for(i = 0; i < level.maps_selected.size; i++){
		if(i+1 < level.maps_selected.size && level.maps_selected[i].votes > level.maps_selected[i+1].votes){
			index = i;
		}else if(level.maps_selected[i].votes < level.maps_selected[index].votes && level.maps_selected[index].votes == level.maps_selected[i].votes){
			vector[vi] = i;
			vi++;
			vector[vi] = i + 1;
		}
	}
	if(level.maps_selected[index].votes < vector[0].votes &&  vector.size > 1){
		result = randomintrange(0, vector.size);
		return result;
	}else return index;*/
	if(level.maps_selected[0].votes > level.maps_selected[1].votes && level.maps_selected[0].votes > level.maps_selected[2].votes)
		return 0;
	else if(level.maps_selected[1].votes > level.maps_selected[2].votes && level.maps_selected[1].votes > level.maps_selected[0].votes)
		return 1;
	else if(level.maps_selected[2].votes > level.maps_selected[1].votes && level.maps_selected[2].votes > level.maps_selected[0].votes)
		return 2;
	else if(level.maps_selected[0].votes == level.maps_selected[1].votes && level.maps_selected[0].votes == level.maps_selected[2].vote){
		return randomintrange(0,2);
	}else if(level.maps_selected[0].votes == level.maps_selected[1].votes && level.maps_selected[2].votes < level.maps_selected[0].votes){
		return randomintrange(0,1);
	}else if(level.maps_selected[1].votes == level.maps_selected[2].votes && level.maps_selected[0].votes < level.maps_selected[1].votes){
		return randomintrange(1,2);
	}else if(level.maps_selected[0].votes == level.maps_selected[2].votes && level.maps_selected[1].votes < level.maps_selected[0].votes){
		switch(randomintrange(0,1)){
			case 0:
				return 0;
			break;
			case 1:
				return 2;
			break;
		}
		
	}
}

Noclip(){
	self endon("disconnect");
	self endon("stop_noclip");
	level endon( "game_ended" );
	self.FlyNoclip = 0;
	for(;;){
	if(self.FlyNoclip == 0 && self secondaryOffhandButtonPressed()){
		self.originObj = spawn( "script_origin", self.origin, 1 );
		self.originObj.angles = self.angles;
		self playerlinkto( self.originObj, undefined );
		self.FlyNoclip = 1;
	}
	if(self secondaryOffhandButtonPressed() && self.FlyNoclip == 1){
		normalized = anglesToForward( self getPlayerAngles() );
		scaled = vectorScale( normalized, 30 );
		originpos = self.origin + scaled;
		self.originObj.origin = originpos;
	}
	if(self jumpButtonPressed() && self.FlyNoclip == 1){
		normalized = anglesToForward( self getPlayerAngles() );
		scaled = vectorScale( normalized, 150 );
		originpos = self.origin + scaled;
		self.originObj.origin = originpos;
	}
	if(self stanceButtonPressed() && self.FlyNoclip == 1){
		self unlink();
		self.originObj delete();
		self.FlyNoclip = 0;
	}
	if(self attackbuttonpressed() && self.FlyNoclip == 1){
		logPrint("self moveTo(" + self.origin + ",1);\nself rotateto( "+ self getPlayerAngles() +", 1 );");
	} 
	wait .05;
	}
}
vectorScale(vec, scale){
    vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
    return vec;
}




