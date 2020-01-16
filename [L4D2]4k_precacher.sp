#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "John"
#define PLUGIN_VERSION "4k"

#include <sourcemod>
#include <sdktools>

#pragma newdecls required

Handle CvarPrintToServer;
Handle L4d2Survivors;
Handle L4dSurvivors;
Handle WitchPreCacheEnabled;
Handle JockeyPreCacheEnabled;
Handle HunterPreCacheEnabled;
Handle BoomerPreCacheEnabled;
Handle ChargerPreCacheEnabled;
Handle SmokerPreCacheEnabled;
Handle SpitterPreCacheEnabled;

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
	CreateConVar("multi_precacher_version", "PLUGIN_VERSION", "Plugins Version");
	CvarPrintToServer = CreateConVar("l4d2_console_info", "1", "Prints text to server");
	L4d2Survivors = CreateConVar("l4d2_survivors", "1", "Precache L4D2 Survivors");
	L4dSurvivors = CreateConVar("l4d_survivors", "1", "Precache L4D Survivors");
	WitchPreCacheEnabled = CreateConVar("l4d2_precache_witch", "1", "Toggle precaching of witch models to prevent crashes caused by z_spawn witch/witch_bride");
	JockeyPreCacheEnabled = CreateConVar("l4d2_precache_jockey", "1", "Jockey precache");
	HunterPreCacheEnabled = CreateConVar("l4d2_precache_hunter", "1", "Hunter precache");
	BoomerPreCacheEnabled = CreateConVar("l4d2_precache_boomer", "1", "Boomer precache");
	ChargerPreCacheEnabled = CreateConVar("l4d2_precache_charger", "1", "Charger precache");
	SmokerPreCacheEnabled = CreateConVar("l4d2_precache_smoker", "1", "Smoker precache");
	SpitterPreCacheEnabled = CreateConVar("l4d2_precache_spitter", "1", "Spitter precache");
	AutoExecConfig(true, "[L4D2]_4K_Precacher");
}
public void OnMapStart()
{
	if (!GetConVarBool(CvarPrintToServer))return;
	PrintToServer("##John Multi Precacher Loaded##");
	
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
	if (!GetConVarBool(WitchPreCacheEnabled))return;
	
	if (!IsModelPrecached("models/infected/witch.mdl"))PrecacheModel("models/infected/witch.mdl");
	if (!IsModelPrecached("models/infected/witch_bride.mdl"))PrecacheModel("models/infected/witch_bride.mdl");
	
	/////Jockey
	if (!GetConVarBool(JockeyPreCacheEnabled))return;
	
	if (!IsModelPrecached("models/infected/jockey.mdl"))PrecacheModel("models/infected/jockey.mdl");
	if (!IsSoundPrecached("player/jockey/voice/idle/jockey_recognize02.wav"))PrecacheSound("player/jockey/voice/idle/jockey_recognize02.wav");
	if (!IsSoundPrecached("player/jockey/voice/idle/jockey_recognize06.wav"))PrecacheSound("player/jockey/voice/idle/jockey_recognize06.wav");
	if (!IsSoundPrecached("player/jockey/voice/idle/jockey_recognize07.wav"))PrecacheSound("player/jockey/voice/idle/jockey_recognize07.wav");
	if (!IsSoundPrecached("player/jockey/voice/idle/jockey_recognize08.wav"))PrecacheSound("player/jockey/voice/idle/jockey_recognize08.wav");
	if (!IsSoundPrecached("player/jockey/voice/idle/jockey_recognize09.wav"))PrecacheSound("player/jockey/voice/idle/jockey_recognize09.wav");
	if (!IsSoundPrecached("player/jockey/voice/idle/jockey_recognize10.wav"))PrecacheSound("player/jockey/voice/idle/jockey_recognize10.wav");
	if (!IsSoundPrecached("player/jockey/voice/idle/jockey_recognize11.wav"))PrecacheSound("player/jockey/voice/idle/jockey_recognize11.wav");
	if (!IsSoundPrecached("player/jockey/voice/idle/jockey_recognize12.wav"))PrecacheSound("player/jockey/voice/idle/jockey_recognize12.wav");
	if (!IsSoundPrecached("player/jockey/voice/idle/jockey_recognize13.wav"))PrecacheSound("player/jockey/voice/idle/jockey_recognize13.wav");
	if (!IsSoundPrecached("player/jockey/voice/idle/jockey_recognize15.wav"))PrecacheSound("player/jockey/voice/idle/jockey_recognize15.wav");
	if (!IsSoundPrecached("player/jockey/voice/idle/jockey_recognize16.wav"))PrecacheSound("player/jockey/voice/idle/jockey_recognize16.wav");
	if (!IsSoundPrecached("player/jockey/voice/idle/jockey_recognize17.wav"))PrecacheSound("player/jockey/voice/idle/jockey_recognize17.wav");
	if (!IsSoundPrecached("player/jockey/voice/idle/jockey_recognize18.wav"))PrecacheSound("player/jockey/voice/idle/jockey_recognize18.wav");
	if (!IsSoundPrecached("player/jockey/voice/idle/jockey_recognize19.wav"))PrecacheSound("player/jockey/voice/idle/jockey_recognize19.wav");
	if (!IsSoundPrecached("player/jockey/voice/idle/jockey_recognize20.wav"))PrecacheSound("player/jockey/voice/idle/jockey_recognize20.wav");
	if (!IsSoundPrecached("player/jockey/voice/idle/jockey_recognize24.wav"))PrecacheSound("player/jockey/voice/idle/jockey_recognize24.wav");
	if (!IsSoundPrecached("player/jockey/voice/warn/jockey_06.wav"))PrecacheSound("player/jockey/voice/warn/jockey_06.wav");
	if (!IsSoundPrecached("player/jockey/voice/warn/jockey_08.wav"))PrecacheSound("player/jockey/voice/warn/jockey_08.wav");
	if (!IsSoundPrecached("music/bacteria/jockeybacterias.wav"))PrecacheSound("music/bacteria/jockeybacterias.wav");
	
	
	/////Hunter
	if (!GetConVarBool(HunterPreCacheEnabled))return;
	
	if (!IsModelPrecached("models/infected/hunter.mdl"))PrecacheModel("models/infected/hunter.mdl");
	if (!IsSoundPrecached("player/hunter/voice/alert/hunter_alert_01.wav"))PrecacheSound("player/hunter/voice/alert/hunter_alert_01.wav");
	if (!IsSoundPrecached("player/hunter/voice/alert/hunter_alert_02.wav"))PrecacheSound("player/hunter/voice/alert/hunter_alert_02.wav");
	if (!IsSoundPrecached("player/hunter/voice/alert/hunter_alert_03.wav"))PrecacheSound("player/hunter/voice/alert/hunter_alert_03.wav");
	if (!IsSoundPrecached("player/hunter/voice/alert/hunter_alert_04.wav"))PrecacheSound("player/hunter/voice/alert/hunter_alert_04.wav");
	if (!IsSoundPrecached("player/hunter/voice/alert/hunter_alert_05.wav"))PrecacheSound("player/hunter/voice/alert/hunter_alert_05.wav");
	
	/////Booma
	if (!GetConVarBool(BoomerPreCacheEnabled))return;
	
	if (!IsModelPrecached("models/infected/boomer.mdl"))PrecacheModel("models/infected/boomer.mdl");
	if (!IsModelPrecached("models/infected/boomette.mdl"))PrecacheModel("models/infected/boomette.mdl");
	if (!IsSoundPrecached("player/boomer/voice/attack/female_boomer_spotprey_05.wav"))PrecacheSound("player/boomer/voice/attack/female_boomer_spotprey_05.wav");
	if (!IsSoundPrecached("player/boomer/voice/attack/female_boomer_spotprey_07.wav"))PrecacheSound("player/boomer/voice/attack/female_boomer_spotprey_07.wav");
	if (!IsSoundPrecached("player/boomer/voice/attack/female_boomer_spotprey_09.wav"))PrecacheSound("player/boomer/voice/attack/female_boomer_spotprey_09.wav");
	if (!IsSoundPrecached("player/boomer/voice/attack/female_boomer_spotprey_10.wav"))PrecacheSound("player/boomer/voice/attack/female_boomer_spotprey_10.wav");
	if (!IsSoundPrecached("player/boomer/voice/attack/female_boomer_spotprey_11.wav"))PrecacheSound("player/boomer/voice/attack/female_boomer_spotprey_11.wav");
	if (!IsSoundPrecached("player/boomer/voice/attack/female_boomer_spotprey_12.wav"))PrecacheSound("player/boomer/voice/attack/female_boomer_spotprey_12.wav");
	if (!IsSoundPrecached("player/boomer/voice/attack/male_boomer_spotprey_05.wav"))PrecacheSound("player/boomer/voice/attack/male_boomer_spotprey_05.wav");
	if (!IsSoundPrecached("player/boomer/voice/attack/male_boomer_spotprey_07.wav"))PrecacheSound("player/boomer/voice/attack/male_boomer_spotprey_07.wav");
	if (!IsSoundPrecached("player/boomer/voice/attack/male_boomer_spotprey_09.wav"))PrecacheSound("player/boomer/voice/attack/male_boomer_spotprey_09.wav");
	if (!IsSoundPrecached("player/boomer/voice/attack/male_boomer_spotprey_10.wav"))PrecacheSound("player/boomer/voice/attack/male_boomer_spotprey_10.wav");
	if (!IsSoundPrecached("player/boomer/voice/attack/male_boomer_spotprey_11.wav"))PrecacheSound("player/boomer/voice/attack/male_boomer_spotprey_11.wav");
	if (!IsSoundPrecached("player/boomer/voice/attack/male_boomer_spotprey_12.wav"))PrecacheSound("player/boomer/voice/attack/male_boomer_spotprey_12.wav");
	
	/////Charger
	if (!GetConVarBool(ChargerPreCacheEnabled))return;
	
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_01.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_01.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_02.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_02.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_03.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_03.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_04.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_04.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_05.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_05.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_06.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_06.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_07.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_07.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_08.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_08.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_09.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_09.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_10.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_10.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_11.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_11.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_12.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_12.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_13.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_13.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_14.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_14.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_15.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_15.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_16.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_16.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_17.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_17.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_18.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_18.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_19.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_19.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_20.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_20.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_21.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_21.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_22.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_22.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_lurk_23.wav"))PrecacheSound("player/charger/voice/idle/charger_lurk_23.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_spotprey_01.wav"))PrecacheSound("player/charger/voice/idle/charger_spotprey_01.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_spotprey_02.wav"))PrecacheSound("player/charger/voice/idle/charger_spotprey_02.wav");
	if (!IsSoundPrecached("player/charger/voice/idle/charger_spotprey_03.wav"))PrecacheSound("player/charger/voice/idle/charger_spotprey_03.wav");
	
	/////smoka
	if (!GetConVarBool(SmokerPreCacheEnabled))return;
	
	if (!IsModelPrecached("models/infected/smoker.mdl"))PrecacheModel("models/infected/smoker.mdl");
	if (!IsModelPrecached("models/infected/smoker_tongue_attach.mdl"))PrecacheModel("models/infected/smoker_tongue_attach.mdl");
	if (!IsSoundPrecached("player/smoker/attack/tongue_fly_loop.wav"))PrecacheSound("player/smoker/attack/tongue_fly_loop.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_lurk_01.wav"))PrecacheSound("player/smoker/voice/idle/smoker_lurk_01.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_lurk_03.wav"))PrecacheSound("player/smoker/voice/idle/smoker_lurk_03.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_lurk_04.wav"))PrecacheSound("player/smoker/voice/idle/smoker_lurk_04.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_lurk_06.wav"))PrecacheSound("player/smoker/voice/idle/smoker_lurk_06.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_lurk_08.wav"))PrecacheSound("player/smoker/voice/idle/smoker_lurk_08.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_lurk_09.wav"))PrecacheSound("player/smoker/voice/idle/smoker_lurk_09.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_lurk_10.wav"))PrecacheSound("player/smoker/voice/idle/smoker_lurk_10.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_lurk_11.wav"))PrecacheSound("player/smoker/voice/idle/smoker_lurk_11.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_lurk_12.wav"))PrecacheSound("player/smoker/voice/idle/smoker_lurk_12.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_lurk_13.wav"))PrecacheSound("player/smoker/voice/idle/smoker_lurk_13.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_spotprey_01.wav"))PrecacheSound("player/smoker/voice/idle/smoker_spotprey_01.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_spotprey_02.wav"))PrecacheSound("player/smoker/voice/idle/smoker_spotprey_02.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_spotprey_07.wav"))PrecacheSound("player/smoker/voice/idle/smoker_spotprey_07.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_spotprey_08.wav"))PrecacheSound("player/smoker/voice/idle/smoker_spotprey_08.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_spotprey_09.wav"))PrecacheSound("player/smoker/voice/idle/smoker_spotprey_09.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_spotprey_10.wav"))PrecacheSound("player/smoker/voice/idle/smoker_spotprey_10.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_spotprey_11.wav"))PrecacheSound("player/smoker/voice/idle/smoker_spotprey_11.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_spotprey_12.wav"))PrecacheSound("player/smoker/voice/idle/smoker_spotprey_12.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_spotprey_13.wav"))PrecacheSound("player/smoker/voice/idle/smoker_spotprey_13.wav");
	if (!IsSoundPrecached("player/smoker/voice/idle/smoker_spotprey_14.wav"))PrecacheSound("player/smoker/voice/idle/smoker_spotprey_14.wav");
	
	/////smoka
	if (!GetConVarBool(SpitterPreCacheEnabled))return;
	
	if (!IsModelPrecached("models/infected/spitter.mdl"))PrecacheModel("models/infected/spitter.mdl");
	if (!IsSoundPrecached("player/spitter/spitter_miss_01.wav"))PrecacheSound("player/spitter/spitter_miss_01.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_01.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_01.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_02.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_02.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_03.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_03.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_04.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_04.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_05.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_05.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_06.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_06.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_07.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_07.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_08.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_08.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_09.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_09.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_10.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_10.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_11.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_11.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_12.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_12.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_14.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_14.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_15.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_15.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_16.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_16.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_17.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_17.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_18.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_18.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_19.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_19.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_lurk_20.wav"))PrecacheSound("player/spitter/voice/idle/spitter_lurk_20.wav");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_spotprey_01"))PrecacheSound("player/spitter/voice/idle/spitter_spotprey_01");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_spotprey_02"))PrecacheSound("player/spitter/voice/idle/spitter_spotprey_02");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_spotprey_03"))PrecacheSound("player/spitter/voice/idle/spitter_spotprey_03");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_spotprey_04"))PrecacheSound("player/spitter/voice/idle/spitter_spotprey_04");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_spotprey_05"))PrecacheSound("player/spitter/voice/idle/spitter_spotprey_05");
	if (!IsSoundPrecached("player/spitter/voice/idle/spitter_spotprey_06"))PrecacheSound("player/spitter/voice/idle/spitter_spotprey_06");
}


