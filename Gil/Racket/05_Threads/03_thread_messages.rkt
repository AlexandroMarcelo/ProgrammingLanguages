#|
    Sending messages to the thread

    Gilberto Echeverria
    07/11/2019
|#

#lang racket

(define (counter-fun)
   ; Loop inside the thread function
    (let loop
        ([n 0])
        (if (equal? (thread-receive) 'hello)
            (begin
                (printf "Iteration ~a in thread\n" n)
                (sleep 0.2)
                (loop (+ n 1)))
            (printf "Thread finishing\n"))))

(define (main)
    (display "The main thread\n")
    ; Create a new thread with the name "counter"
    (define counter (thread counter-fun))
    ; Loop to send messages to the thread
    (let loop
        ([n 0])
        (if (< n 10)
            (begin
                (thread-send counter 'hello)
                (loop (+ n 1)))
            (thread-send counter 'finish)))
    (display "Main thread finishing\n"))
