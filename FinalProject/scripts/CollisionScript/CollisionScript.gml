// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CollisionScript()
{
	if (place_meeting(x, y, objKey))
	{
		holdKey = true;
		instance_destroy(objKey);
		
		audio_play_sound(sndCollectKey, 10, false);
	}
	else if (place_meeting(x, y, objDoor) && holdKey)
	{
		instance_destroy(objDoor);
		
		audio_play_sound(sndOpenDoor, 10, false);
	}
	else if (place_meeting(x, y, objExit))
	{
		room_goto(0);
		
		audio_play_sound(sndGameEnd, 10, false);
	}
	else
	{
		if (place_meeting(x, y, objSolid))
		{			
			var new_x = x;
		
			for (var dist_moved = 0; dist_moved < abs(hSpeed); dist_moved++)
			{
				new_x -= sign(hSpeed);
			
				if (!place_meeting(new_x, y, objSolid))
				{
					x = new_x;
					hSpeed = 0;
					break;
				}
			}
		}
	
		if (place_meeting(x, y, objSolid))
		{
			var new_y = y;
		
			for (var dist_moved = 0; dist_moved < abs(vSpeed); dist_moved++)
			{
				new_y -= sign(vSpeed);
			
				if (!place_meeting(x, new_y, objSolid))
				{
					y = new_y;
					vSpeed = 0;
					break;
				}
			}
		}
	}
}