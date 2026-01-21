/*

  Turns are a way of measuring angles in way where we don't have to care about arbitrary constants when we talk
  about a single turn.
  
  When working in degrees that arbitrary choice was 360.

  For radians that value is pi.
  
  The way we attach meaning to those values is that they map back to one turn around the
  circle, so why not just cut out the middle man and work with turns directly?
  
  Hey, for turns aren't we just using the arbitrary choice of 1? Yes but 1 is nicer and values that you already understand make sense.
  
  Want to turn around? Then do a half turn around the circle, so in turns that is 1/2, so the value matches what we expect.

*/

#import "Math";


/*
  
  There is an inherent direction rotation direction that gets baked into our formulas, lets discuss it for a moment.
  We usually use the carteisan plane, where the top right refers to values (x, y) where x > 0 and y > 0. 

  We also have watches, with hands on them, and they all rotate in a particular direction which we denoted as clockwise (cw),
  when something rotates in the other direction it's counter clock wise (ccw).
 
  When you consider the unit circle, we understand that the set {(cos(t), sin(t)) : 0 <= t < 2pi} carves it out. but as t ranges
  from 0 to 2pi, why does the hand move ccw? 

  To see why we know that (cos(0), sin(0)) = (1, 0), so that explains our starting point. But if we increase t to
  a new angle pi/2 >= t > 0 we get (cos(t), sin(t)) =  (0.x, 0.x), which is an element of the positive quadrant.

  We can then deduce that this change in movement is ccw by looking at the direction we have to rotate (1, 0) to get there.
*/

Rotation_Direction :: enum u32 {
    CW; 
    CCW;
};

one_sixth_turn := 1.0 / 6.0;
one_third_turn := 1.0 / 3.0;
one_half_turn := 0.5;
two_thirds_turn := 2.0 / 3.0;
five_sixths_turn := 5.0 / 6.0;

one_eighth_turn := 1.0 / 8.0;
three_eighths_turn := 3.0 / 8.0;
five_eighths_turn := 5.0 / 8.0;
seven_eighths_turn := 7.0 / 8.0;

one_quarter_turn := 1.0 / 4.0;
three_quarters_turn := 3.0 / 4.0;

full_turn := 1.0;

turns_to_radians :: (turns : float) -> float { return turns * TAU; };
radians_to_turns :: (radians : float) -> float { return radians / TAU; };
turns_to_degrees :: (turns : float) -> float { return turns * 360; };
degrees_to_turns :: (degrees : float) -> float { return degrees / 360; };

// ^ hey that alignment 'turned' out pretty nice

cos_turns :: (turns : float) -> float { return cos(turns_to_radians(turns)); }
sin_turns :: (turns : float) -> float { return sin(turns_to_radians(turns)); }

angle_to_unit_vector :: (t: float) -> Vector2 { return .{cos_turns(t), sin_turns(t)}; }

angle_to_unit_vector :: (t: float, u: Vector3, v: Vector3) -> Vector3 { return cos_turns(t) * u + sin_turns(t) * v; }



/*  turns full circle

                   ooo OOO OOO ooo
               oOO                 OOo
           oOO                         OOo
        oOO                               OOo
      oOO                                   OOo
    oOO                                       OOo
   oOO                                         OOo
  oOO                                           OOo
 oOO                                             OOo
 oOO                                             OOo
 oOO                                             OOo
 oOO                                             OOo
 oOO                                             OOo
  oOO                                           OOo
   oOO                                         OOo
    oOO                                       OOo
      oOO                                   OOo
        oO                                OOo
           oOO                         OOo
               oOO                 OOo
                   ooo OOO OOO ooo

*/

/**  turns circle cut into thirds

                   ooo OOO OOO ooo
               oOO                 OOo
           oOO    X                    OOo
        oOO        X                      OOo
      oOO           X                       OOo
    oOO              X                        OOo
   oOO                X                        OOo
  oOO                  X                        OOo
 oOO                    X                        OOo
 oOO                     X                       OOo
 oOO                      XXXXXXXXXXXXXXXXXXXXXXXOOo
 oOO                     X                       OOo
 oOO                    X                        OOo
  oOO                  X                        OOo
   oOO                X                        OOo
    oOO              X                        OOo
      oOO           X                       OOo
        oOO        X                      OOo
           oOO    X                    OOo
               oOO                 OOo
                   ooo OOO OOO ooo
*/

/**  turns circle cut into sixths

                   ooo OOO OOO ooo
               oOO                 OOo
           oOO    X               X    OOo
        oOO        X             X        OOo
      oOO           X           X           OOo
    oOO              X         X              OOo
   oOO                X       X                OOo
  oOO                  X     X                  OOo
 oOO                    X   X                    OOo
 oOO                     X X                     OOo
 oOOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXOOo
 oOO                     X X                     OOo
 oOO                    X   X                    OOo
  oOO                  X     X                  OOo
   oOO                X       X                OOo
    oOO              X         X              OOo
      oOO           X           X           OOo
        oOO        X             X        OOo
           oOO    X               X    OOo
               oOO                 OOo
                   ooo OOO OOO ooo

*/

/**  turns circle cut into quaters

                   ooo OOO OOO ooo
               oOO        X        OOo
           oOO            X            OOo
        oOO               X               OOo
      oOO                 X                 OOo
    oOO                   X                   OOo
   oOO                    X                    OOo
  oOO                     X                     OOo
 oOO                      X                      OOo
 oOO                      X                      OOo
 oOOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXOOo
 oOO                      X                      OOo
 oOO                      X                      OOo
  oOO                     X                     OOo
   oOO                    X                    OOo
    oOO                   X                   OOo
      oOO                 X                 OOo
        oO                X               OOo
           oOO            X            OOo
               oOO        X        OOo
                   ooo OOO OOO ooo

*/

/*  turns circle cut into eighths

                   ooo OOO OOO ooo
               oOO        X        OOo
           oOO            X            OOo
        oOO               X               OOo
      oOO  X              X              X  OOo
    oOO                   X                   OOo
   oOO          X         X         X          OOo
  oOO                     X                     OOo
 oOO                 X    X    X                 OOo
 oOO                      X                      OOo
 oOOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXOOo
 oOO                      X                      OOo
 oOO                 X    X    X                 OOo
  oOO                     X                     OOo
   oOO          X         X         X          OOo
    oOO                   X                   OOo
      oOO  X              X              X  OOo
        oOO               X               OOo
           oOO            X            OOo
               oOO        X        OOo
                   ooo OOO OOO ooo

*/
