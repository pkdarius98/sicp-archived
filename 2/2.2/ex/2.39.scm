(define (reverse sequence)
    (fold-right 
        (lambda (x y) (append y (cons x '()))) '() sequence))
(define (reverse sequence)
    (fold-left 
        (lambda (x y) (append (cons y '()) x)) '() sequence))
(reverse '(1 2 3))