(define (prime? n)
    (define (square a)
        (* a a))
    (define (divides? a b)
        (= (remainder b a) 0))
    (define (find_divisor n test_divisor)
        (cond 
            ((> (square test_divisor) n) n)
            ((divides? test_divisor n) test_divisor)
            (else (find_divisor n (+ test_divisor 1)))))
    (define (smallest_divisor n)
        (find_divisor n 2))
    (= n (smallest_divisor n)))
(prime? 113)


(define (expmod base exp m)
    (cond
        ((= exp 0) 1)
        ((even? exp) 
            (remainder 
                (square (expmod base (/ exp 2) m))
                m))
        (else 
            (remainder 
                (* base (expmod base (- exp 1) m))
                m))))
(define (fermat_test n)
    (define (try_it a)
        (= (expmod a n n) a))
    (try_it (+ 1 (random (- n 1)))))
(define (fast_prime? n times)
    (cond
        ((= times 0) true)
        ((fermat_test n) (fast_prime? n (- times 1)))
        (else false)))