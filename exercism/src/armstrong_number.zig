const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    if (num < 10) {
        return true;
    }
    const allocator = std.heap.page_allocator;
    const num_str: []u8 = std.fmt.allocPrint(allocator, "{}", .{num}) catch unreachable;
    defer allocator.free(num_str);
    const num_of_digits: usize = num_str.len;
    var sum: u128 = 0;
    for (num_str) |char| {
        const char_str: []u8 = std.fmt.allocPrint(allocator, "{c}", .{char}) catch unreachable;
        const char_int: u128 = std.fmt.parseInt(u128, char_str, 10) catch unreachable;
        sum += std.math.pow(u128, char_int, @as(u128, num_of_digits));
        allocator.free(char_str);
    }
    std.debug.print("{}", .{sum});
    return sum == num;
}

pub fn main() void {
    const result = isArmstrongNumber(9_474);
    std.debug.print("{}\n", .{result});
}
