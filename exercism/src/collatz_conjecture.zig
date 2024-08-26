const std = @import("std");

// Please implement the `ComputationError.IllegalArgument` error.
pub const ComputationError = error{IllegalArgument};

pub fn steps(number: usize) anyerror!usize {
    var n = number;
    if (n <= 0) {
        return ComputationError.IllegalArgument;
    }
    var steps_taken: usize = 0;
    while (n != 1) : (steps_taken += 1) {
        if (n % 2 == 0) {
            n = n / 2;
        } else {
            n = 3 * n + 1;
        }
    }
    return steps_taken;
}

pub fn main() void {
    const steps_taken = steps(12);
    if (steps_taken) |value| {
        std.debug.print("Result: {}\n", .{value});
    } else |err| {
        std.debug.print("Error: {}\n", .{err});
    }
}
