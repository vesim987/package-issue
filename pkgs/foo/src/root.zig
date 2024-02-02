pub const Foo = struct {
    a: i32,
    pub fn init(a: i32) Foo {
        return .{ .a = a };
    }

    pub fn add(self: Foo, b: i32) i32 {
        return self.a + b;
    }
};
