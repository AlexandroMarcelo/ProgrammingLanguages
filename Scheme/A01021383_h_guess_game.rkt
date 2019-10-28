#|
Alexandro Francisco Marcelo Gonzalez A01021383

Homework: Number_guess_game
Program that allows you to play the game of guessing a number.
|#

;the main function which going to start the loop of the game
(define (guess-game limit)
    (display "WELCOME TO THE NUMBER GUESS GAME!\n")
    (let* ([guess (random limit)] [n_guess (+ guess 1)]) ;asigning the random number according to the limit for calling the game loop, and adding one to be from 0 to limit (inclusive)
        (display (string-append "*the number to guess is " (number->string n_guess) "*\n")) (loop_game n_guess 1) ;calling the game loop with the number to guess and the number of tries the user (initialized to 1)
    )
)

;the loop of the game
(define (loop_game guess tries)
    (display "Enter your guess")
    (let ([given_number (read)]) ;reading the typed number from the user
        (cond 
            [(= given_number guess) (display (string-append "Congratulations, you won after " (number->string tries) " tries."))] ;if the user guessed the number
            [(< given_number guess) (display "Enter a higher number\n") (loop_game guess (+ tries 1))] ;if the user gave a lower number, and calling again the game loop adding 1 try
            [(> given_number guess) (display "Enter a lower number\n") (loop_game guess (+ tries 1))] ;if the user gave a higher number, and calling again the game loop adding 1 try
        )
    )
)
