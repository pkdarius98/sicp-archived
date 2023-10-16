(define (double n)
    (+ n n))
(define (halve n)
    (/ n 2))

(define (multi a b)
    (cond
        ((= b 1) a)
        ((even? b) (multi (double a) (halve b)))
        (else (+ a (multi a (- b 1))))))

(multi 2 3)