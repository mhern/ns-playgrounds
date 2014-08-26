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

#string methods we went over
str = 'Hello World'		#use ' when nothing needs to be evaluated (take string literally)
puts "#{str.reverse}" 	#use " when something needs to be evaluated
puts "#{str.capitalize}"
str_all_caps = "#{str.upcase}"
str_all_lowercase = str_all_caps.downcase
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
no_new_line.reverse!


=begin
=
= 	CASTING
=
=end

#I noticed casting being put into place like so
integer_input = Integer(gets.chomp)
puts "integer_input: #{integer_input}"
