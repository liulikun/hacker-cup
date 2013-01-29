=begin

Facebook Hacker Cup 2013 Qualification Round

Balanced Smileys
35 points

Your friend John uses a lot of emoticons when you talk to him on Messenger. In addition to being a person who likes to express himself through emoticons, he hates unbalanced parenthesis so much that it makes him go :(

Sometimes he puts emoticons within parentheses, and you find it hard to tell if a parenthesis really is a parenthesis or part of an emoticon.

A message has balanced parentheses if it consists of one of the following:

    - An empty string ""
    - One or more of the following characters: 'a' to 'z', ' ' (a space) or ':' (a colon)
    - An open parenthesis '(', followed by a message with balanced parentheses, followed by a close parenthesis ')'.
    - A message with balanced parentheses followed by another message with balanced parentheses.
    - A smiley face ":)" or a frowny face ":("

Write a program that determines if there is a way to interpret his message while leaving the parentheses balanced.
Input

The first line of the input contains a number T (1 ≤ T ≤ 50), the number of test cases.
The following T lines each contain a message of length s that you got from John.
Output

For each of the test cases numbered in order from 1 to T, output "Case #i: " followed by a string stating whether or not it is possible that the message had balanced parentheses. If it is, the string should be "YES", else it should be "NO" (all quotes for clarity only)
Constraints

    1 ≤ length of s ≤ 100


Example input

5
:((
i am sick today (:()
(:)
hacker cup: started :):)
)(

Example output

Case #1: NO
Case #2: YES
Case #3: YES
Case #4: YES
Case #5: NO

=end

def balanced_smileys? s
  lp   = rp = lpf = rpf = 0
  prev = nil
  s.each_char do |c|
    if c == '('
      lp = lp + 1
      lpf = lpf + 1 if prev == ':'
    elsif c == ')'
      rp = rp + 1
      rpf = rpf + 1 if prev == ':'
    end

    if rp > lp
      return false if rp > lp + rpf
    end
    prev = c
  end

  lp <= rp + lpf
end


file = File.new(ARGV[0], "r")
number_of_tests = file.gets.to_i

(1..number_of_tests).each do |i|
  puts "Case ##{i}: #{balanced_smileys?(file.gets.chomp) ? 'YES' : 'NO'}"
end

file.close

