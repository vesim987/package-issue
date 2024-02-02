const std = @import("std");
const foo = @import("foo");
const bar = @import("bar");

pub fn main() !void {
    const a: foo.Foo = bar.createFoo(1);
    _ = a.add(1);
}
