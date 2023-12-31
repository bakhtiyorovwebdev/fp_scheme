;; Done
(module sn-graph racket
  (provide sn-empty
           sn-add-user
           sn-users
           sn-add-frndshp
           )
 
  ;; required libraries. (imported above)
  (require racket/dict)
  (require racket/set)

  (define my-dict
  (list
   (cons 'f2
         (list 'f3 'f4))
   (cons 'f3
         (list 'f2))
   (cons 'f4
         (list 'f3 'f2))
   (cons 'f13
         (list ))
   (cons 'f1
         (list ))
   ))
  
  ;; graph
  ;; -> [a]
  ;; Easy (+0.5)
  (define sn-empty
    empty)
 #| Defines the constant named sn-empty as the empty list, the empty network.|#
  
  ;; Easy
  ;; [(k,v)] -> [u]
  (define (sn-users graph)
    (map first graph))
#| This function returns the list of users.|#
  
  ;; Hard
  ;; [(k,v)] u -> [(k,v)] | (u,{})
  (define (sn-add-user graph user)
    (if (dict-ref graph user #f)
        graph
        (dict-set graph user '())))
  #| Given a network and an ID or name, this
function adds a new entry to the network
for that user.|#
  
  ;; Hard
  ;; [(k,v)]|(u1,f1)|(u2,f2) ->
  ;;  [(k,v)] | (u1,f1+{f2}) | (u2,f2+{f1})
  (define (sn-add-frndshp graph u1 u2)
    (let* ((friends1 (dict-ref graph u1 sn-empty))
           (friends2 (dict-ref graph u2 sn-empty))
           (new-friends1 (set-add friends1 u2))
           (new-friends2 (set-add friends2 u1))
           (updated-dict (dict-set graph u1 new-friends1))
           (final-dict (dict-set updated-dict u2 new-friends2)))
      final-dict))
  #| Given a network and two existing keys, this fucntion updates both user's list of friends.|#
        
           


  )