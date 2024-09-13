 ;;This function checks if the TreeNode has exactly 2 children
    (= (checkBinaryTree (TreeNode $value $guardSet $children)) 
    (== 2 (length $children))) 
 
 ;;helper function
   (:length (-> (List) Int)) 
    (= (length Nil) 0) 
    (= (length (Cons $x $xs)) 
        (+ 1 (length $xs))) 

;;test case
!(checkBinaryTree (TreeNode (Value Nil False OR) Nil   
  (Cons (TreeNode (Value B True ) Nil Nil) (Cons (TreeNode (Value C False ) Nil Nil) Nil))))
!(checkBinaryTree (TreeNode (Value Nil False OR) Nil (Cons (TreeNode (Value Nil True OR) Nil 
(Cons (TreeNode (Value a False ) Nil Nil) (Cons (TreeNode (Value Nil True AND) Nil
 (Cons (TreeNode (Value b False ) Nil Nil) (Cons (TreeNode (Value c False ) Nil Nil) Nil))) Nil))) Nil)))