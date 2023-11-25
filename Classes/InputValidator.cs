using System;
using System.Text.RegularExpressions;

public static class InputValidator
{
    public static bool ContainsOnlyLetters(string input)
    {
        return Regex.IsMatch(input, @"^[A-Za-z]+$");
    }

    public static bool ContainsOnlyDigits(string input)
    {
        return Regex.IsMatch(input, @"^[0-9]+$");
    }
}