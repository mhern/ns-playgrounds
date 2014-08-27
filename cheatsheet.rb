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

=begin
=
= 	CASTING
=
=end

#I noticed casting being put into place like so
integer_input = Integer(gets.chomp)
puts "integer_input: #{integer_input}"
