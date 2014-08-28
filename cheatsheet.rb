=begin
	This is a "cheatsheet" to help guide me through learning Ruby, mainly so I don't forget any core concepts.
	I expect this to be used mainly as a reference.
=end


=begin
=
= 	COMMENTS
=
=end

#single line comment
=begin
	begin and end statements need their own line in multi-line comments
=end

#NOTE that whitespace is ignored by Ruby


=begin
=
= 	OPERATORS
=
=end

#mathematical
one = 1 + 0 	#addition
one = 1 - 0 	#subtraction
one = 1 * 1 	#multiplication
one = 1 / 1		#divison
one = 1 ** 1	#exponentiation
one = 1 % 2		#modulo

#NOTE ++ and -- are not supported
#but +=, -=, *=, and /= are
one += 1
one -= 1
one *= 1
one /= 1

#comparision
#if, elsif, else, unless, end
if 1 < 2
	puts "one is less than 2"
elsif 1 > 2
	puts "one is greater than 2"
else
	puts "one must be equal to 2" unless 1 != 2
end

# use unless as first condition
hungry = false;
unless hungry
	puts "I'm not hungry"
else
	puts "I'm hungry"
end

# use "not" in boolean comparison
if not true
	puts "not true"
else
	puts "true"
end

#combined comparison <=>
#returns:
# 	0 if items are equal
# 	1 if first item is greater
# 	-1 if second item is greater
one = 2 <=> 1

#case when statement
variable = "something"
case variable
when "something"
	puts "I got one!"
when "something else"
	puts "Different one!"
else 					#default
	puts "nope"
end


=begin
=
= 	INPUT and OUTPUT
=
=end

# input
# "gets" will retrieve input from the user, but will add a newline
with_new_line = gets
# use "gets.chomp" to retrieve input without the newline
no_new_line = gets.chomp

# output
puts 'puts adds a newline after the line printed'
print 'print does not'

#concatination is with a plus
puts 'hello' + ' ' + 'world'

#string methods we went over
str = 'Hello World'		#use ' when nothing needs to be evaluated (take string literally)
puts "#{str.reverse}" 	#use " when something needs to be evaluated
puts "#{str.capitalize}"
str_all_caps = "#{str.upcase}"
str_all_lowercase = str_all_caps.downcase
str_all_caps.gsub!(/ABC/, " ") 				#gsub = global substitution
array_of_strings = str.split(" ")			#split supported
str = str_all_lowercase.reverse.upcase 		#methods can be chained
print_number = 5.to_s						#to string, converts number to a string containing that number
this_is_an_int = print_number.to_i			#to integer, converts string to an Integer

print "something", " ", "else", " ", "here" #use "," in print to output several things in order

=begin
=
= 	METHODS
=
=end

#everything in Ruby is an object, so they all have accessible methods
this_is_true = 4.methods.+(4) == 8
puts "value of this_is_true: #{this_is_true.to_s}"

# ! modifies in place
with_new_line.capitalize!
#and goes before the arguments to the method (no space between!)
no_new_line.gsub!(/s/, "th")

#methods ending in ? evaluate to a boolean value as a general rule
a_boolean = no_new_line.include? " "
a_boolean = true

#sort_by (use on arrays or hashes)
array_of_strings = array_of_strings.sort_by do |word|
	word
end
#sort_by on an array returns an array, on a hash returns an array of arrays

#alternatively we could use .sort
array_of_strings.sort!

#is_a?
this_is_false = print_number.is_a? Integer
this_is_true = this_is_an_int.is_a? Integer
#NOTE there is no boolean class in Ruby, must check
this_is_true = this_is_false.is_a? FalseClass

##WRITING YOUR OWN METHODS
#NOTE if nothing is explicitly returned from a method, the value of the last line will be returned
def my_method(_arg)
	puts _arg
end
#if there are no args, just write "def my_method"
#also just call by typing "my_method" if there are no args

#splat args tell Ruby we are not sure how many args to expect
def my_splat_method(arg1, *args)
	args.each do |arg| puts "#{arg1}, #{arg}" end
end

#default args define what the arg will be if it is not passed
def my_defaulted_method(arg1, arg2=true)
	puts "a different value was passed for arg2" if arg2 != true
end


=begin
=
= 	LOOPS
=
=end

#while loop
while false
	puts "this should never run"
end

#until loop
until true
	puts "this should never run"
end

#for in loop
#... is exclusive, this prints 1 - 9
for num in 1...10
	puts num
end
#.. is inclusive, this prints 1 - 10
for num in 1..10
	puts num
end

#loop break loop
i = 0
loop {
	i+= 1
	break if i > 5
}
#equivalent to
i = 0
loop do
	i += 1
	break if i > 5
end

#each loop (on an array)
my_array = [1,2,3,4,5]
my_array.each do |x|
	puts "#{x}"
end
#each loop (on a hash)
my_hash = {
	"one" => 1,
	"two" => 2,
	"three" => 3
}
my_hash.each do |x, y|
	puts "#{x}: #{y}"
end

#times loop (on a number)
5.times { print "iteration" }

#loop keywords
#next - skip steps in a loop
for num in 1..5
	next unless i % 2 == 0
	print num
end


=begin
=
= 	BLOCKS
=
=end

#for a code block: { <something here> } is eqivalent to do <something here> end
# so ({ ~= do) and (} ~= end)

#blocks are like anonymous functions in JS, they just dont have a name
['joe', 'jane'].each do |name|
	puts "#{name[0].upcase}#{name[1..-1].downcase}"
end
#NOTE what is actually going on here is we are passing a block as a parameter
#to the method "each" without using parentheses

=begin
=
= 	ARRAYS and HASHES
=
=end

#arrays are pretty much like JS arrays as far as I can tell
my_array = [['ele', 'ment'], ['and', 'another']]

#hashes are like JS objects somewhat
#literal notation
my_hash = {
	'key' => 'value', 	#any Ruby object can be used as a key or value
	'key2' => 'value2'
}
#creating a new hash with a constructor, equivalent to setting it equal to {}
my_hash = Hash.new
#giving an empty hash a default value determines the value that will be returned if a key being asked for does not exist
my_hash = Hash.new(-1)
#my_hash["key"] => -1
my_hash["key"] = "value"
#my_hash["key"] => "value", my_hash["somethingelse"] => -1
#NOTE that by default the default value is nil
# 	nil is the only other non-true value in Ruby apart from false

##SYMBOLS

#there can only be one copy of a symbol at a given time
# 	NOTE that <object>.object_id gives the unique id of an object in Ruby
#symbols are immutable (cannot be changed once created)

#syntax: first character of a symbol can only be a letter or underscore

#using symbols as keys in a hash
my_hash = {
	:sym1 => "first",
	:sym2 => "second"
}

#converting a symbol to a string can be done with :<symbol>.to_s
#converting a string to a symbol can be done with "<string>".to_sym, or "<string>".intern (i.e. internalize)

#starting in Ruby 1.9
my_hash = {
	sym1: "first", # => syntax is gone
	sym2: "second"	# : comes at the end of the symbol in the hash, but if printed out, it would still look like ":sym2"
}

##SEARCHING through HASHES
#.select on a hash
my_hash.select do |key, value|
	value == "first"
end
# returns a hash with the new values and does not modify the existing hash

#just looking at keys, use each_key
my_hash.each_key do |key|
	print key, " "
end

#just looking at values, use each_value
my_hash.each_value do |value|
	print value
end

#DELETING
#from hashes
my_hash.delete sym1:
#from arrays
[1,2,3].delete(3) # => [1,2]


=begin
=
= 	CASTING
=
=end

#I noticed casting being put into place like so
integer_input = Integer(gets.chomp)
puts "integer_input: #{integer_input}"
