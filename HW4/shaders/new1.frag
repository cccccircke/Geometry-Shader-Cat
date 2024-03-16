#version 330 core

uniform sampler2D ourTexture;

in vec2 uv;
in vec4 color;
in float alpha;
out vec4 fragcolor;

void main()
{
	fragcolor = texture2D(ourTexture, uv) * alpha + color * (1 - alpha);
} 