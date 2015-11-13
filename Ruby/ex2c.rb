'''
Write a simple grep that will print the lines of a file having any occurrences
of a phrase anywhere in that line. You will need to do a simple regular
expression match and read lines from a file. (This is surprisingly simple in
Ruby.) If you want, include line numbers.
'''
# apparently leaky. consider open() {|f|}
open("./rubycsv.txt").each_with_index {|line, i| p [i, line] if line =~ /a/ }
