#version 330 core

layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoord;

uniform mat4 M;
uniform mat4 normalM;
uniform mat4 V;
uniform mat4 P;

out VS_OUT {
	vec3 normal;
	vec3 color;
	vec2 texCoord;
	mat4 proj;
} vs_out;


void main()
{
	gl_Position =  V * M * vec4(aPos, 1.0);
	vs_out.texCoord = aTexCoord;
	vs_out.color  =  vec3(0.6,0.1,0.5);
	vs_out.proj = P;
	vs_out.normal = normalize((normalM * vec4(aNormal, 0.0)).xyz);
}
