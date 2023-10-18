(define (map p sequence)
    (accumulate (lambda (x y) (cons (p x) y)) '() sequence))
(map square '(1 2 3 4))

(define (append sequence_1 sequence_2)
    (accumulate cons sequence_2 sequence_1))
(append '(1 2 3) '(4 5 6))

(define (length sequence)
    (define (inc x y) (+ y 1))
    (accumulate inc 0 sequence))
(length '(1 2 3 4 5))