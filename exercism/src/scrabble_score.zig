const std = @import("std");

pub fn lowercase(char: u8) u8 {
    var c = char;
    if (char >= 65 and char <= 90) {
        c += 32;
    }
    return c;
}

pub fn score(s: []const u8) u32 {
    const allocator = std.heap.page_allocator;
    var map = std.AutoHashMap(u8, u32).init(allocator);
    map.put('a', 1) catch unreachable;
    map.put('e', 1) catch unreachable;
    map.put('i', 1) catch unreachable;
    map.put('o', 1) catch unreachable;
    map.put('u', 1) catch unreachable;
    map.put('l', 1) catch unreachable;
    map.put('n', 1) catch unreachable;
    map.put('r', 1) catch unreachable;
    map.put('s', 1) catch unreachable;
    map.put('t', 1) catch unreachable;
    map.put('d', 2) catch unreachable;
    map.put('g', 2) catch unreachable;
    map.put('b', 3) catch unreachable;
    map.put('c', 3) catch unreachable;
    map.put('m', 3) catch unreachable;
    map.put('p', 3) catch unreachable;
    map.put('f', 4) catch unreachable;
    map.put('h', 4) catch unreachable;
    map.put('v', 4) catch unreachable;
    map.put('w', 4) catch unreachable;
    map.put('y', 4) catch unreachable;
    map.put('k', 5) catch unreachable;
    map.put('j', 8) catch unreachable;
    map.put('x', 8) catch unreachable;
    map.put('q', 10) catch unreachable;
    map.put('z', 10) catch unreachable;
    var scramble_score: u32 = 0;
    for (s) |char| {
        scramble_score += map.get(lowercase(char)) orelse 0;
    }
    return scramble_score;
}

pub fn main() void {
    const result = score("AEIOUL");
    std.debug.print("{d}", .{result});
}
