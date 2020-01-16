#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

float g_flTimeConnected[MAXPLAYERS + 1];

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
		CPrintToChatAll("{green}★ {olive}%N {default}loaded in {green}%.2f {default}seconds .", client, flFinalTime);
	}
}

public void OnClientDisconnect(int client)
{
	g_flTimeConnected[client] = 0.0;
}