state("PlagueProject-Win64-Shipping", "Release")
{
	byte Cutscene 		: 0x4C29BA0, 0x58, 0x1C0, 0x3C;
	byte isLoading		: 0x4C290D8, 0x460, 0x68;
	float X				: 0x4C290D8, 0x4A0, 0x18, 0x280, 0x6B0, 0x308, 0x68, 0x200;
	float Y				: 0x4C290D8, 0x4A0, 0x18, 0x280, 0x6B0, 0x308, 0x68, 0x208;
	float Z				: 0x4C290D8, 0x4A0, 0x18, 0x280, 0x6B0, 0x308, 0x68, 0x204;
	byte Credits		: 0x46649E0, 0x540, 0x8;
}

state("PlagueProject-Win64-Shipping", "Patch1")
{
	byte Cutscene 		: 0x4D231D0, 0x58, 0x1C0, 0x3C;
	byte isLoading		: 0x4D226F8, 0x460, 0x68;
	float X				: 0x4D226F8, 0x4A0, 0x18, 0x280, 0x6B0, 0x308, 0x68, 0x200;
	float Y				: 0x4D226F8, 0x4A0, 0x18, 0x280, 0x6B0, 0x308, 0x68, 0x208;
	float Z				: 0x4D226F8, 0x4A0, 0x18, 0x280, 0x6B0, 0x308, 0x68, 0x204;
	byte Credits		: 0x48D4160, 0x540, 0x8;
}

init
{
	switch (modules.First().ModuleMemorySize)
	{
		case (85843968):
			version = "Patch1";
			break;
		default:
			version = "Release";
			break;
	}
}

update
{
	//print(modules.First().ModuleMemorySize.ToString());
}

start
{
	return current.X > 17214f && current.X < 17215f && current.Y > 8f && current.Y < 9f && current.Z > 11398f && current.Z < 11399f;
}

split
{
	return current.Credits == 65 && old.Credits == 61 && current.X > 691f && current.X < 692f && current.Y > 96f && current.Y < 97f && current.Z > 3228f && current.Z < 3229f;
}

isLoading
{
	return current.Cutscene == 1 || current.isLoading != 0 || current.X == 0f && current.Y == -90f && current.Z == 0f || current.X == 0f && current.Y == 0f && current.Z == 0f;
}

reset
{
	return current.X > 17214f && current.X < 17215f && old.X == 0f && current.Y > 8f && current.Y < 9f && old.Y == -90f && current.Z > 11398f && current.Z < 11399f && old.Z == 0f;
}
