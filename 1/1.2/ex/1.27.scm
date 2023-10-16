;; some Carmichael numbers: 561, 1105, 1729, 2465, 2821, 6601
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

(define (full_fermat_prime? n)
    (define (iter a n)
        (if (= a n)
            true
            (if (= (expmod a n n) a) (iter (+ a 1) n) 
                false)))
    (iter 1 n))

 (define (test_fermat_prime n expected) 
   (define (report_result n result expected) 
     (newline) 
     (display n) 
     (display ": ") 
     (display result) 
     (display ": ") 
     (display (if (eq? result expected) "OK" "FOOLED"))) 
   (report_result n (full_fermat_prime? n) expected))

(test_fermat_prime 561 false)
(test_fermat_prime 1105 false)
(test_fermat_prime 1729 false)
(test_fermat_prime 2465 false)
(test_fermat_prime 2821 false)
(test_fermat_prime 6601 false)