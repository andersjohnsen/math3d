import math

import .vector3

class Quaternion:
  static identity/Quaternion ::= Quaternion 0.0 0.0 0.0 1.0

  x/float ::= 0.0
  y/float ::= 0.0
  z/float ::= 0.0
  w/float ::= 0.0

  constructor .x .y .z .w:

  rotate v/Vector3 -> Vector3:
    qv := Vector3 x y z
    uv := qv.cross v
    uuv := qv.cross uv
    return v + ((uv * w) + uuv) * 2.0

  stringify:
    return "Quaternion($x, $y, $z, $w)"

  /**
  Returns the Euler angles of the Quaternion, with the following mapping:

  - x: The roll around the z axis.
  - y: The pitch around the x axis.
  - z: The yaw around the y axis.
  */
  euler_angles -> Vector3:
    // Roll (x-axis rotation).
    sinr_cosp ::= 2 * (w * x + y * z);
    cosr_cosp ::= 1 - 2 * (x * x + y * y);
    roll ::= math.atan2 sinr_cosp cosr_cosp

    // Pitch (y-axis rotation).
    sinp ::= 2 * (w * y - z * x);
    pitch ::= ?
    if sinp.abs >= 1.0:
      // TODO(anders): Use math.copysign when available.
        pitch = math.PI / 2.0 * sinp / sinp.abs // use 90 degrees if out of range
    else:
        pitch = math.asin sinp

    // Yaw (z-axis rotation).
    siny_cosp ::= 2 * (w * z + x * y)
    cosy_cosp ::= 1 - 2 * (y * y + z * z)
    yaw ::= math.atan2 siny_cosp cosy_cosp

    return Vector3
      roll
      pitch
      yaw
