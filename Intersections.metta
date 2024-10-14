(: intersections (-> (List Tree) (List Tree)))
(= (intersections Nil) Nil)
(= (intersections (Cons $x Nil))
    (getGuardSet $x))
(= (intersections (Cons $x (Cons $y $ys)))
    (let*
        (
            ($firstChildGuardSet (getGuardSet $x))          
            ($remainingIntersections (intersections (Cons $y $ys)))
            ($result (setIntersection isMember $firstChildGuardSet $remainingIntersections))
        )
    $result
    )
)
; Test case
!(intersections (Cons (TreeNode (Value Nil False AND) (Cons (TreeNode (Value A True LITERAL) Nil Nil) Nil) Nil)  
   (Cons  (TreeNode (Value Nil False AND) (Cons (TreeNode (Value A True LITERAL) Nil Nil) Nil)  Nil)  Nil)))

