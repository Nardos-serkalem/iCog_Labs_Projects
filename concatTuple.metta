(: concatTuple (-> Expression Expression Expression))
(= (concatTuple $x $y) (collapse (union (superpose $x) (superpose $y)))) 

;;testcases
!(concatTuple (1 2) (3 4))    
!(concatTuple () (3 4))       
!(concatTuple (1 2) ())       
!(concatTuple () ())

