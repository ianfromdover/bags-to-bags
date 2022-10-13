/// @description Unique properties
isStealable = false; // implement chk to collide with personal bag

// squares the item has, relative to the center
// for pieces with an even no. of sides, it is at btm left corner
a = new Vector2(0, 0);
b = new Vector2(0, 1);
c = new Vector2(1, 1);
d = new Vector2(0, -1);
e = new Vector2(1, -1);

array_push(occupiedSquares, a, b, c, d, e);