=begin

Facebook Hacker Cup 2013 Qualification Round

Beautiful strings
20 points

When John was a little kid he didn't have much to do. There was no internet, no Facebook, and no programs to hack on. So he did the only thing he could... he evaluated the beauty of strings in a quest to discover the most beautiful string in the world.

Given a string s, little Johnny defined the beauty of the string as the sum of the beauty of the letters in it.

The beauty of each letter is an integer between 1 and 26, inclusive, and no two letters have the same beauty. Johnny doesn't care about whether letters are uppercase or lowercase, so that doesn't affect the beauty of a letter. (Uppercase 'F' is exactly as beautiful as lowercase 'f', for example.)

You're a student writing a report on the youth of this famous hacker. You found the string that Johnny considered most beautiful. What is the maximum possible beauty of this string?

Input
The input file consists of a single integer m followed by m lines.

Output
Your output should consist of, for each test case, a line containing the string "Case #x: y" where x is the case number (with 1 being the first case in the input file, 2 being the second, etc.) and y is the maximum beauty for that test case.

Constraints
5 ≤ m ≤ 50
2 ≤ length of s ≤ 500

Example input

5
ABbCcc
Good luck in the Facebook Hacker Cup this year!
Ignore punctuation, please :)
Sometimes test cases are hard to make up.
So I just go consult Professor Dalves

Example output

Case #1: 152
Case #2: 754
Case #3: 491
Case #4: 729
Case #5: 646

=end


def count s
  counter = {}
  s.downcase.each_char do |c|
    if c >= 'a' && c <= 'z'
      counter[c] ||= 0
      counter[c] += 1
    end
  end

  sort = counter.values.sort

  total = 0
  (26-sort.size+1..26).each_with_index do |n, i|
    total += n * sort[i]
  end

  total
end

file = File.new(ARGV[0], "r")
number_of_tests = file.gets.to_i

(1..number_of_tests).each do |i|
  puts "Case ##{i}: #{count(file.gets.chomp)}"
end

file.close
