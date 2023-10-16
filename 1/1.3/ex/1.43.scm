(define (repeated f n)
    (lambda (x) 
        (define (iter result count)
            (if (= count n)
                result
                (iter (f result) (+ count 1))))
        (iter x 0)))
((repeated square 2) 5)