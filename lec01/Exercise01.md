1. Consider the following BNF grammar for a subset of English:
   ```
      (sentence)    S  ::=  NP VP
   (noun phrase)   NP  ::=  the N
   (verb phrase)   VP  ::=  V NP
          (noun)    N  ::=  student  |  lecturer  |  laptop  |  cat  |  song  |  book
          (verb)    V  ::=  found  |  shot  |  broke  |  ate  |  saw  |  rebooted
    ```
    Derive two sentences from it: a meaningful one and a silly one

   ```
    We start witht the start symbol S 
    S --> NP VP 
    Replacing the nontermianls 
    NP VP --> the N V NP 
    Replacing the nonterminals 
    the N V NP --> the student found the N 
    the student found the N --> the student found the laptop

    All is now terminating resulting in 
    The student found the laptop


    The cat ate the student
   ```

2. What is the result of evaluating the following comparisons?
   ```
     0 = 0
     0 <> 0
     0l = 0l
     0l <> 0l
   ```
   

   ```ocaml
     0 = 0 == true
     0 <> 0 == false
     0l = 0l == true
     0l <> 0l == false
   ```

   3. OCaml also supports the alternative `==` and `!=` comparison operations.
   What is the result of evaluating the following comparisons?
   ```
     0 == 0
     0 != 0
     0l == 0l
     0l != 0l
   ```
     Why?

    ```ocaml
     0 == 0 == true because == checks physical equal
     0 != 0 == false 
     0l == 0l == false they point to different addresses 
     0l != 0l == true
   ```
Because they are comparing addresses in == and it is primitive 

4. What is the result of evaluating the expression
   ```ocaml
      "I love QuickCheck " + 2
   ```
   compared to the following Java expression?
   ```Java
      "I love QuickCheck " + 2
   ```
   How would you express the latter in (legal) OCaml?

Result ocaml
   ```ocaml
      "I love QuickCheck " + 2
    Error: This expression has type string but an expression was expected of type
         int
   ```

Result Java
   ```Java
      "I love QuickCheck " + 2
       "I love QuickCheck " + 2
   ```

Change OCAML to java result 


```ocaml
Printf.sprintf "I love QuickCheck %d" 2;;
- : string = "I love QuickCheck 2"

"I love quickCheck " ^ string_of_int 2;;
   ```

6. Exercise 3.1 (1-9) in Hickey

    6.1 Which of the following is legal

    ```ocaml
    let x = 1 in x;;
    int = 1

    let x = 1 in let y = x in y;;
    int = 1

    let x = 1 and y = x in y;;
    Error: Unbound value x
    x is not assignet in second function

    let x = 1 and x = 2 in x;;
    Error: Variable x is bound several times in this matching
    X is assigned multiple times

    let x = 1 in let x = x in x;;
    int = 1

    let a' = 1 in a' +1;;
    int = 2

    let 'a = 1 in 'a + 1;;
    Error: Syntax error

    let a'b'c = 1 in a'b'c;;
    int = 1

    let x x = x + 1 in x 2;;
    int = 3

    let rec x x = x + x in x 2;;
    int = 4

    let (++) f g x = f (g x) in
    let f x = x + 1 in
    let g x = x * 2 in
    (f ++ g) 1;;
    int = 3

    let (-) x y = y - x in 1 - 2 - 3;;
    int = 2

    let rec (-) x y  = y - x in 1 - 2 - 3;;
    runs forever

    let (+) x y z = x + y + z in 5 + 6 7;;
    Error: This expression has type int
       This is not a function; it cannot be applied.

    let (++) x = x + 1 in ++x;;
    syntax error

    
    ```