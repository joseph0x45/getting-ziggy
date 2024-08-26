const std = @import("std");

pub fn squareOfSum(number: usize) usize {
    return std.math.pow(usize, number * (1 + number) / 2, 2);
}

pub fn sumOfSquares(number: usize) usize {
    var sum: usize = 0;
    var i: u32 = 0;
    while (i <= number) : (i += 1) {
        std.debug.print("Square of {} {}\n", .{ i, std.math.pow(usize, i, 2) });
        sum += std.math.pow(usize, i, 2);
    }
    return sum;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}

pub fn main() void {
    const result = differenceOfSquares(10);
    std.debug.print("{}", .{result});
}
