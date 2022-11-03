#include "colors.inc"  // Include color name macros

global_settings { max_trace_level 200 }

#declare SR = 1; // square radius
#declare H = 0.9;
#declare R = SR*3.6; // radius of sphere/cylinder
#declare X = sqrt(R*R-2)+SR;

light_source { <0.1,0.26,0.06> color White }

#declare M=7;
camera {
  ultra_wide_angle   
  //angle 40
  location <M*0.0,0,M*0.06>
  look_at  <0,0,0>
}

// 6 mirror spheres arranged in a cube
#declare REF=0.6;
#declare DIF=0.4;
union {
  sphere { <-X,0,0>,R }
  texture {
    finish { diffuse DIF reflection REF }
    pigment { color White }
  }
}
union {
  sphere { <X,0,0>,R }
  texture {
    finish { diffuse DIF reflection REF }
    pigment { color Yellow }
  }
}
union {
  sphere { <0,0,X>,R }
  texture {
    finish { diffuse DIF reflection REF }
    pigment { color Green }
  }
}
union {
  sphere { <0,0,-X>,R }
  texture {
    finish { diffuse DIF reflection REF }
    pigment { color Blue }
  }
}
union {
  sphere { <0,X,0>,R }
  sphere { <0,-X,0>,R }
  texture {
    finish { diffuse DIF reflection REF }
    pigment { color Red }
  }
}
