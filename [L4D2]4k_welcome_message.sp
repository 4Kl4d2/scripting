#include <sourcemod>
#include <colors>

#pragma semicolon 1
#pragma newdecls required

bool g_b4kMessage[MAXPLAYERS + 1];

#define PLUGIN_AUTHOR "John"
#define PLUGIN_VERSION "4k"

ConVar g_4kServerLink;
ConVar g_4kWebsiteLink;

public Plugin myinfo = 
{
	name = "[L4D2] 4K Welcome Message", 
	author = PLUGIN_AUTHOR, 
	description = "4K Welcome Message", 
	version = PLUGIN_VERSION, 
	url = "https://steamcommunity.com/groups/4kservers"
};
public void OnPluginStart()
{
	g_4kServerLink = CreateConVar("4k_wm_sourcebans", "www.4k-l4d2.com.pl/sourcebans", "Link to sb page");
	g_4kWebsiteLink = CreateConVar("4k_wm_website", "", "");

	HookEvent("player_spawn", Event_OnPlayerSpawn);
}
public void OnMapStart()
{
	for (int i = 1; i <= MaxClients; i++)
	{
		g_b4kMessage[i] = false;
	}
}
public void Event_OnPlayerSpawn(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	
	if (client == 0 || IsFakeClient(client))
	{
		return;
	}
	
	CreateTimer(0.2, Timer_DelaySpawn, GetClientUserId(client), TIMER_FLAG_NO_MAPCHANGE);
}
public Action Timer_DelaySpawn(Handle timer, any data)
{
	int client = GetClientOfUserId(data);
	
	if (client == 0 || !IsPlayerAlive(client) || g_b4kMessage[client])
	{
		return Plugin_Continue;
	}

	char sServerLink[128];
	char sWebsiteLink[128];

	g_4kServerLink.GetString(sServerLink, sizeof(sServerLink));
	g_4kWebsiteLink.GetString(sWebsiteLink, sizeof(sWebsiteLink));
	
	CPrintToChat(client, "{green}►{default}Welcome on {blue}4K {default}Server!{green}◄", client);
	CPrintToChat(client, "{green}►{default}Enjoy Your stay and play {blue}fair{default}!◄", client, sWebsiteLink);
	CPrintToChat(client, "{green}►{olive}Good Luck{green}◄", client, sServerLink);
    //CPrintToChat(client, "{green}►{olive}test{green}◄", client, sServerLink);
	//CPrintToChat(client, "{green}►{olive}test{green}◄", client);
	g_b4kMessage[client] = true;
	
	return Plugin_Continue;
}

public void OnClientDisconnect(int client)
{
	g_b4kMessage[client] = false;
}