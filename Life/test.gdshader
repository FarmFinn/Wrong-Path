shader_type canvas_item;

uniform vec2 center = vec2(640.0, 360.0);

uniform float radius = 150.0;

// 전체 그라데이션 폭(px)
uniform float fade_width = 20.0;

uniform vec4 ring_color : source_color = vec4(1.0);

void fragment()
{
    float d = distance(FRAGCOORD.xy, center);

    // 원 둘레에서 얼마나 떨어져 있는지
    float dist = abs(d - radius);

    // 링만 남김
    float alpha = 1.0 - smoothstep(0.0, fade_width, dist);

    COLOR = vec4(ring_color.rgb, alpha * ring_color.a);
}