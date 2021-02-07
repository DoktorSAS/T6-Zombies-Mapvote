/*
	Developer: DoktorSAS
	Discord: https://discord.gg/nCP2y4J
	Mod: Mapvote Menu
	Sorex: https://github.com/DoktorSAS/Sorex/blob/main/README.md
	Description: Mapvote menu on end Game
	
	Copyright: The script was created by DoktorSAS and no one else can 
			   say they created it. The script is free and accessible to 
			   everyone, it is not possible to sell the script.
*/
OverflowFix_mapvote(){
    textanchor = CreateServerFontString("default", 1);
    textanchor SetElementText("Anchor");
    textanchor.alpha = 0; 
    level.isInOverflow = false;
    if (GetDvar("g_gametype") == "tdm" || GetDvar("g_gametype") == "hctdm")
        limit = 54;

    if (GetDvar("g_gametype") == "dm" || GetDvar("g_gametype") == "hcdm")
        limit = 54;

    if (GetDvar("g_gametype") == "dom" || GetDvar("g_gametype") == "hcdom")
        limit = 38;

    if (GetDvar("g_gametype") == "dem" || GetDvar("g_gametype") == "hcdem")
        limit = 41;

    if (GetDvar("g_gametype") == "conf" || GetDvar("g_gametype") == "hcconf")
        limit = 53;

    if (GetDvar("g_gametype") == "koth" || GetDvar("g_gametype") == "hckoth")
        limit = 41;

    if (GetDvar("g_gametype") == "hq" || GetDvar("g_gametype") == "hchq")
        limit = 43;

    if (GetDvar("g_gametype") == "ctf" || GetDvar("g_gametype") == "hcctf")
        limit = 32;

    if (GetDvar("g_gametype") == "sd" || GetDvar("g_gametype") == "hcsd")
        limit = 38;

    if (GetDvar("g_gametype") == "oneflag" || GetDvar("g_gametype") == "hconeflag")
        limit = 25;

    if (GetDvar("g_gametype") == "gun")
        limit = 48;

    if (GetDvar("g_gametype") == "oic")
        limit = 51;

    if (GetDvar("g_gametype") == "shrp")
        limit = 48;

    if (GetDvar("g_gametype") == "sas")
        limit = 50;

    if (IsDefined(level.stringoptimization))
        limit += 172;

    while (true){      
        if (IsDefined(level.stringoptimization) && level.stringtable.size >= 100 && !IsDefined(textanchor2)){
            textanchor2 = CreateServerFontString("default", 1);
            textanchor2 SetElementText("Anchor2");                
            textanchor2.alpha = 0; 
        }
        if (level.stringtable.size >= limit){
        	level.isInOverflow = true;
            if (IsDefined(textanchor2)){
                textanchor2 ClearAllTextAfterHudElem();
                textanchor2 DestroyElement();
            } 
            textanchor ClearAllTextAfterHudElem();
            level.stringtable = [];           

            foreach (textelement in level.textelementtable){
                if (!IsDefined(self.label))
                    textelement SetElementText(textelement.text);
                else
                    textelement SetElementValueText(textelement.text);
            }
            level.isInOverflow = false;
        }            
        wait 0.00000001;
    }
}
SetElementText(text){
    self SetText(text);
    if (self.text != text)
        self.text = text;
    if (!IsInArray(level.stringtable, text))
        level.stringtable[level.stringtable.size] = text;
    if (!IsInArray(level.textelementtable, self))
        level.textelementtable[level.textelementtable.size] = self;
}
SetElementValueText(text){
    self.label = &"" + text;  
    if (self.text != text)
        self.text = text;
    if (!IsInArray(level.stringtable, text))
        level.stringtable[level.stringtable.size] = text;
    if (!IsInArray(level.textelementtable, self))
        level.textelementtable[level.textelementtable.size] = self;
}
DestroyElement(){
    if (IsInArray(level.textelementtable, self))
        ArrayRemoveValue(level.textelementtable, self);
    if (IsDefined(self.elemtype)){
        self.frame Destroy();
        self.bar Destroy();
        self.barframe Destroy();
    }       
    self Destroy();
}
/*
	Utilities functions, is possibile to find this functions on some forum.
	Just google GSC menu tutorial/guide
*/
PrintToAll(str){
	foreach(player in level.players){
		 if(isDefined(player.pers["isBot"]) && player.pers["isBot"]){	
  		}else player iprintln(str);
	}
}
PrintboldToAll(str){
	foreach(player in level.players){
		if(isDefined(player.pers["isBot"]) && player.pers["isBot"]){	
  		}else player iprintlnbold(str);
	}
}
createString(input, font, fontScale, align, relative, x, y, color, alpha, glowColor, glowAlpha, sort, isLevel, isValue){
 	if(!isDefined(isLevel))
  		hud = self createFontString(font, fontScale);
 	else
  		hud = level createServerFontString(font, fontScale);
    if(!isDefined(isValue))
  		hud SetElementText(input);
 	else
  		hud SetElementValueText(input);
    hud setPoint(align, relative, x, y);
 	hud.color = color;
 	hud.alpha = alpha;
 	hud.glowColor = glowColor;
 	hud.glowAlpha = glowAlpha;
 	hud.sort = sort;
 	hud.alpha = alpha;
	hud.archived = false;
	hud.hideWhenInMenu = true;
	return hud;
}
affectElement(type, time, value){
    if(type == "x" || type == "y")
        self moveOverTime(time);
    else
        self fadeOverTime(time);
    if(type == "x")
        self.x = value;
    if(type == "y")
        self.y = value;
    if(type == "alpha")
        self.alpha = value;
    if(type == "color")
        self.color = value;
}
createRectangle(align, relative, x, y, width, height, color, shader, sort, alpha){ 
    boxElem = newClientHudElem(self);
    boxElem.elemType = "bar";
    boxElem.width = width;
    boxElem.height = height;
    boxElem.align = align;
    boxElem.relative = relative;
    boxElem.xOffset = 0;
    boxElem.yOffset = 0;
    boxElem.children = [];
    boxElem.sort = sort;
    boxElem.color = color;
    boxElem.alpha = alpha;
    boxElem setParent(level.uiParent);
    boxElem setShader(shader, width, height);
    boxElem.hidden = false;
    boxElem setPoint(align, relative, x, y);
    boxElem.hideWhenInMenu = true;
    return boxElem;
}
createNewsBar(align,relative,x,y,width,height,color,shader,sort,alpha){ //Not mine
    barElemBG = newClientHudElem(self);
    barElemBG.elemType = "bar";
    barElemBG.width = width;
    barElemBG.height = height;
    barElemBG.align = align;
    barElemBG.relative = relative;
    barElemBG.xOffset = 0;
    barElemBG.yOffset = 0;
    barElemBG.children = [];
    barElemBG.sort = sort;
    barElemBG.color = color;
    barElemBG.alpha = alpha;
    barElemBG setParent(level.uiParent);
    barElemBG setShader(shader, width, height);
    barElemBG.hidden = false;
    barElemBG setPoint(align,relative,x,y);
    barElemBG.hideWhenInMenu = true;
}
drawtext( text, font, fontscale, x, y, color, alpha, glowcolor, glowalpha, sort ){
	hud = self createfontstring( font, fontscale );
	hud SetElementText( text );
	hud.x = x;
	hud.y = y;
	hud.color = color;
	hud.alpha = alpha;
	hud.glowcolor = glowcolor;
	hud.glowalpha = glowalpha;
	hud.sort = sort;
	hud.alpha = alpha;
	hud.hideWhenInMenu = true;
	return hud;
}
drawshader( shader, x, y, width, height, color, alpha, sort, align, relative, isLevel){
	if(isDefined(isLevel))
		hud = newhudelem( ); // Fix for level shader
	else
		hud = newclienthudelem( self );
	hud.elemtype = "icon";
	hud.color = color;
	hud.alpha = alpha;
	hud.sort = sort;
	hud.children = [];
	if(isDefined(align))
   		hud.align = align;
   	if(isDefined(relative))
   		hud.relative = relative;
   	hud setparent( level.uiparent );
   	hud.x = x;
	hud.y = y;
	hud setshader( shader, width, height );
	hud.hideWhenInMenu = true;
	return hud;
}
SetDvarIfNotInizialized(dvar, value){ // DoktorSAS Dvar utilities
	if(!IsInizialized(dvar))
		setDvar(dvar, value);
}
IsInizialized(dvar){ // DoktorSAS Dvar utilities
	result = getDvar(dvar);
	return result != undefined || result != "";
} 
GetColor( color ){ // DoktorSAS Dvar utilities
	switch(tolower(color)){
    	case "red":
    		return (0.960, 0.180, 0.180);
    	break;
    	case "black":
    		return (0, 0, 0);
    	break;
    	case "purple":
    		return (1, 0.282, 1);
    	break;
    	case "pink":
    		return  (1, 0.623, 0.811);
    	break;
    	case "green":
    		return  (0, 0.69, 0.15);
    	break;
    	case "blue":
    		return  (0, 0, 1);
    	break;
    	case "lightblue":
    	case "light blue":
    		return  (0.152, 0329, 0.929);
    	break;
    	case "lightgreen":
    	case "light green":
    		return  (0.09, 1, 0.09);
    	break;
    	case "orange":
    		return  (1, 0662, 0.035);
    	break;
    	case "yellow":
    		return (0.968, 0.992, 0.043);
    	break;
    	case "brown":
    		return (0.501, 0.250, 0);
    	break;
    	case "cyan":
    		return  (0, 1, 1);
    	break;
    	case "white":
    		return  (1, 1, 1);
    	break;
    }
}
isValidColor( value ){ // DoktorSAS Dvar utilities
	return value == "0" || value == "1" || value == "2" || value == "3" || value == "4" || value == "5" || value == "6" || value == "7" ;
}



