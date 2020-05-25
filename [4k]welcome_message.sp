#include <sourcemod>
#include <colors>

#pragma semicolon 1
#pragma newdecls required

bool gk_MessagesShown[MAXPLAYERS + 1];

ConVar g_SourceBans;
ConVar g_SteamGroup;

public Plugin myinfo = 
{
	name = "[L4D2] Welcome Message", 
	author = "C0lt", 
	description = "Display Welcome Message", 
	version = "4K.2", 
	url = "https://steamcommunity.com/groups/4kservers"
}
public void OnPluginStart()
{
	g_SourceBans = CreateConVar("4k_sourcebanslink", "www.4k-l4d2.com.pl/sourcebans", "Link sb");
	g_SteamGroup = CreateConVar("4k_steamgroup", "www.steamcommunity.com/groups/4kservers", "Link sg");
	HookEvent("player_first_spawn", Event_OnFirstSpawn);
}
public void OnMapStart()
{
	for (int i = 1; i <= MaxClients; i++)
	{
		gk_MessagesShown[i] = false;
	}
}
public void Event_OnFirstSpawn(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	
	if (client == 0 || IsFakeClient(client))
	{
		return;
	}
	
	CreateTimer(5.0, Timer_DelaySpawn, GetClientUserId(client), TIMER_FLAG_NO_MAPCHANGE);
}
public Action Timer_DelaySpawn(Handle timer, any data)
{
	int client = GetClientOfUserId(data);
	
	if (client == 0 || !IsPlayerAlive(client) || gk_MessagesShown[client])
	{
		return Plugin_Continue;
	}
	char sBansLink[128];
	char sSgLink[128];
	char name[128];
	GetClientName(client, name, sizeof(name));
	g_SourceBans.GetString(sBansLink, sizeof(sBansLink));
	g_SteamGroup.GetString(sSgLink, sizeof(sSgLink));
	CPrintToChat(client, "{olive}#{default}Welcome {blue}%s {default}on {green}4K {default}Server!", name);
	CPrintToChat(client, "{olive}#{default}Be {blue}nice {default}and play {green}fair!");
	CPrintToChat(client, "{olive}#{default}SourceBan Link: {blue}%s", sBansLink);
	CPrintToChat(client, "{olive}#{default}SteamGroup Link: {blue}%s", sSgLink);
	gk_MessagesShown[client] = true;
	return Plugin_Continue;
} 