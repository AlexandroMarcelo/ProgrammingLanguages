#|
Function to replicate 'invert'
|#


;;;; Regular Recursion
; A single funtion that takes one argument
(define (invert-list data)
    (if (empty? (cdr data))   
        ; List of one element only
        data
        (append (invert-list (cdr data)) (list (car data)))))


;;;;; Tail Recursion
; Entry point for a tail recursive method
(define (tail-invert data)
    (tail-invert-2 data '()))

; Recursive function that takes two arguments
(define (tail-invert-2 data result)
    (if (empty? (cdr data))
        (append data result)
        (tail-invert-2 (cdr data) (append (list (car data)) result))))


;;;;; Using lambda functions
; The function takes only one argument
(define (lambda-invert data)
    ; Use letrec to define something that is defined with respect to itself
    (letrec
        ; Internal lambda function that takes two arguments
        (   [loop (lambda (data result)
                (if (empty? (cdr data))
                    (append data result)
                    (loop (cdr data) (append (list (car data)) result))))])
        ; Call the recursive tail function
        (loop data '())))


;;;;; Using named let
; The function takes only one argument
(define (let-invert data)
    (let loop
        (   [lst data]
            [result '()]) 
        (if (empty? (cdr lst))
            (append lst result)
            (loop (cdr lst) (append (list (car lst)) result)))))
