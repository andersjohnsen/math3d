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
