'''
Print the contents of an array of sixteen numbers, four numbers at a time,
using just each. Now, do the same with each_slice in Enumerable.
'''
(1..16).each {|n| print n.to_s+" "; print "\n" if n%4==0}
(1..16).each_slice(4) {|a| p a}
