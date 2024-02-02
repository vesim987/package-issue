pub const foo = @import("foo");

pub fn createFoo(a: i32) foo.Foo {
    return foo.Foo.init(a);
}
