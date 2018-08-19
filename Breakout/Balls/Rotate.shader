shader_type canvas_item;
render_mode blend_mix;

void vertex(){
	
	
	//Rotate around y axis
	float delta = 2.0;
	float x = sin(TIME*delta);
	float y = -cos(TIME*delta);
	vec2 i = vec2(x,y);
	vec2 j = vec2(y,-x);
	VERTEX.xy = mat2(i,j) 
				* VERTEX.xy;
	}