const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    const expected_sum = 26;
    var actual_sum: u32 = 0;
    const allocator = std.heap.page_allocator;
    var map = std.AutoHashMap(u8, u32).init(allocator);
    for (str) |char| {
        const lower_cased = std.ascii.toLower(char);
        var value: u32 = 0;
        if (std.ascii.isAlphabetic(lower_cased)) {
            value = 1;
        }
        map.put(lower_cased, value) catch unreachable;
    }
    var iterator = map.valueIterator();
    while (iterator.next()) |v| {
        actual_sum += v.*;
    }
    if (actual_sum != expected_sum) {
        return false;
    }
    return true;
}

pub fn main() void {
    const result = isPangram("abcdefGHIJklmnopQRSTUvwxyz12312312");
    std.debug.print("{}", .{result});
}
