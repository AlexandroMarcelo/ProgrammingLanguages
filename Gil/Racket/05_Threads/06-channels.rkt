#|
Use channels to distribute work among threads

Gilberto Echeverria
21/11/2019
|#

#lang racket

; Create a channel for the work list
(define channel-work (make-channel))
; Create a channel for the output
(define channel-out (make-channel))

; Find the smallest integer divisible by all numbers from 1 t n
(define (divisible-up-to n)
    (let loop
        (   [n n]
            ; First candidate is n * (n - 1)
            ; This gives the result immediately for n < 5
            [test (* n (- n 1))])
        (if (divisible? n test)
            test
            ; Recrusive call, increment the candidate by n,
            ;  since it must be a multiple of it
            (loop n (+ test n)))))


; Check that a test number is divisible by each integer from n to 1
(define (divisible? n test)
    (if (= n 1)
        #t
        (and (= 0 (remainder test n)) (divisible? (- n 1) test))))

; Create the thread to post the output
(thread (lambda ()
         (let loop
            ()
            (displayln (channel-get channel-out))
            (loop))))

; Function to generate threads for processing
(define (make-worker name)
    (thread (lambda ()
         (let loop
            ()
            (define message (channel-get channel-work))
            (case message
                [(end)
                    (channel-put channel-out (format "Thread ~a finishing" name))]
                [else
                    (define result (divisible-up-to message))
                    (channel-put channel-out (format "Thread ~a: n = ~a | result = ~a" name message result))
                    (loop)])))))

; Function to create a list of 'elements' random numbers,
; in the range from 1 to 'limit'
(define (generate-random-list elements limit)
    (let loop
        (   [data empty]
            [n 0])
        (if (= n elements)
            data
            ; Append to the list the new random number
            (loop (cons (random 1 (+ limit 1)) data) (+ n 1)))))

; Startin function for testing
(define (main)
    (define threads (map make-worker '(One Two)))
    (let*
        ( [elements 20]
          [limit 25]
          [numbers (generate-random-list elements limit)]
          [data (append numbers '(end end))])
        ; Show the list
        (displayln data)
        ; Send each number to be processed
        (for-each (lambda (message) (channel-put channel-work message)) data)
        ; Wait for the threads to finish
        (for-each thread-wait threads)))
