(= (binaryMap $f $y ()) ())
(= (binaryMap $f $y (:: $x $xs))
   (:: ($f $x $y) (binaryMap $f $y $xs)))
(= (add $x $y) (+ $x $y))
(= (multiply $x $y) (* $x $y))
(= (concat $x $y) (str $x $y))

;; Test cases
!(binaryMap add 10 (:: 1 (:: 2 (:: 3 ()))))
!(binaryMap multiply 8 (:: 1(:: 2 (:: 4 ()))))
!(binaryMap concat 4 (:: 1(:: 2 (:: 4 ()))))
!(binaryMap concat "very" (:: "bad" (:: "nice" (:: "Fast" ()))))
