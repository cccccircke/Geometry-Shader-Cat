#version 330 core

uniform sampler2D ourTexture;

in vec3 color;
in vec3 normal;
in vec2 texCoord;
in  float alpha;
out vec4 fragcolor;

void main()
{
	fragcolor = texture2D(ourTexture, texCoord) * alpha + vec4(color, 1.0)* (1 - alpha);
} 