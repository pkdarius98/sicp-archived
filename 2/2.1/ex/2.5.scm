(define (power x n)
    (define (iter result count)
        (if (= count n)
            result
            (iter (* result x) (+ count 1))))
    (iter 1 0))

(define (cons a b)
    (* (power 2 a) (power 3 b)))
(cons 2 3)

(define (car z)
    (define (iter z count)
        (if (= 1 (remainder z 2))
            count
            (iter (/ z 2) (+ count 1))))
    (iter z 0))
(car 108)
(define (cdr z)
    (define (iter z count)
        (if (= 1 (remainder z 3))
            count
            (iter (/ z 3) (+ count 1))))
    (iter z 0))
(cdr 108)