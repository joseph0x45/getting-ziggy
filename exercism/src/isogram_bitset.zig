const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    var set: u26 = 0;
    for (str) |c| {
        if (!std.ascii.isAlphabetic(c)) continue;
        const position: u5 = @intCast(std.ascii.toLower(c) - 'a');
        const mask: u26 = @as(u26, 1) << position;
        if (set & mask != 0) {
            return false;
        }
        set |= mask;
    }
    return true;
}

pub fn main() void {
    const result = isIsogram("EmilyE Jung Schwartzkopf");
    std.debug.print("{}", .{result});
}
