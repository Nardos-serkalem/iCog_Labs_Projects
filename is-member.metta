
(: is-member (-> $a List Bool))

(= (is-member $a Nil) False)
(= (is-member $a (:: $x $xs))

;;Checks if a given element $a is a member of a list
    (if (== $a $x)
        True
        (is-member $a $xs)
          )
     )

     ;;test case
 ! (is-member 3 (:: 4 (:: 3 (:: 2 Nil))))
 ! (is-member 10 (:: 6 (:: 9 (:: 12 Nil))))