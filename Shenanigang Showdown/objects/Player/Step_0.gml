//Inputs
right_key = keyboard_check( vk_right);
left_key = keyboard_check(vk_left);
jump_key = keyboard_check(vk_up);

//Movement based on button press
move_x = (right_key - left_key) * move_speed;
// apply gravity
move_y += grav;

//jump
if jump_key && place_meeting(x, y+1, obj_ground)
{
	move_y = jump_speed;
}

//x collision
if place_meeting(x + move_x, y, obj_ground)
{
	//move player as close to the wall as possible
	var _pixelcheck = sign(move_x);
	while !place_meeting(x + _pixelcheck, y, obj_ground)
	{
		x += _pixelcheck;
	}
	
	//set speed to 0
	move_x = 0;
}

//y collision
if place_meeting(x + move_x, y + move_y, obj_ground)
{
	//move player as close to the wall as possible
	var _pixelcheck = sign(move_y);
	while !place_meeting(x + move_x, y + _pixelcheck, obj_ground)
	{
		y += _pixelcheck;
	}
	
	//set speed to 0
	move_y = 0;
	
}

x += move_x;
y += move_y;
