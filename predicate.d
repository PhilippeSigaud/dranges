/**
This module contains some usual predicates, either on entire ranges or on their elements.
*/
module dranges.predicate;

import std.algorithm;
import std.functional;
import std.range;
import std.traits;


import dranges.range2 : segment;
import dranges.traits2;
import dranges.functional2;
import dranges.templates;

/**
Is true if some (at least one) element in range verify the predicate pred. False otherwise.
Typically, it's used with a unary (1-arg) predicate, but it accepts predicates of any arity.
If the predicate is a n-args function (n>1), it will be presented with n-elements 'segments'
of the range, with a step of one: interleaved segments.
See_Also: range2.d/segment.
TODO: add an optional step argument?
Example:
----
int[] r1 = [0,1,2,3];
int[] r2 = [];
assert(some!"a>0"(r1));
assert(!some!"a>3"(r1));
assert(!some!"a>0"(r2)); // empty range: no element can verify the predicate

assert(some!"a<b"(r1));  // Increasing range
assert(!some!"b<a"(r1));
assert(!some!"a<f"(r1)); // 6-args function -> no match -> some is false

assert(some!"true"(r1)); // degenerate case: nullary predicate.
assert(!some!"false"(r1));
----
*/
bool some(alias pred, R)(R range) if (isForwardRange!R && arity!pred == 1){
    alias unaryFun!pred predicate;
    foreach(elem; range) {if (predicate(elem)) return true;}
    return false;
}

bool some(alias pred, R)(R range) if (isForwardRange!R && arity!pred > 1){
    auto sr = segment!(arity!pred)(range);
    alias Prepare!(pred, TypeNuple!(Unqual!(ElementType!R), arity!pred)) predicate;
    foreach(elem; sr) {if (predicate(elem)) return true;}
    return false;
}

// degenerate case. Might be useful if pred is generated by a template and leads to a nullary function
bool some(alias pred, R)(R range) if (isForwardRange!R && arity!pred == 0){
    return naryFun!pred();
}

unittest {
    int[] r1 = [0,1,2,3];
    int[] r2 = [];
    assert(some!"a>0"(r1));
    assert(!some!"a>3"(r1));
    assert(!some!"a>0"(r2)); // empty range: no element can verify the predicate

    assert(some!"a<b"(r1));  // Increasing range
    assert(!some!"b<a"(r1));
    assert(!some!"a<f"(r1)); // 6-args function -> no match -> some is false

    assert(some!"true"(r1)); // degenerate case: nullary predicate.
    assert(!some!"false"(r1));
}

/**
Is true if all elements in range verify the predicate pred. False otherwise. Typically,
it's used with a unary (1-arg) predicate, but it accepts predicates of any arity. If
the predicate is a n-args function (n>1), it will be presented with n-elements 'segments'
of the range, with a step of one: interleaved segments.
See_Also: range2.d/segment.
TODO: add an optional step argument?
----
int[] r1 = [0,1,2,3];
int[] r2 = [];
assert(all!"a>=0"(r1));
assert(!all!"a>0"(r1));
assert(all!"a>0"(r2)); // empty range: any property is verified by the (inexistent) elements

assert(all!"a<b"(r1));  // Binary function. Tests for an increasing range
assert(!all!"b<a"(r1));
assert(all!"a<f"(r1)); // 6-args function -> no match -> empty segment range -> all is true

assert(all!"true"(r1)); // degenerate case: nullary predicate.
assert(!all!"false"(r1));
----
*/
bool all(alias pred, R)(R range) if (isForwardRange!R && arity!pred == 1) {
    alias unaryFun!pred predicate;
    foreach(elem; range) {if (!predicate(elem)) return false;}
    return true;
}

bool all(alias pred, R)(R range) if (isForwardRange!R && arity!pred > 1) {
    auto sr = segment!(arity!pred)(range);
    alias Prepare!(pred, TypeNuple!(Unqual!(ElementType!R), arity!pred)) predicate;
    foreach(elem; sr) {if (!predicate(elem)) return false;}
    return true;
}

// degenerate case: a nullary predicate (ie: always false or always true)
bool all(alias pred, R)(R range) if (isForwardRange!R && arity!pred == 0) {
    return naryFun!pred();
}

unittest {
    int[] r1 = [0,1,2,3];
    int[] r2 = [];
    assert(all!"a>=0"(r1));
    assert(!all!"a>0"(r1));
    assert(all!"a>0"(r2)); // empty range: any property is verified by the (inexistent) elements

    assert(all!"a<b"(r1));  // Binary function. Tests for an increasing range
    assert(!all!"b<a"(r1));
    assert(all!"a<f"(r1)); // 6-args function -> no match -> empty segment range -> all is true

    assert(all!"true"(r1)); // degenerate case: nullary predicate.
    assert(!all!"false"(r1));
}



/**
A bunch of small one-liners, using all. Their names may be subject to change, as
I don't like them much.
The tests are (respectively): "a<b", "a<=b", "a>b","a>=b", "a==b" and "a!=b".
*/
bool isStrictlyIncreasing(R)(R range) if (isForwardRange!R)
{
    return all!"a<b"(range);
}

/// ditto
bool isIncreasing(R)(R range) if (isForwardRange!R)
{
    return all!"a<=b"(range);
}

/// ditto
bool isStrictlyDecreasing(R)(R range) if (isForwardRange!R)
{
    return all!"a>b"(range);
}

/// ditto
bool isDecreasing(R)(R range) if (isForwardRange!R)
{
    return all!"a>=b"(range);
}

/// ditto
bool isConstant(R)(R range) if (isForwardRange!R)
{
    return all!"a==b"(range);
}

/// ditto
bool hasNoPair(R)(R range) if (isForwardRange!R)
{
    return all!"a!=b"(range);
}

/**
Return:
true iff all the range elements are different (as tested with inclusion in an associative array).
TODO:
Maybe another version with an aliased predicate? I don't know how to use an AA in this case, so that would
be much slower. But that would allow using approxEqual on floating point elements.
*/
bool allDifferent(R)(R range) if (isInputRange!R)
{
    bool[ElementType!R] aa;
    foreach(elem; range) {
        if (elem in aa) {
            return false;
        }
        else {
            aa[elem] = true;
        }
    }
    return true;
}

unittest
{
    auto r1 = [0,1,2,3,4,5];
    auto r2 = [0,1,2,3,3,3];
    auto r3 = [0,0,0,0,0,0];

    assert(isStrictlyIncreasing(r1));
    assert(isIncreasing(r1));

    assert(!isStrictlyIncreasing(r2));
    assert(isIncreasing(r2));

    assert(isStrictlyDecreasing(retro(r1)));
    assert(isDecreasing(retro(r1)));

    assert(!isStrictlyDecreasing(retro(r2)));
    assert(isDecreasing(retro(r2)));

    assert(isConstant(r3));
    assert(!isConstant(r1));

    assert(hasNoPair(r1));
    assert(!hasNoPair(r2));

    assert(allDifferent(r1));
    assert(!allDifferent(r2));

    int[] e; // Empty range: its (inexistent) elements have all the possible properties

    assert(isStrictlyIncreasing(e));
    assert(isIncreasing(e));
    assert(isStrictlyDecreasing(e));
    assert(isDecreasing(e));
    assert(isConstant(e));
    assert(hasNoPair(e));
    assert(allDifferent(e));
}

/+ Cannot work with naryFun!fun -> it creates a templated function, no return type
template isPredicate(alias fun) {
    enum bool isPredicate = isFunction!fun && is(ReturnType!(naryFun!fun) == bool);
}
+/
/**
Is true iff some ranges in the variadic list ranges are empty. False otherwise.
*/
bool someEmpty(R...)(R ranges) {
    foreach(i, r; ranges) {if (ranges[i].empty) return true;}
    return false;
}

/**
If true iff all ranges are empty.
*/
bool allEmpty(R...)(R ranges) {
    foreach(r; ranges) {if (!r.empty) return false;}
    return true;
}


/**
Given a variadic list of ranges, returns true iff all _ranges in ranges verify
pred. The difference with std.traits.allSatisfy is that the latter act on types,
whereas allVerify act on instances (values, whatever). The difference with 'all'
is that 'all' acts on one range, and tests the predicate on the range's elements.
Example:
----
int[] r1 = [0,1,2];
string r2 = "abc";
assert(allVerify!"a.length > 2"(r1,r2));
----
*/
bool allVerify(alias pred, R...)(R ranges) if (allSatisfy!(isInputRange, R)){
    alias naryFun!pred predicate;
    foreach(i, Unused; R) {if (!predicate(ranges[i])) return false;}
    return true;
}

unittest {
    int[] r1 = [0,1,2];
    string r2 = "abc";
    assert(allVerify!"a.length > 2"(r1,r2));
}


/**
Given a variadic list of ranges, returns true iff some (at least one) _ranges
in ranges verify the predicate pred.
Example:
----
int[] r1 = [0,1,2];
string r2 = "abcde";
assert(someVerify!"a.length > 4"(r2));
----
*/
bool someVerify(alias pred, R...)(R ranges) if (allSatisfy!(isInputRange, R)){
    alias naryFun!pred predicate;
    foreach(elem; ranges) {if (predicate(elem)) return true;}
    return false;
}

unittest {
    int[] r1 = [0,1,2];
    string r2 = "abcde";
    assert(someVerify!"a.length > 4"(r2));
}

/*
template sameLength(R...) if (allSatisfy!(hasLength, R)) {
    static if (R.length < 2) // 1 or 0 range
        enum bool sameLength = true;
    else
        enum bool sameLength = haveLength!(R[0].length, R[1..$]);
}

template haveLength(size_t l, R...) if (allSatisfy!(hasLength, R)) {
    static if (R.length == 0)
        enum bool haveLength = true;
    else
        enum bool haveLength = (R[0].length == l) && haveLength!(l, R[1..$]);
}
*/


/**
Returns true iff element is one of the elements of range.
Used as a predicate to find a subrange inside another range: dropWhile!(isOneOf!"abc")(r1)
It may never terminate if range is infinite,
but as an optimization, isOneOf detects Cycle!U and works only on the cycle internal range.
See_Also: contains, in algorithm2.d. Maybe I could define one with another...
Example:
----
string s = "01212345";
auto m = map!(isOneOf!"012")(s);
assert(equal(m, [true,true,true,true,true,false,false,false][]));

auto c = cycle("012");
auto m2 = map!(isOneOf!c)(s); // doesn't hang, as it's equivalent to isOneOf!"012"
assert(equal(m2, m));
----
*/
bool isOneOf(alias range)(Unqual!(ElementType!(typeof(range))) element) {
    static if (is(typeof(range) R1 == Cycle!U, U)) {
        return some!(equals!(element, Unqual!(ElementType!U)))(range._original);
    }
    else {
        return some!(equals!(element, Unqual!(ElementType!(typeof(range)))))(range);
    }
}

unittest
{
    string s = "01212345";
    auto m = map!(isOneOf!"012")(s);
    assert(equal(m, [true,true,true,true,true,false,false,false][]));
    auto c = cycle("012");
    auto m2 = map!(isOneOf!c)(s); // doesn't hang, as it's equivalent to isOneOf!"012"
    assert(equal(m2, m));
}

/**
Returns true iff if all values in the variadic list vals are equal.
Examples:
----
assert(allEqual(1,1.0,1.0000,1)); // The values are automatically converted
assert(allEqual(1)); // one element, always true.
assert(allEqual()); // no element, always true.
assert(!allEqual(1,2));
----
*/
bool allEqual(T...)(T vals) {
    foreach(i, elem; T[0..$]) if (vals[i] != vals[0]) return false;
    return true;
}

unittest
{
  assert(allEqual(1,1.0,1.0000,1)); // The values are automatically converted
  assert(allEqual(1)); // one element, always true.
  assert(allEqual()); // no element, always true.
  assert(!allEqual(1,2));
}

/**
Returns true if t equals value. If value and t don't have compatible types, it returns false.
Example:
----
int[] r = [0,1,0,1,2,0,3];
assert(equals!0(r.front));

auto m = map!(equals!(0,int))(r);
assert(equal(m, [true,false,true,false,false,true,false][]));

assert(!equals!"a"(r.front));
----
*/
bool equals(alias value, T)(T t) {
    static if (!is(CommonType!(typeof(value), T) == void))
        return t == value;
    else
        return false;
}

unittest
{
    int[] r = [0,1,0,1,2,0,3];
    assert(equals!0(r.front));
    auto m = map!(equals!(0,int))(r);
    assert(equal(m, [true,false,true,false,false,true,false][]));

    assert(!equals!"a"(r.front));

}

/**
curried form of equals.
*/
bool delegate(T) equals(T)(T t)
{
    return (T t2) { return t2 == t;};
}

/**
Small simple predicates on integral types.
*/
bool isOdd(T)(T t) if (isIntegral!T) { return t%2 == 1;}
/// ditto
bool isEven(T)(T t) if (isIntegral!T) { return t%2 == 0;}

/**
Takes a predicate and inverts it. It's an attempt to get 'std.functional.not' to work.
I've had some difficulties to use it in filters.
See_Also: separate, in algorithm2.d.
Example:
----
int[] r = [0,1,2,3,4,5];
auto f1 = filter!isOdd(r);
auto f2 = filter!(Not!isEven)(r);
assert(equal(f1,f2));


----
*/
template Not(alias fun) {
    bool Not(T)(T t) {
        return !(naryFun!fun(t));
    }
}

unittest
{
    int[] r = [0,1,2,3,4,5];
    auto f1 = filter!isOdd(r);
    auto f2 = filter!(Not!isEven)(r);
    assert(equal(f1,f2));
}



struct Nub(T) {
    bool[T] values;
    bool opCall(T t) {
        if (t in values) {
            return false;
        }
        else {
            values[t] = true;
            return true;
        }
    }
}

Nub!T nub(T)()
{
    Nub!T n;
    return n;
}
