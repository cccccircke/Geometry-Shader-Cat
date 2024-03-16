#version 330 core

layout (triangles) in;
layout (line_strip, max_vertices = 9) out;

in VS_OUT {
	vec3 normal;
	vec3 position;
	vec2 texCoord;
} gs_in[];

uniform mat4 P;

out vec4 color;
out vec2 uv;
// the alpha value of texture
out float alpha;

const float MAGNITUDE = 0.05;


void erect(float len)
{
    color = vec4(1.0,1.0,1.0,1.0);
    vec4 center , center_normal;
    for(int i = 0 ; i < gl_in.length() ; i++){
        center += gl_in[i].gl_Position;
        center_normal += vec4(gs_in[i].normal, 0.0f);
    }
    center /= gl_in.length();
    center_normal /= gl_in.length();
    
        color = vec4(1.0,1.0,1.0,1.0);
        for(int i = 0 ; i < gl_in.length() ; i++){
            uv = gs_in[i].texCoord;
            gl_Position = gl_in[i].gl_Position;
            EmitVertex();
            gl_Position = gl_in[(i+1) % gl_in.length()].gl_Position;
            EmitVertex();
            gl_Position = center + center_normal * len;
            EmitVertex();
            EndPrimitive();
        }
}

void main()
{
	  alpha = 0.8;
      erect(0.1);
}