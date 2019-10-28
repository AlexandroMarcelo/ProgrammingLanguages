#|
Alexandro Francisco Marcelo Gonzalez A01021383

05-Prime_numbers
Program that defines the following functions:
    prime? Receives as argument a number, and returns true or false, indicating whether the argument is a prime number
    primes-less-than Receives a number, and returns a list containing all the prime numbers smaller than the input. The first prime listed must be 2
    nth-prime Receives a number, and returns the prime number at that position of the sequence of primes. The first prime is number 2, and the second prime is number 3
|#

;function to know if the given number is prime
(define (prime? number)
    (let loop ( ;declaring the loop function with its parameters
            [count (- number 1)] ;for analize if the given number is divisible for others below itself
            [number number] ;just declarig inside the loop function the given number
        );close the loop variables
        ;recursion function
        (if (= count 1) ;base case
            #t ;there is no more numbers to calculate the module, therefore the given number is only divisible by itself and 1
            (if (= (modulo number count) 0) ;the recursive case, if the given number is divisible by another number less than itself the given number is not prime, otherwise the recursive function is called 
                #f ;is not a prime number
                (loop (- count 1) number) ;substracting 1 to analize if the numbers below the given number is or not divisible
            )
        )
    )
)

;to get the all primes bellow the given number
(define (prime-less-than number)
    (let loop( ;declaring the loop function with its parameters
            [number number] ;just declarig inside the loop function the given number
            [count 2] ;for analize if the given number is divisible for others above itself
            [primes '()] ;for the result as a list
        )
        (if (= count number) ;base case
            (display primes) ;there is no more numbers to calculate
            (if (prime? count) ;the recursive case, if the given number is divisible by another number above below itself, the given number is not prime, otherwise the recursive function is called 
                (loop number (+ count 1) (append primes (list count))) ;adding 1 to analize if the numbers below the given number is or not divisible, and appending the (prime) to the final list
                (loop number (+ count 1) primes) ;just addin 1 and colling the recursive function
            )
        )
    )
)

;to get the prime number at that given position of the sequence of primes
(define (nth-prime limit)
    (if (= limit 1) ;if the given number is 1 the prime in that position is 2
        (display 2)
        (letrec ;otherwise the recursive function
            ([loop (lambda (limit primeInThatPosition numberOfPrimes) ;declaring the loop function
                    (if (<= limit numberOfPrimes) ;if there are no more primes to search for 
                        (display (- primeInThatPosition 2)) ;print that prime in that position
                        (if (prime? primeInThatPosition) ;chech if there is a prime number in that position
                            (loop limit (+ primeInThatPosition 2) (+ numberOfPrimes 1)) ;recursive case adding the number of primes found and the next evaluation
                            (loop limit (+ primeInThatPosition 2) numberOfPrimes) ;recursive case for just evaluate the next case (next number)
                        )
                    )
                )
            ])
            (loop limit 3 1) ;calling the loop function
        )
    )
)

