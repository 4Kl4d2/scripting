#include <sourcemod>
#include <geoip>
#include <colors>

#pragma semicolon 1
#pragma newdecls required

float g_flTimeConnected[MAXPLAYERS + 1];

public Plugin myinfo = 
{
	name = "4K Connect Info", 
	author = "C0lt", 
	description = "Display Player Country, and loading time", 
	version = "4K", 
	url = "https://steamcommunity.com/groups/4kservers"
}

public bool OnClientConnect(int client, char[] rejectmsg, int maxlen)
{
	if (!IsFakeClient(client))
	{
		g_flTimeConnected[client] = GetEngineTime();
	}
	
	return true;
}

public void OnClientPostAdminCheck(int client)
{
	if (!IsFakeClient(client))
	{
		float flFinalTime = GetEngineTime() - g_flTimeConnected[client];
		char ip[64], country[64], name[64];
		GetClientName(client, name, sizeof(name));
		GetClientIP(client, ip, sizeof(ip));
		GeoipCountry(ip, country, sizeof(country));
		//PrintToServer("%s , %s, %s %.2f", name, ip, country, flFinalTime);
		CPrintToChatAll("{default}Player {olive}%s{default}[{blue}%s{default}] connected in {green}%.2f {default}seconds", name, country, flFinalTime);
	}
}

public void OnClientDisconnect(int client)
{
	g_flTimeConnected[client] = 0.0;
} 