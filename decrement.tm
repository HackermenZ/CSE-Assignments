# this is a comment

# the following 3 lines are commands
#! start q0
#! end q10
#! fill B

# Now we specify some rules
q0 0 0 R q1 # reads the first character
q0 1 1 R q1
q0 c c N q10 # handles corner case of empty string
q0 B B N q10 # handles corner case of wrong head position
q1 0 0 R q1 # moves forward until it finds a c
q1 1 1 R q1
q1 c c R q2
q2 B 0 L q3 # replaces the first blank after c with a 0 and moves back to the beginning
q3 0 0 L q3
q3 1 1 L q3
q3 c c L q3
q3 B B R q4 # reached the beginning, now we move forward again
q3 X X R q4 # reached the last character already written on the right of c
q4 0 X R q5 # remembers the leftmost character not yet read (in case of 0), replaces it with an X and moves forward
q4 1 X R q6 # remembers the leftmost character not yet read (in case of 1), replaces it with an X and moves forward
q4 c c R q7 # all the characters have been written to the right of c
q5 0 0 R q5
q5 1 1 R q5
q5 c c R q5
q5 B 0 L q3 # replaces the first blank found with a 0
q6 0 0 R q6
q6 1 1 R q6
q6 c c R q6
q6 B 1 L q3 # replaces the first blank found with a 1
q7 0 0 R q7
q7 1 1 R q7
q7 B B L q8 # now we'll start decrementing
q8 1 0 L q9 # decrementation done, no borrow needed
q8 0 1 L q8 # decrementing, borrow is required
q9 0 0 L q9
q9 1 1 L q9 # there is no borrow left
q9 c c N q10 # we're done