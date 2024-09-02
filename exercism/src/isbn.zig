const std = @import("std");

pub fn isValidIsbn10(s: []const u8) bool {
    if (s.len != 10 and s.len != 13) {
        return false;
    }
    if (std.ascii.isAlphabetic(s[9]) and s[9] != 'X') {
        return false;
    }
    var check_digit: u8 = 0;
    if (s[s.len - 1] == 'X') {
        check_digit = 10;
    } else {
        check_digit = std.fmt.charToDigit(s[s.len - 1], 10) catch return false;
    }
    var value: usize = 0;
    var multiplier: u8 = 10;
    for (s[0 .. s.len - 1]) |char| {
        if (char == '-') continue;
        const char_as_int: u8 = std.fmt.charToDigit(char, 10) catch return false;
        value += char_as_int * multiplier;
        multiplier -= 1;
    }
    value += check_digit;
    return value % 11 == 0;
}

pub fn main() !void {
    const result = isValidIsbn10("3-598-21508-8");
    std.debug.print("{}", .{result});
}
