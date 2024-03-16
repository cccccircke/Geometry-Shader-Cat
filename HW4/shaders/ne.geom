#version 330 core

layout(triangles) in;
layout(triangle_strip, max_vertices = 4 ) out;


in VS_OUT {
	vec3 normal;
	vec3 color;
	vec2 texCoord;
	mat4 proj;
} gs_in[];


out vec3 color;
out vec3 normal;
out vec2 texCoord;
out float alpha;



void main()
{
 alpha = 0.2;
 vec3 v1 = vec3(gl_in[0].gl_Position-gl_in[1].gl_Position);
 vec3 v2 = vec3(gl_in[2].gl_Position-gl_in[0].gl_Position);
 vec4 sur = vec4(normalize(cross(v1,v2)),0.0f);
 vec4 d = vec4(v1,0);

for(int i=0; i<3; i++)
  {
    gl_Position = gs_in[i].proj*(gl_in[i].gl_Position+(d*0.5));
	normal = gs_in[i].normal;
	color =  gs_in[i].color;
	texCoord = gs_in[i].texCoord;
    EmitVertex();
  }
   gl_Position =gl_in[2].gl_Position*0.2;
	normal = gs_in[0].normal;
	color =  vec3(0,0,0);
	texCoord = gs_in[0].texCoord;
	
    EmitVertex();
  EndPrimitive();

}