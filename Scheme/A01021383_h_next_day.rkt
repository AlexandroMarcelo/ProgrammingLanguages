#|
Alexandro Francisco Marcelo Gonzalez A01021383

Homework: Next Day
Program that returns the next day in the calendar with a given date (in a list)
|#

;function to returns the next day in the calendar with a given date as a list '(day month year)
(define (next_day current_date)
    ;(28 2 2016) -> (29 2 2016)
    (define year (car (cdr (cdr current_date)))) ;gettin the year to evaluate if it is a leap year
    (define month (car (cdr current_date))) ;gettin the month
    (define day (car current_date)) ;getting the day
    (if (equal? (leap_year year) #t) ;if it is a leap year
        (if (= month 2) ;if it is a leap year and it is february
            (if (<= day (number_days month)) ;if the day is less that 28 i just add 1 otherwise i change the month and the day
                (list (+ day 1) month year)
                (list 1 (+ month 1) year)
            )
            (change_date day month year) ;change a normal date
        )
        (change_date day month year)
    )
)

;function to determine the number of days for the given month
(define (number_days month)
    (case month ;case for knowing the number of days of each month
        [(1 3 5 7 8 10 12) 31]
        [(4 6 9 11) 30]
        [(2) 28] ;for a normal february
    )
)

;function to change the date
(define (change_date day month year) 
    (if (and (= month 12) (= day 31)) ;if the given date is a change of year will set the new dato to '(1 1 next-year) otherwise just add a day on the date
        (list 1 1 (+ year 1))
        (add_day day month year)
    )
)

;adding a day depending on the month
(define (add_day day month year)
    (if (< day (number_days month)) ;just substracting the 'february_leap_year' argument to know if the month has to change or not
        (list (+ day 1) month year)
        (list 1 (+ month 1) year)
    )
)

;function to determine if it is a leap year
(define (leap_year year)
	(if (= (modulo year 400) 0) ;if the year module 400 is 0 is leap year
        ;(display "Is a leap year") 
        #t
        (if (and (= (modulo year 4) 0) (> (modulo year 100) 0)) ;if the year module 4 and the year module 100 is 0 is leap year
            ;(display "Is a leap year") 
            ;(display "It is no a leap year")
            #t
            #f
        )
    )
)
