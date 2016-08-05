;================================;
;              ,--.              ;
;             /   |              ;
;             `|  |              ;
;              |  |.--.          ;
;              `--''--'          ;
; ,--------.                     ;
; '--.  .--',---.,--. ,--.,---.  ;
;    |  |  | .-. |\  '  /(  .-'  ;
;    |  |  ' '-' ' \   ' .-'  `) ;
;    `--'   `---'.-'  /  `----'  ;
;                `---'           ;
;================================;

;;;;;;;;;;
;;; p3 ;;;
;;;;;;;;;;

(atom? 'atom)
; => true
(atom? 'turkey)
; => true
(atom? 1492)
; => true
(atom? 'u)
; => true
(atom? '*abc$)
; => true

(list? '(atom))
; => true
(list? '(atom turkey or))
; => true

;;;;;;;;;;
;;; p4 ;;;
;;;;;;;;;;

(list? '(atom turkey) 'or)
; => ERROR
(list? '((atom turkey) or))
; => true

;(sexp? 'xyz)
; => true
;(sexp? '(x y z))
; => true
;(sexp? '((x y) z))
; => true

; Computes the number of elements in the list
(define length
  (lambda (l)
    (cond ((null? l) 0)
           (true (+ 1 (length (cdr l)))))))

(list?  '(how are you doing so far))
; => true
(length '(how are you doing so far))
; => 6
(list?  '(((how) are) ((you) (doing so)) far))
; => true
(length '(((how) are) ((you) (doing so)) far))
; => 3

;;;;;;;;;;
;;; p5 ;;;
;;;;;;;;;;

(list? '())
; => true
(atom? '())
; => false
(list? '(() () () ()))
; => true

(car '(a b c))
; => a
(car '((a b c) x y z))
; => (a b c)
(car 'hotdog)
; => ERROR
(car '())
; => ERROR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;        The Law of Car         ;
;-------------------------------;
; The primitive 'car is defined ;
; only for non-empty lists.     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; p6 ;;;

(car '(((hotdogs)) (and) (pickle) relish))
; => ((hotdogs))
(car (car '(((hotdogs)) (and))))
; => (hotdogs)

(cdr '(a b c))
; => (b c)
(cdr '((a b c) x y z))
; => (x y z)
(cdr '(hamburger))
; => ()
(cdr '((x) t r))
; => (t r)
(cdr 'hotdogs)
; => ERROR

;;;;;;;;;;
;;; p7 ;;;
;;;;;;;;;;

(cdr '())
; => ERROR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;            The Law of Cdr              ;
;----------------------------------------;
; The primitive 'cdr is defined only for ;
; non-empty lists. The 'cdr of any non-  ;
; empty list is always another list.     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(car (cdr '((b) (x y) ((c)))))
; => (x y)
(cdr (cdr '((b) (x y) ((c)))))
; => (((c)))
(cdr (car '(a (b (c)) d)))
; => ERROR

(cons 'peanut '(butter and jelly))
; => (peanut butter and jelly)

;;;;;;;;;;
;;; p8 ;;;
;;;;;;;;;;

(cons '(banana and) '(peanut butter and jelly))
; => ((banana and) peanut butter and jelly)
(cons '((help) this) '(is very ((hard) to learn)))
; => (((help) this) is very ((hard) to learn))
(cons '(a b (c)) '())
; => ((a b (c)))
(cons 'a '())
; => (a)
(cons '((a b c)) 'b)
; => ERROR
(cons 'a 'b)
; => ERROR

;;;;;;;;;;
;;; p9 ;;;
;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;            The Law of Cons               ;
;------------------------------------------;
; The primitive 'cons takes two arguments. ;
; The second argument to 'cons must be a   ;
; list. The result is a list.              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cons 'a (car '((b) c d)))
; => (a b)
(cons 'a (cdr '((b) c d)))
; => (a c d)

(null? '())
; => true
(null? (quote ()))
; => true
(null? '(a b c))
; => false

;;;;;;;;;;;
;;; p10 ;;;
;;;;;;;;;;;

(null? 'spaghetti)
; => ERROR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      The Law of Null?       ;
;-----------------------------;
; The primitive 'null? is de- ;
; fined only for lists.       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(atom? 'Harry)
; => true
(atom? '(Harry had a heap of apples))
; => false

;;;;;;;;;;;
;;; p11 ;;;
;;;;;;;;;;;

(atom? (car '(Harry had a heap of apples)))
; => true
(atom? (cdr '(Harry had a heap of apples)))
; => false
(atom? (cdr '(Harry)))
; => false
(atom? (car (cdr '(swing low sweet cherry oat))))
; => true
(atom? (car (cdr '(swing (low sweet) cherry oat))))
; => false

(eq? 'Harry 'Harry)
; => true
(eq? 'margarine 'butter)
; => false

;;;;;;;;;;;
;;; p12 ;;;
;;;;;;;;;;;

(eq? '() '(strawberry))
; => ERROR
(eq? 6 7)
; => ERROR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;          The Law of Eq?           ;
;-----------------------------------;
; The primitive 'eq? takeks two ar- ;
; guments.  Each must be a non-     ;
; numeric atom.                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eq? (car '(Mary had a little lamb chop)) 'Mary)
; => true
(eq? (cdr '(soured milk)) 'milk)
; => ERROR

;;;;;;;;;;;
;;; p13 ;;;
;;;;;;;;;;;

(eq? (car '(beans beans we need jelly beans)) (car (cdr '(beans beans we need jelly beans))))
; => true

; --> Now go make yourself a peanut butter and jelly sandwich <-- ;

;------------------------------------------;
;                                          ;
;       This place is reserved for         ;
;             JELLY STAINS!                ;
;                                          ;
;------------------------------------------;
