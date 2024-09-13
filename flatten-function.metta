(: flatten (-> (List (List $t)) (List $t)))

(= (flatten Nil) Nil)
(= (flatten (Cons (Cons $x $xs) $y))
   (append (flatten (Cons $x $xs)) (flatten $y)))
(= (flatten (Cons $x $y))
   (append (Cons $x Nil) (flatten $y)))

;; test cases
!(flatten (Cons (Cons 1 (Cons 2 Nil)) (Cons (Cons 3 (Cons 4 Nil)) Nil)))
