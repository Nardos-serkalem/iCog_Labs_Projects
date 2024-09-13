; the knowledge base
(Parent Chandler John)
(Parent Chandler Pam)
(Parent John Bob)
(Parent Pam Tim)
(Parent Pam Kim)
(Parent Monica John)
(Parent Monica Pam)
(Parent Monica Adam)
(Parent Monica Jane)
(Parent Jane Joey)
(Parent Adam Eve)

(Gender Chandler M)
(Gender John M)
(Gender Bob M)
(Gender Tim M)
(Gender Kim M)
(Gender Adam M)
(Gender Joey M)

(Gender Monica F)
(Gender Jane F)
(Gender Eve F)
(Gender  Kim F)
(Gender Pam F)

;; rule one
(= (get-parents $x) (match &self (Parent $y $x) $y))
!(get-parents John)

;;rule two
(= (get-grand-parents $s) (match &self (Parent $t $s) (get-parents $t)))
!(get-grand-parents Bob)

;;Mother
(= (get-mother $x) (match &self (Parent $y $x) (match &self 
(Gender $y F) $y) ))
!(get-mother Pam)

;;father
(= (get-father $x) (match &self (Parent $t $x) 
(match &self (Gender $t M) $t)))
!(get-father John)

;;nephews
(= (get-nephews $x)
(match &self (Parent $y $x) (match &self (Parent $y $z) (match &self (Parent $z $c) (match 
&self (Gender $c M) $c))) )) 
!(get-nephews John)

;;niece
(= (get-niece $x) 
(match &self (Parent $y $x) (match &self (Parent $y $z) (match &self (Parent $z $c)
(match &self (Gender $c F) $c)))))
!(get-niece John)

;;predecessors
(= (get-predecessors $x) 
   (match &self (Parent $y $x) (match &self (Parent $z $y) ($y $z))))
!(get-predecessors Bob)

;;siblings
(= (get-siblings $x) 
   (match &self (Parent $p $x) (match &self (Parent $p $y) (if (not (== $x $y)) $y (empty))) )
) 
!(get-siblings Pam)

;;uncle
(= (get-uncles $x)
 (match &self (Parent $y $x) (match &self (Parent $p $y ) (match &self (Parent $p $z ) (match &self (Gender $z M) $z)))))
 !(get-uncles Eve)

 ;;sister
 (= (get-sister $x )
 (match &self (Parent $y $x) (match &self (Parent $y $z) (match &self (Gender $z F) $z)) )
 )
 !(get-sister Pam)

 ;;brother
 (= (get-brother $x)
 (match &self (Parent $p $x) (match &self (Parent $p $z) (match &self (Gender $z M) $z)))
 )

 !(get-brother Pam)

 ;;grandChild
 (= (get-grand-child $p)
 (match &self (Parent $p $x) (match &self (Parent $x $y) $y)))

 !(get-grand-child Monica)



