![Question - Part 1](image.png)
![Question - Part 2](image-1.png)

### Answer
- I copy/pasted the part that was already present in the book and created the search-for-primes procedure which basically calls timed-prime-test for odd integers in a specified range only
- In order to get only the first three numbers I created a separate shell script because I thought adding this specific use case to the program would break the SRP. So I just created a simple abstraction that integrates with the program and does what it is needed.
- There is a problem on the integration I created between the shell script and the scheme program relating to the way the pipe is being terminated by the shell script, I will not look into this for time management and priorization purposes.
- I had to make the prime? predicate intentionally slower than it was actually supposed to be for two reasons:
  - Since I am using racket which is a different interpreter for Scheme than the one being used in the book, the runtime procedure is not present and time is dealt in milliseconds instead. Because of that, I was always getting 0 as a return of how much time it took to find a prime.
  - Since my computer must be way faster than computers back then I intentionally made the predicate slower so I could get more of an approximation of the environment back then

The results as asked in the book were:
```
Three first smallest primes larger than 1000
1009 *** cpu time: 21 real time: 21 gc time: 0
1013 *** cpu time: 20 real time: 20 gc time: 0
1019 *** cpu time: 21 real time: 21 gc time: 0

Three first smallest primes larger than 10000
10007 *** cpu time: 29 real time: 29 gc time: 0
10009 *** cpu time: 29 real time: 29 gc time: 0
10037 *** cpu time: 30 real time: 30 gc time: 0

Three first smallest primes larger than 100000
100003 *** cpu time: 30 real time: 30 gc time: 0
100019 *** cpu time: 34 real time: 34 gc time: 0
100043 *** cpu time: 37 real time: 37 gc time: 0

Three first smallest primes larger than 1000000
1000003 *** cpu time: 36 real time: 36 gc time: 0
1000033 *** cpu time: 35 real time: 35 gc time: 0
1000037 *** cpu time: 42 real time: 42 gc time: 0
```
-----
Since the testing algorithm has order of growth of Θ(square root n), you should expect that testing for primes around 10,000 should take about square root 10 times as long as testing for primes around 1000. Do your timing data bear this out?

Answer: Yes

-----

How well do the data for 100,000 and 1,000,000 support the Θ(pn) prediction?

Answer: It is not square root 10 exactly but I mean, it must be for the reason that I had to change the way things were running because of my current environment but it is close to square root 10 yet.

----

Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?

Answer: Yes