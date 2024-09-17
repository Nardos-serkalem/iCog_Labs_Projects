(: commandSetIterator (-> (List Tree) (List Tree) (List Tree)))
(= (commandSetIterator Nil $localCommandSet) $localCommandSet)

(= (commandSetIterator (Cons $x $xs) $localCommandSet)
   (if (and 
         (and (== (getChildren $x) Nil) (== (guardSetChecker (Cons $x $xs)) 1))
         (== (getNodeType $x) AND)
       )
       (setUnion treeIsMember (getGuardSet $x) (commandSetIterator $xs $localCommandSet))
       (commandSetIterator $xs $localCommandSet)
   )
)
,,Testcase
!(commandSetIterator 
   (Cons (TreeNode (Value Nil False AND) (Cons (TreeNode (Value A False LITERAL) Nil Nil) Nil)  Nil)
   (Cons (TreeNode (Value Nil False OR) (Cons (TreeNode (Value B False LITERAL) Nil Nil)
   (Cons (TreeNode (Value C False LITERAL) Nil Nil) Nil)) Nil) Nil)) Nil)
!(commandSetIterator
   (Cons (TreeNode (Value Nil False AND) 
   
