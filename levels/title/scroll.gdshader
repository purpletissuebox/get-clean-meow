shader_type canvas_item;

const float speed = 25.0;
const vec2 dir = vec2(1,-1);

void vertex() {
	UV = (VERTEX + TIME*speed*dir)*TEXTURE_PIXEL_SIZE;
}