;; Done

(module sn-utils racket

  (provide sn-dict-ks-vs
           sn-line->entry
           sn-list->dict
           )
#| Given a list of entries, the function above returns the argument passed. This function creates a list of pairs.|#
 
  ;; utils
  ;; [k] [v] -> [(k,v)]
  ;; Easy
  (define (sn-dict-ks-vs ks vs)  
    (map cons ks vs))
  #| Given a list of values and the list of user keys the function above returns a dictionary, a list of keys with their corresponding values.|#

  ;; Medium
  ;; str -> (a,[a])
  (define (sn-line->entry ln)
    (map (λ (ln) (string->symbol ln)) (string-split ln)))

  ;; [(a,b)] -> [(a,b)] 
  ;; Easy
  (define (sn-list->dict es)
    es)
  #| Given a string, this function first splits it into a list, then returns a dictionary entry, a list where the first element is the key and the remainder of the list is the corresponding value as symbols.|#
  
  )