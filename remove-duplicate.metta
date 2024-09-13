
 (= (is-member $x $list) 
    (case $list 
        ( 
            ( (Cons $n $s) (if (== $x $n) True (is-member $x $s))) 
            ( Nil False) 
        ) 
    ) 
) 
 
(= (remove-duplicates Nil) Nil) 
(= (remove-duplicates (Cons $x $xs)) 
  (if (is-member $x $xs) 
    (remove-duplicates $xs) 
    (Cons $x (remove-duplicates $xs)) 
  ) 
)  
! (remove-duplicates (Cons A (Cons B (Cons B Nil))))
!(remove-duplicates (Cons 1 (Cons 1 (Cons 1 Nil))))