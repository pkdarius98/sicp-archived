(define (fib n)
  (fib_iter 1 0 0 1 n))
(define (fib_iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib_iter a
                   b
                   (+ (* q q) (* p p))
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
        (else (fib_iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))