
(: intersections (-> (List Tree) (List Tree))) 
 
(= (intersections Nil) 
    Nil 
) 
 
(= (intersections (Cons $firstChild $restChildren)) 
    (if (== $restChildren Nil) 
        (getGuardSet $firstChild) 
        (let* 
            ( 
                ($firstChildGuardSet (getGuardSet $firstChild)) 
                ($remainingIntersections (intersections $restChildren)) 
                ($result (setIntersection treeIsMember $firstChildGuardSet $remainingIntersections)) 
            ) 
        $result 
    ) 
) 
) 
! (intersections Nil) 
! (intersections (Cons $child Nil))
!(intersections (Cons $firstChild (Cons $secondChild Nil)))
