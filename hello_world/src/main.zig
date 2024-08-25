const std = @import("std");

pub fn main() void {
    const constant: i32 = 2;
    var variable: u32 = 3;
    const infered_constant = @as(i32, 4);
    var infered_variable = @as(u32, 4);
    const array = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
    const array_b = [_]u8{'w','o','r','l','d'};
    const length = array.len;
}
