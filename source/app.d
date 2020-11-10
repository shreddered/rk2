import std.stdio;

import std.algorithm : each;
import std.range;
import std.array : array;
import std.math : exp, pow;
import std.random : uniform;
import std.typecons;

alias fn = (x, y) => exp(-pow(x, 2) - pow(y, 2));

immutable ulong N = 6u;

alias Point = Tuple!(double, "x", double, "y", double, "fit");

void generatePoint(alias func)(ref Point p) {
    p.x = uniform!"()"(-2.0, 2.0);
    p.y = uniform!"()"(-2.0, 2.0);
    p.fit = func(p.x, p.y);
}

void main() {
    Point[] arr = new Point[] (N);

    arr.each!(generatePoint!fn);

    alias select2 = (arr) {
        ulong i1, i2;
        while (i1 != i2) {
            i1 = uniform(0, arr.length);
            i2 = uniform(0, arr.length);
        }
        return [arr[i1], arr[i2]];
    };
    for (ulong i = 0; i != 10; ++i) {
        auto pair = select2(arr);
    }
}
