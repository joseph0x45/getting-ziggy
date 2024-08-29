const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    var buffer: [64]u8 = undefined;
    const num_str = std.fmt.bufPrint(&buffer, "{d}", .{num}) catch unreachable;
    std.debug.print("{s}", .{buffer});
    std.debug.print("{s}", .{num_str});
    var sum: u128 = 0;
    for (num_str) |char| {
        const value = char - '0';
        sum += std.math.powi(u128, value, num_str.len) catch unreachable;
    }
    return sum == num;
}

pub fn main() void {
    const result = isArmstrongNumber(9_474);
    std.debug.print("{}\n", .{result});
}
