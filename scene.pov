// For animatingm e.g.:
// -KI0.0 -KF1.0 -KFF10 -Oim

// Example ffmpeg commands to make video:
// ffmpeg.exe -r 4 -i im%02d.png -vb 20M vid.mp4
// ffmpeg.exe -r 4 -i im%02d.png -r 4 -i scene%02d.png -filter_complex hstack=inputs=2 -vb 20M vid.mp4

#include "colors.inc"  // Include color name macros
#include "rad_def.inc"
global_settings { max_trace_level 2000 }
#if (1)
    global_settings {
       radiosity {
          Rad_Settings(Radiosity_Normal,off,off)
       }
    }
#end

// Formula to ensure that spheres pass through corners of the cube centered at the origin
//#declare MIN_R = sqrt(3); // below this point the spheres will intersect further inside the cube
#declare MIN_R = 3;
#declare S = 1; // square radius of the cube
#declare R = MIN_R/(clock+0.0001); // radius of sphere/cylinder
#declare X = S + sqrt(R*R-2*S*S); // coordinate of sphere center along each axis

#declare L = 0.3;
light_source { <L,L,-L> color White }

#declare M=0.2;
camera {
  angle 110.0
  location <M,M,M>
  look_at  <0,0,0>
}

// 6 mirror spheres arranged in a cube
#if (1)
    // reflective sphere
    #declare REF=0.7;
    #declare DIF=0.3;
    #declare SPEC=0.0;
    #declare ROUGH=0.02;
#else
    // non-reflective to show shape
    #declare REF=0.1;
    #declare DIF=0.7;
    #declare SPEC=0.2;
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

// static cube to give a sense of the room
#declare C = 0.3;
#declare P = -0.15;
union {
  box { <-1+C, -1, P-C>, <-1.0, -1+C, P> }
  texture {
    finish { diffuse 1.0 }
    pigment { color White }
  }
}