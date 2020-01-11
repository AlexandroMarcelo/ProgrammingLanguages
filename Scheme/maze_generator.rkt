#lang racket


#|
    TEAM: 
    Luis Fernando Carrasco A01021172
    Alexandro Marcelo A01021383
    Daniel Pelagio A01227873

    02/12/2019

|#


; The main procedure that generates a maze with the given size of rows and columns
(define (generateMaze rows columns fileName)

    ; The matrix, that is a hash table (array of arrays in racket was a mess to modify values so be used hash instead)  
    (define matrix (make-hash))
    
    ; The first loop select a random neighbor and moves to it if its not visited
    (let loop1

        ; Start at a random cell on the matriz. It doesnt matter which one
        ([cell (list (random rows) (random columns))])

        ; Check the neighbors of the current cell. If the random selected neighbor is not visited, merge the two cells and call the function again, but with the selected neighbor as the new cell

        ; Get the neighbors of the current cell, and explore each with a For loop (shuffle to make the algorith more random)
        (for ([n (shuffle(neigbours cell rows columns))])

            ; If the selected neighbor is NOT visited, then ...
            (case (isVisited? matrix n)
                ; Merge the current cell and that neighbor, and loop again but with the neighbor as the new current cell
                [(#f)   (mergeCells matrix cell n)(loop1 n)]
            )
        )
    )
    
    ; Writing to a file the resulting maze 
    (define out (open-output-file fileName #:exists 'truncate))

    ; Write the resulting maze to a file
    (display "   " out)
    (let loop
        ([i 0])
        (if (< i (- rows 1))
            (begin (display "111" out) (loop (+ i 1)))
            (display "" out)
        )
    )
    (displayln "1" out)
    
    (let loop1 
        ([j 0])
        (if (< j columns)
            (begin
                (display "1" out)
                
                (let loop2 
                    ([i 0])
                    (
                        if (< i (- rows 1))
                            (if (connected? matrix (list i j) (list (+ 1 i) j))
                                (begin (display "   " out) (loop2 (+ i 1)))
                                (begin (display "  1" out) (loop2 (+ i 1)))
                            )
                            (display "" out)
                    )
                )
                (display "  1" out)
                (displayln "" out)

                (let loop3 
                    ([i 0])
                    (
                        if (< i rows)
                            (if (connected? matrix (list i j) (list i (+ j 1)))
                                (begin (display "1  " out) (loop3 (+ i 1)))
                                (begin (display "111" out) (loop3 (+ i 1)))
                            )
                            (display "" out)
                    )
                )
                (if (= j (- columns 1))
                    (displayln " " out)
                    (displayln "1" out)
                )
                (loop1 (+ j 1))
            )
            (display "" out)
        )
    )
    (displayln "" out)
    (close-output-port out)
)

; Procedure to know if a cell has been visited or not 
(define (isVisited? matrix cell) 
    ; (display cell)
    (dict-has-key? matrix cell) ; returns bool if the hash-table has the key send
)

; Procedure to know if a cell is connected to the neighbor or there is a wall 
(define (connected? matrix cell1 cell2) 

    ; Function that retrieves the value found with key inside out hash-table and checks if a is inside value of b
    (member cell1 (dict-ref matrix cell2 '())) ; In case it is not found, it retrieves an empty list 
    ; member checks if a is in value of b
)

; The procedure merges two cells by updating the dictionary with the ref of the other one
; Is the one that keeps tha path for the recursive backtracking
(define (mergeCells matrix cell neighbour) 
    ; (display cell)
    (dict-set! matrix cell (cons neighbour (dict-ref matrix cell '())))
    (dict-set! matrix neighbour (cons cell (dict-ref matrix neighbour '())))
)

; Procedure to get the neighbors of a given cell (top, right, bottom and left)
(define (neigbours cell rows columns)

    ;(displayln cell)
    ; Defining some expresions to know what to compare in each coordenate
    (define top '(0 -1))
    (define right '(1 0))
    (define bottom '(0 1))
    (define left '(-1 0))  
    
    (cond
        ; CORNERS
        ;If the cell is 0,0 (Top left), the only neighbors can be to the bottom and to the right
        [(and (= (car cell) 0) (= (car (cdr cell)) 0)) (for/list ([dirList (list right bottom)]) (map + cell dirList))]
        ;If its rows,0 (Top right), the neighbors can be to the bottom and to the left (etc...)
        [(and (= (car cell) (- rows 1)) (= (car (cdr cell)) 0)) (for/list ([dirList (list bottom left)]) (map + cell dirList) )]
        ;0,cols (Bottom left)
        [(and (= (car cell) 0) (= (car (cdr cell)) (- columns 1) )) (for/list ([dirList (list top right)]) (map + cell dirList) )]
        ; rows,cols (Bottom right)
        [(and (= (car cell) (- rows 1)) (= (car (cdr cell)) (- columns 1))) (for/list ([dirList (list top left)]) (map + cell dirList) )]
        
        ;WALLS
        ;x,0 (Any position in the top wall)
        [(and (> (car cell) 0) (= (car (cdr cell)) 0)) (for/list ([dirList (list left bottom right)]) (map + cell dirList) )]
        ;0,x (Any position in the left wall)
        [(and (= (car cell) 0) (> (car (cdr cell)) 0)) (for/list ([dirList (list top right bottom)]) (map + cell dirList) )]
        ;rows,x (Any position in the right wall)
        [(and (= (car cell) (- rows 1)) (> (car (cdr cell)) 0)) (for/list ([dirList (list top bottom left)]) (map + cell dirList) )]
        ;x,cols (Any position in the bottom wall)
        [(and (> (car cell) 0) (= (car (cdr cell)) (- columns 1))) (for/list ([dirList (list left top right)]) (map + cell dirList) )]
        
        ; ANY POSITION IN THE MIDDLE
        ;rows<x,columns>x
        [(and (<= 0 (car cell) (- rows 1)) (<= 0 (car (cdr cell)) (- columns 1))) (for/list ([dirList (list left top right bottom)]) (map + cell dirList ))]
    )
)


(generateMaze 3 3 "final_maze.txt")
;(generateMaze 20 30)