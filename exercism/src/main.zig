const std = @import("std");
const testing = std.testing;

pub fn isLeapYear(year: u32) bool {
    if (year % 4 == 0) {
        if (year % 100 == 0) {
            if (year % 400 != 0) {
                return false;
            }
        }
        return true;
    }
    return false;
}

pub fn main() !void {}

test "testing leap_year" {}
