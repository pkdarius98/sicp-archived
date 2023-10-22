(define (encode message tree)
    (if (null? message)
        '()
        (let ((a (encode_symbol (car message) tree))
              (b (encode (cdr message) tree)))
            (append a b))))

(define (encode_symbol symbol tree)
    (cond ((leaf? tree) '())
          ((memq symbol (symbols (left_branch tree))) (cons 0 (encode_symbol symbol (left_branch tree))))
          ((memq symbol (symbols (right_branch tree))) (cons 1 (encode_symbol symbol (right_branch tree))))
          (else (display 4)(error "bad symbol: ENCODE_SYMBOL" symbol))))

(encode decoded_message sample_tree)