const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // ERROR: missing optimize
    const foo_dep = b.dependency("foo", .{ .target = target });
    const foo = foo_dep.module("foo");

    const bar = b.addModule("bar", .{
        .root_source_file = .{ .path = "src/root.zig" },
        .target = target,
        .optimize = optimize,
    });

    bar.addImport("foo", foo);
}
