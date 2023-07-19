# meta characters (need special treatment when searching):
# $ ^ * + ? . ( ) [ ] { } | \ /

#meta character inside a character class([]):
# ^ \ - [ ]


# to escape a meta character, use a single backslash: /\./ (searches .)

# to search a space, enter: /[ ]/

#searching multiple patterns: /(dog|cat|rabbit)/

# make case-insensitive: /launch/i (the i after the / searches both cases)

#alternations of words: /(blue|black)berry/ (searches both blueberry and blackberry)

#check for lowercase and capitalized versions of the same word: /[Hh]oover/

# note on matching with negated classses:
# text = 'xyx'
# puts 'matched' if text.match(/[^x]/) => output; returns a truthy value because the 'y' is matched

#shortcuts: 
# \s => all spaces
# \S => anything not a space
# \d => all digits
# \D => anything not a digit
# \h => all hexideciaml digits (09-A-Za-z)
# \H => anything not a hex digit
# \w => all word characters (words include digits, letters, and underscores)
# \W => anything not a word character

#achors: 

# line start and end: 
# note: ruby will ignore newline characters and treat the chars following a new line as a new line when matching
# technically a \n sits at the end of the first line, but is ignored by $
# ^ => start of line
# $ => end of line
# ^word$ => full line

#string start and end: 
# \A => matches to start of string
# \Z => matches to end of line, not including newline
# \z => matches to end of line, including newline