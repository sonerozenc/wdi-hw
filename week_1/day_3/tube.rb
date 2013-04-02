# # MTA Lab (Homework)

# **Objective:**

# * Apply arrays, hashes and blocks.

# **Activity:**

# * Working in pairs, students should create a program that models a simple subway system.
# * Demonstrate the working code for students so they have an idea of how it works.

# * The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the total number of stops for the trip.
# * There are 3 subway lines:
# ** The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
# ** The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
# ** The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
# * All 3 subway lines intersect at Union Square, but there are no other intersection points. (For example, this means the 28th stop on the N line is different than the 28th stop on the 6 line.)


# Hints:
# * Get the program to work for a single line before trying to tackle multiple lines.
# * Diagram how the program works by drawing out the subway lines and their stops and intersection.
# * The subway lines are keys in a hash, while the values are an array of all the stops on each line.
# * The key to the lab is the intersection of the lines at Union Square. Google “ruby array intersect.”
# * Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated).


# ask your questions
p "What line do you get on?"
line_on = gets.chomp

p "What stop do you get on?"
stop_on = gets.chomp

p "What line do you get off?"
line_off = gets.chomp

p "What stop do you get off?"
stop_off = gets.chomp

subway = {
	"N" => ["TS", "34th", "28th", "23rd", "US", "8th"], 
	"L" => ["8th", "6th", "US", "3rd", "1st"], 
	"Six" => ["GC", "33rd", "28th", "23rd", "US", "AP"]
}

# h ["a"].index("d") == nil
# => true

if subway [line_on].index(stop_on) == nil


# find number of stops in journey number 1
intersection_stop_1 = subway [line_on].index("US")
first_stop = subway [line_on].index(stop_on)
first_journey = (first_stop - intersection_stop_1).abs
# find number of stops in journey number 2
intersection_stop_2 = subway [line_off].index("US")
last_stop = subway [line_off].index(stop_off)
second_journey = (last_stop - intersection_stop_2).abs
# find number of total stops
total_journey = first_journey + second_journey


p intersection_stop_1
p first_stop
p first_journey

p intersection_stop_2
p last_stop
p second_journey

p "Total number of trips is #{ total_journey }"

