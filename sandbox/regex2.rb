string = <<REGEX.chomp
These are some phone numbers 917-555-1234. Also, you can call me at 646.555.1234 and of course I'm always reachable at (212)867-5309
REGEX

string2 = <<REGEX.chomp
The colors of the rainbow have many colours and the rainbow does not have a single colour.
REGEX

string3 = <<REGEX.chomp
This is something
is about
a blah
sequence of words
Hello and
Goodbye and
Go go go rainbow!
REGEX
# literals
# Rainbow
# 'R', 'a', 'i', 'n', 'b', 'o', 'w'


# metacharacter

#  917-555-1234
#  646.555.1234
# (212)867-5309

# meta-characters

# \d => any number from 0 to 9
# .  => any character whatsoever

# \w => A-Za-z0-9
# \s => whitespace space tab

# quantifiers
# *  => zero or more  of
# +  => 1 or more
# ?  => 0 or 1
# {min, max}
# {n}

# position
# ^  => beginning of a line
# $  => end of a line
# \b => word boundary