const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const foo_dep = b.dependency("foo", .{ .target = target, .optimize = optimize });
    const foo = foo_dep.module("foo");
    const bar_dep = b.dependency("bar", .{ .target = target, .optimize = optimize });
    const bar = bar_dep.module("bar");

    const exe = b.addExecutable(.{
        .name = "package-issue",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe);
    exe.root_module.addImport("foo", foo);
    exe.root_module.addImport("bar", bar);

    const run_cmd = b.addRunArtifact(exe);

    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
