const std = @import("std");
const mach = @import("mach");

pub const App = @This();

pub fn init(app: *App) !void {
    _ = app;
}

pub fn update(app: *App) !bool {
    _ = app;
    return false;
}

pub fn deinit(app: *App) void {
    _ = app;
}
