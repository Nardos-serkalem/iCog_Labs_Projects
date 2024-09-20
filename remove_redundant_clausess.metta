(: remove_redundant_clauses (-> (List Clause) (List Clause)))
(= (remove_redundant_clauses Nil) 
    Nil
)
(= (remove_redundant_clauses (Cons $clause $rest))
  (setInsert $clause (remove_redundant_clauses $rest))
)

(: setInsert (-> $t (List $t) (List $t)))
(= (setInsert $item Nil) 
    (Cons $item Nil)
)
(= (setInsert $item (Cons $head $tail)) 
    (if (== $item $head)
        (Cons $head $tail)  
        (Cons $head (setInsert $item $tail))  
    )
)

(: is-member (-> $t (List $t) Bool))
(= (is-member $item Nil) 
    false
)
(= (is-member $item (Cons $head $tail))
  (if (== $item $head)
      true
      (is-member $item $tail)
  )
)

!(remove_redundant_clauses
  (Cons (Inheritance $X kebede $Z)
    (Cons (Inheritance $X $Y $Z)
      (Cons (Inheritance $X $Y $Z) 
        (Cons (Inheritance $X Abebe kebede) Nil)
      )
    )
  )
)



