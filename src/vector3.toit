import math

class Vector3:
  static back/Vector3     ::= Vector3  0.0  0.0 -1.0
  static down/Vector3     ::= Vector3  0.0 -1.0  0.0
  static forward/Vector3  ::= Vector3  0.0  0.0  1.0
  static left/Vector3     ::= Vector3 -1.0  0.0  0.0
  static right/Vector3    ::= Vector3  1.0  0.0  0.0
  static up/Vector3       ::= Vector3  0.0  1.0  0.0
  static zero/Vector3     ::= Vector3  0.0  0.0  0.0

  x/float ::= 0.0
  y/float ::= 0.0
  z/float ::= 0.0

  constructor .x .y .z:

  stringify:
    return "Vector3($x, $y, $z)"

  abs -> Vector3:
    return Vector3 x.abs.to_float y.abs.to_float z.abs.to_float

  length -> float:
    return math.sqrt length_squared

  length_squared -> float:
    return dot this

  normalized -> Vector3:
    return this / length

  operator + other/Vector3 -> Vector3:
    return Vector3
      x + other.x
      y + other.y
      z + other.z

  operator - -> Vector3:
    return Vector3 -x -y -z

  operator - other/Vector3 -> Vector3:
    return Vector3
      x - other.x
      y - other.y
      z - other.z

  operator * other -> Vector3:
    if other is num:
      return Vector3
        x * other
        y * other
        z * other
    if other is Vector3:
      return Vector3
        x * other.x
        y * other.y
        z * other.z
    throw "UNSUPPORTED_TYPE"

  operator / other -> Vector3:
    if other is num:
      return Vector3
        x / other
        y / other
        z / other
    if other is Vector3:
      return Vector3
        x / other.x
        y / other.y
        z / other.z
    throw "UNSUPPORTED_TYPE"

  dot other/Vector3 -> float:
    return x * other.x + y * other.y + z * other.z

  cross other/Vector3 -> Vector3:
    return Vector3
      y * other.z - z * other.y
      z * other.x - x * other.z
      x * other.y - y * other.x
