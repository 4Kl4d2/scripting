#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "C0lt"
#define PLUGIN_VERSION "4k"

#include <sourcemod>

#pragma newdecls required

Handle CvarPrintToServer;
Handle L4d2Survivors;
Handle L4dSurvivors;
Handle h_witch;
Handle SpecialInfected;

public Plugin myinfo = 
{
	name = "[L4D2] 4K Precacher", 
	author = PLUGIN_AUTHOR, 
	description = "4K Precacher", 
	version = PLUGIN_VERSION, 
	url = "https://steamcommunity.com/groups/4kservers"
};
public void OnPluginStart()
{
	char game_name[64];
	GetGameFolderName(game_name, sizeof(game_name));
	if (!StrEqual(game_name, "left4dead2", false))
	{
		SetFailState("L4D2 Support only !");
	}
	CreateConVar("4k_precacher_version", "PLUGIN_VERSION", "Plugins Version");
	CvarPrintToServer = CreateConVar("l4d2_console_info", "1", "Prints text to server");
	L4d2Survivors = CreateConVar("l4d2_survivors", "1", "Precache L4D2 Survivors");
	L4dSurvivors = CreateConVar("l4d_survivors", "1", "Precache L4D Survivors");
	h_witch = CreateConVar("witch_precache", "1", "Precache Witch?");
	SpecialInfected = CreateConVar("4k_si_precache", "1", "Precache SI?");
	AutoExecConfig(true, "[L4D2]_4K_Precacher");
}
public void OnMapStart()
{
	if (!GetConVarBool(CvarPrintToServer))return;
	PrintToServer("##C0lt aka John Multi Precacher Loaded##");
	
	if (!GetConVarBool(L4d2Survivors))return;
	
	if (!IsModelPrecached("models/survivors/survivor_coach.mdl"))PrecacheModel("models/survivors/survivor_coach.mdl");
	if (!IsModelPrecached("models/survivors/survivor_gambler.mdl"))PrecacheModel("models/survivors/survivor_gambler.mdl");
	if (!IsModelPrecached("models/survivors/survivor_producer.mdl"))PrecacheModel("models/survivors/survivor_producer.mdl");
	if (!IsModelPrecached("models/survivors/survivor_mechanic.mdl"))PrecacheModel("models/survivors/survivor_mechanic.mdl");
	
	if (!GetConVarBool(L4dSurvivors))return;
	
	if (!IsModelPrecached("models/survivors/survivor_teenangst.mdl"))PrecacheModel("models/survivors/survivor_teenangst.mdl");
	if (!IsModelPrecached("models/survivors/survivor_biker.mdl"))PrecacheModel("models/survivors/survivor_biker.mdl");
	if (!IsModelPrecached("models/survivors/survivor_manager.mdl"))PrecacheModel("models/survivors/survivor_manager.mdl");
	if (!IsModelPrecached("models/survivors/survivor_namvet.mdl"))PrecacheModel("models/survivors/survivor_namvet.mdl");
	
	////Witch Files
	if (!GetConVarBool(h_witch))return;
	
	if (!IsModelPrecached("models/infected/witch.mdl"))PrecacheModel("models/infected/witch.mdl");
	if (!IsModelPrecached("models/infected/witch_bride.mdl"))PrecacheModel("models/infected/witch_bride.mdl");
	
	if (!GetConVarBool(SpecialInfected))return;
	
	if (!IsModelPrecached("models/infected/charger.mdl"))PrecacheModel("models/infected/charger.mdl");
	if (!IsModelPrecached("models/infected/smoker.mdl"))PrecacheModel("models/infected/smoker.mdl");
	if (!IsModelPrecached("models/infected/boomette.mdl"))PrecacheModel("models/infected/boomette.mdl");
	if (!IsModelPrecached("models/infected/boomer.mdl"))PrecacheModel("models/infected/boomer.mdl");
	if (!IsModelPrecached("models/infected/hunter.mdl"))PrecacheModel("models/infected/hunter.mdl");
	if (!IsModelPrecached("models/infected/jockey.mdl"))PrecacheModel("models/infected/jockey.mdl");
	if (!IsModelPrecached("models/infected/spitter.mdl"))PrecacheModel("models/infected/spitter.mdl");
	
}
