#include <sourcemod>
#include <geoip>
#include <colors>
#include <smlib>

#pragma semicolon 1
#pragma newdecls required

float g_flTimeConnected[MAXPLAYERS + 1];

Handle g_DisconnectMessage;
Handle g_PrintDelay[MAXPLAYERS + 1];

public Plugin myinfo = 
{
	name = "4K Connect Info", 
	author = "C0lt", 
	description = "Display Player nickname, country , and loading time", 
	version = "4K.2", 
	url = "https://steamcommunity.com/groups/4kservers"
}
public void OnPluginStart()
{
	g_DisconnectMessage = CreateConVar("4k_disconnect_message", "1", "Show disconnect notification?");
}
public bool OnClientConnect(int client, char[] rejectmsg, int maxlen)
{
	{
		g_flTimeConnected[client] = GetEngineTime();
	}
	
	return true;
}
public void OnClientPutInServer(int client)
{
	g_PrintDelay[client] = CreateTimer(1.0, PrintDelay, client);
}
public void OnClientDisconnect(int client)
{
	if(Client_IsValid(client) && !IsFakeClient(client))
	{
		if (!GetConVarBool(g_DisconnectMessage))return;
		char name[128];
		GetClientName(client, name, sizeof(name));
		CPrintToChatAll("{olive}%s {default}left the game.", name);
		g_flTimeConnected[client] = 0.0;
	}
}
public Action PrintDelay(Handle timer, int client)
{
	 if(Client_IsValid(client) && !IsFakeClient(client))
	{
		float LoadingTime = GetEngineTime() - g_flTimeConnected[client];
		char ip[64], country[64], name[128];
		GetClientName(client, name, sizeof(name));
		GetClientIP(client, ip, sizeof(ip));
		GeoipCountry(ip, country, sizeof(country));
		//PrintToServer("[%s] , [%s], [%s] [%.2f]", name, ip, country, flFinalTime);
		CPrintToChatAll("{olive}%s {default}from {blue}%s {default}connected in {green}%.2f {default}seconds.", name, country, LoadingTime);
	}
}
