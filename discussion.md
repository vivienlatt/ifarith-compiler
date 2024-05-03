# Discussion and Reflection


The bulk of this project consists of a collection of five
questions. You are to answer these questions after spending some
amount of time looking over the code together to gather answers for
your questions. Try to seriously dig into the project together--it is
of course understood that you may not grasp every detail, but put
forth serious effort to spend several hours reading and discussing the
code, along with anything you have taken from it.

Questions will largely be graded on completion and maturity, but the
instructors do reserve the right to take off for technical
inaccuracies (i.e., if you say something factually wrong).

Each of these (six, five main followed by last) questions should take
roughly at least a paragraph or two. Try to aim for between 1-500
words per question. You may divide up the work, but each of you should
collectively read and agree to each other's answers.

[ Question 1 ] 

For this task, you will three new .irv programs. These are
`ir-virtual?` programs in a pseudo-assembly format. Try to compile the
program. Here, you should briefly explain the purpose of ir-virtual,
especially how it is different than x86: what are the pros and cons of
using ir-virtual as a representation? You can get the compiler to to
compile ir-virtual files like so: 

racket compiler.rkt -v test-programs/sum1.irv 

(Also pass in -m for Mac)

- The purpose of ir-virtual is to display the chain of commands that the function is executing
before the result is printed.
- It is different from x86 because it's easier to read from the programmer's perspective since
it shows the function that is being used, the variable, and what the variable is assigned to,
whereas x86 is machine code that involves reigisters and commands that are read by the hardware.
- Pros: More understandable by programmer, easy to follow along, explicitly states the functions
and variables, it's more consise compared to assembly code.
- Cons: Assembly gives further detail to track through the programming process, so the ir-virtual
representation could be harder to track/debug compared to the assembly code.

[ Question 2 ] 

For this task, you will write three new .ifa programs. Your programs
must be correct, in the sense that they are valid. There are a set of
starter programs in the test-programs directory now. Your job is to
create three new `.ifa` programs and compile and run each of them. It
is very much possible that the compiler will be broken: part of your
exercise is identifying if you can find any possible bugs in the
compiler.

For each of your exercises, write here what the input and output was
from the compiler. Read through each of the phases, by passing in the
`-v` flag to the compiler. For at least one of the programs, explain
carefully the relevance of each of the intermediate representations.

For this question, please add your `.ifa` programs either (a) here or
(b) to the repo and write where they are in this file.
arifth2.ifa : (print (* (* 3249 (- 1 9234)) 100))
if2.ifa : (if (not bop?)
              (print #f)
              (print #t))
cond2.ifa: (cond [0 (print 1)]
                 [(? lit? l) (print 100)]
                 [(+ 5 ((* 10 (+ (- 8 3) -2)))) (print (+ 206 832))]
                 [else (print #f)])

[ Question 3 ] 

Describe each of the passes of the compiler in a slight degree of
detail, using specific examples to discuss what each pass does. The
compiler is designed in series of layers, with each higher-level IR
desugaring to a lower-level IR until ultimately arriving at x86-64
assembler. Do you think there are any redundant passes? Do you think
there could be more?

In answering this question, you must use specific examples that you
got from running the compiler and generating an output.

- In general, each pass of the compiler updates the stack pointer, does variations of assembly commands, and
leads up to what the final output of the call should be. So, depending on the function called, there could or could not
be redundant passes.
- For example, comparing the arith0 to the zero and bool0 calls, the arith0 seems to have a lot of redundant
move calls that look like they could be redundant since it's a lot of storage allocation and moving the stack and base
pointers up and down the stack. From looking at the zero and bool0 calls, it looks like they have a more concise assembly
command sequence, since there's a couple sub and mov instructions as well as the instructions that execute the purpose of the functions.

[ Question 4 ] 

This is a larger project, compared to our previous projects. This
project uses a large combination of idioms: tail recursion, folds,
etc.. Discuss a few programming idioms that you can identify in the
project that we discussed in class this semester. There is no specific
definition of what an idiom is: think carefully about whether you see
any pattern in this code that resonates with you from earlier in the
semester.

- Pattern matching is identified because of all the different types from the input language that the function,
ifarith->ifarith-tiny, pattern matches and translates.
- Recursion is idenfified because for some of the multi-argument pattern matches resursively calls back
ifarith->ifarith-tiny to evaluate the "e-body"
- Definitions are identified because Racket/Scheme-defined functions, such as integer? and symbol? as well as
the built-in functions that define bop?, uop?, and lit? are used throughout the ifarith->ifarith-tiny function.

[ Question 5 ] 

In this question, you will play the role of bug finder. I would like
you to be creative, adversarial, and exploratory. Spend an hour or two
looking throughout the code and try to break it. Try to see if you can
identify a buggy program: a program that should work, but does
not. This could either be that the compiler crashes, or it could be
that it produces code which will not assemble. Last, even if the code
assembles and links, its behavior could be incorrect.

To answer this question, I want you to summarize your discussion,
experiences, and findings by adversarily breaking the compiler. If
there is something you think should work (but does not), feel free to
ask me.

Your team will receive a small bonus for being the first team to
report a unique bug (unique determined by me).

- There is a bug in the prim-plus.ifa test case because the variables in the let* are not defined
correctly, since they are written like [x = 5], [y = (* x0 2)], and [z = (+ x y)], whereas they should
be written like [x 5], [y (* x0 2)], and [z (+ x y)] without the equal signs.
- There is another bug in the const.ifa test case that is like the one in prim-plus.ifa since the
variables in the let* are not written correctly. They are written like [x0 = 5] and [x1 = 4], when
they should be written like [x0 5] and [x1 4].
- Our group discussion and experience with these findings involved examining the test case codes and
discussing anything that seemed off about them and also running each test case in the compiler and checking
if they either output the correct result or gave us an error.

[ High Level Reflection ] 

In roughly 100-500 words, write a summary of your findings in working
on this project: what did you learn, what did you find interesting,
what did you find challenging? As you progress in your career, it will
be increasingly important to have technical conversations about the
nuts and bolts of code, try to use this experience as a way to think
about how you would approach doing group code critique. What would you
do differently next time, what did you learn?

- While debugging this code, we learned how to further examine test cases in intricate detail,
understanding the compiler in depth, while creating a learning experience for everyone in the
group. Dissecting the assembly was useful as we were able to comprehend what each function did
step by step using unique registers and walking through the x86-64 compiler. What we found
interesting was using our OS (mac) terminal to compile and run everything, which was also the
case throughout the whole semester with this course, including the use of git. So, running the
compiler through the terminal instead of the builtin Racket terminal was really interesting and
fun for us. What we found most challenging was starting the project with first seeing,
deciphering, and understanding the large amount of code we were given.  At first, it was a bit
complicated to find bugs as we were unsure on where to start looking in order to “break the
compiler.” However, our first order of business was to check the tests rather than the compiler
itself to which we found the bug within prim-plus.ifa and then   It was interesting as the bugs
each person found each bug, indicating each programmer discovered a bug, it was intriguing to
observe the distinctiveness in their approach and perspective towards the code, highlighting
the individuality inherent in each of us. Overall, working with a group while building up the
project was quite enjoyable and is not an aspect highlighted enough within the technology work,
despite communication being one of the most useful skills to have.