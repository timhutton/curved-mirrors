// For animatingm e.g.:
// -KI0.0 -KF1.0 -KFF10

#include "colors.inc"  // Include color name macros

global_settings { max_trace_level 200 }

// Formula to ensure that spheres pass through corners of the cube centered at the origin
#declare S = 1; // square radius of the cube
#declare R = 1.7/(clock+0.0001); // radius of sphere/cylinder
#declare X = S + sqrt(R*R-2*S*S); // coordinate of sphere center along each axis

light_source { <0.1,0.026,0.06> color White }

#declare M=0.2;
camera {
  angle 120.0
  location <M,M*0.2,M*0.5>
  look_at  <0,0,0>
}

// 6 mirror spheres arranged in a cube
#if (1)
    // reflective sphere
    #declare REF=0.65;
    #declare DIF=0.35;
    #declare SPEC=0.0;
    #declare ROUGH=0.02;
#else
    // non-reflective to show shape
    #declare REF=0.0;
    #declare DIF=0.7;
    #declare SPEC=0.7;
    #declare ROUGH=0.01;
#end
union {
  sphere { <-X,0,0>,R }
  texture {
    finish { diffuse DIF reflection REF specular SPEC roughness ROUGH }
    pigment { color White }
  }
}
union {
  sphere { <X,0,0>,R }
  texture {
    finish { diffuse DIF reflection REF specular SPEC roughness ROUGH }
    pigment { color Yellow }
  }
}
union {
  sphere { <0,0,X>,R }
  texture {
    finish { diffuse DIF reflection REF specular SPEC roughness ROUGH }
    pigment { color Green }
  }
}
union {
  sphere { <0,0,-X>,R }
  texture {
    finish { diffuse DIF reflection REF specular SPEC roughness ROUGH }
    pigment { color Blue }
  }
}
union {
  sphere { <0,X,0>,R }
  sphere { <0,-X,0>,R }
  texture {
    finish { diffuse DIF reflection REF specular SPEC roughness ROUGH }
    pigment { color Red }
  }
}
