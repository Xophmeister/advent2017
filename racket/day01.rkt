(module day01 racket
  (provide rotate-one rotate-half)

  (define (rotate lst offset)
    (if (zero? offset)
      lst
      (rotate
        (append (cdr lst) (list (car lst)))
        (sub1 offset))))

  (define (char->number char)
    (string->number (string char)))

  (define (inverse-captcha str offset)
    (let* (
      [lst     (string->list str)]
      [rotated (rotate lst offset)])

      (apply + (map (lambda (x) (char->number (car x)))
                    (filter (lambda (x) (equal? (take x 1) (take-right x 1)))
                            (map list lst rotated))))))

  (define (rotate-one str)
    (inverse-captcha str 1))

  (define (rotate-half str)
    (inverse-captcha str (quotient (string-length str) 2)))

  (module* test #f
    (require rackunit)

    (check-eq? (rotate-one "1122") 3)
    (check-eq? (rotate-one "1111") 4)
    (check-eq? (rotate-one "1234") 0)
    (check-eq? (rotate-one "91212129") 9)
    
    (check-eq? (rotate-half "1212") 6)
    (check-eq? (rotate-half "1221") 0)
    (check-eq? (rotate-half "123425") 4)
    (check-eq? (rotate-half "123123") 12)
    (check-eq? (rotate-half "12131415") 4)))
