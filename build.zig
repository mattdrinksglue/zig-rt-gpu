const std = @import("std");
const mach = @import("libs/mach/build.zig");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const deps: []const std.Build.ModuleDependency = &.{};
    const app = try mach.App.init(b, .{
        .name = "myapp",
        .src = "src/main.zig",
        .target = target,
        .deps = deps,
        .optimize = optimize,
    });
    try app.link(.{});
    app.install();

    const run_cmd = try app.run();
    run_cmd.dependOn(b.getInstallStep());

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(run_cmd);
}
