import std.stdio;

import std.algorithm : reduce;
import std.array : array;
import std.math : exp, pow;
import std.random : uniform;

alias fn = (x, y) => exp(-pow(x, 2) - pow(y, 2));

immutable ulong N = 6u;

struct Point {
    private double[3] arr;
    alias arr this;

    static Point generate(alias func)() {
        Point p;
        p[0] = uniform!"[]"(-2.0, 2.0);
        p[1] = uniform!"[]"(-2.0, 2.0);
        p[2] = func(p[0], p[1]);
        return p;
    }
}


void main() {
    Point[] arr = new Point[] (N);
    Selection[] s = new Selection[] (N)

    foreach(ref elem; arr) {
        elem = Point.generate!fn();
    }

    for (ulong i = 0; i != 10; ++i) {
    }

}
