(define wave2 (beside wave (flip_vert wave)))
(define wave4 (below wave2 wave2))

(define (flipped_pairs painers)
    (let ((painter2 (beside painter (flip_vert painers))))
        (below painter2 painter2)))
(define wave4 (flipped_pairs wave))

(define (right_split painter n)
    (if (= n 0)
        painter
        (let ((smaller (right_split painter (- n 1))))
            (beside painter (below smaller smaller)))))
(define (up_split painter n)
    (if (= n 0)
        painter
        (let ((smaller (up_split painter (- n 1))))
            (below (beside smaller smaller) painter))))
(define (corner_split painter n)
    (if (= n 0)
        painter
        (let ((up (up_split painter (- n 1)))
              (right (right_split painter (- n 1)))
            (let ((top_left (beside up up))
                  (bottom_right (below right right))
                  (corner (corner_split painter (- n 1))))
                (beside (below painter top_left)
                        (below bottom_right corner)))))))

(define (square_limit painter n)
    (let ((quarter (corner_split painter n)))
        (let ((half (beside (flip_horizontal quarter) quarter)))
            (below (flip_vert half) half))))