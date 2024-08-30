const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    const allocator = std.heap.page_allocator;
    var map = std.AutoHashMap(u8, u1).init(allocator);
    for (str) |char| {
        const c = std.ascii.toLower(char);
        const val = map.get(c) orelse 0;
        if (val == 0) {
            map.put(c, 1) catch unreachable;
        } else {
            if (c == ' ' or c == '-') {
                continue;
            }
            return false;
        }
    }
    return true;
}

pub fn main() void {
    const result = isIsogram("Emily Jung Schwartzkopf");
    std.debug.print("{}", .{result});
}
