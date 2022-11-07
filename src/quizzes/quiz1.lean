/-
CS2120 Fall 2022 Sullivan. Quiz #1. Edit your answers into
this file using VSCode. Save the file to your *local* hard 
drive (File > Save As > local > ...). Submit it to the Quiz1
assignment on Collab.
-/

/-
#1: For each of the following questions give a yes/no answer 
and then a very brief explanation why that answer is correct.
To explain why your answer is correct, name the specific rule
of inference that tells you it's correct, or explain that 
there is no such valid inference rule.
-/

/-
#1A

If a ball, b, is round *and* b is also red, is b red?

A: yes/no: yes

B: Why? b is red because the ball is both round and red; for that statement 
to be true both arguments need to be true. Elimination and is the inference rule
that tells me it's correct.


#1B

If flowers make you happy and chocolates make you happy,
and I give you flowers *or* I give you chocolates, will
you be happy?

A: yes/no: yes

B: Why? This will make me happy because flowers and chocolates make me happy. 
If you give me flowers or chocolates I will be happy because both make me happy.
Elimination or is what tells me this is correct.


#1C: If giraffes are just zebras in disguise, then the 
moon is made of green cheese?

A. yes/: no

B. Why? this will not be true because the two arguments are not related. Giraffes
being zebras in disguise will not imply the moon being made out of green cheese.


#1D. If x = y implies that 0 = 1, then is it true that
x ≠ y?

A. yes/no: no

B. Why? This cannot be true because we know that 0 does not equal 1 so for that
implication to be true, x = y has to be true. So x cannot not equal y.



#1E. If every zebra has stripes and Zoe is a Zebra then
Zoe has stripes.

A. yes/no: yes

B. Why? Zoe must have stripes because it is true that every zebra stripes; Zoe is 
a zebra therefore she has stripes. Elimination and tells us this is correct.


#1F. If Z could be *any* Zebra and Z has stripes, then 
*every* Zebra has stripes.

A. Yes/no: yes

B: Why? This is true because since Z can be any zebra, meaning Z represents all 
zebras, and Z has stripes therefore every zebra must have stripes.


#1G. If whenever the wind blows, the leaves move, and 
the leaves are moving, then the wind is blowing.

A. yes/no: yes

B. Why? This is true because the wind blowing means the leaves are moving so if 
the leaves are moving then the wind is blowing. Elimination and tells us this is
correct.


#1H: If Gina is nice *or* Gina is tall, and Gina is nice,
then Gina is not tall. (The "or" here is understood to be
the or of predicate logic.)

A. yes/no: no

B. Why? We know that Gina is nice so the statement "Gina is nice or tall" will be 
true, but it does not necessarily mean that Gina is not tall. She can be tall or 
not tall for this statement to be true.
-/



/- 
#2

Consider the following formula/proposition in propositional
logic: X ∨ ¬Y.

#2A: Is is satisfiable? If so, give a model (a binding of 
the variables to values that makes the expressions true).
This is satisfiable because if X is true and Y is true then the statment will be
true or not true, which results in a satisfiable statement.

#2B: Is it valid? Explain your answer. 
This is not valid because it will not be true in every instance. For example, if
X is false and Y is true then the statement will be false or not true which is false.

-/


/-
#3: 

Express the following propositions in predicate logic, by
filling in the blank after the #check command.

If P and Q are arbitrary (any) propositions, then if (P is 
true if and only if Q is true) then if P is true then Q is 
true.
-/

#check ∀ (P Q : Prop), (P ∧ Q, P) → Q



/-
#4 Translate the following expressions into English.
The #check commands are just Lean commands and can
be ignored here. 
-/


-- A
#check ∀ (n m : ℕ), n < m → m - n > 0

/-
Answer: for all n and m to be natural numbers and n is less than m implies 
m - n is greater than 0
-/

-- B

#check ∃ (n : ℕ), ∀ (m : nat), m >= n

/-
Answer: There exists a value n that is a natural number and for all m that are
natural numbers, m is greater than or equal to n
-/


-- C

variables (isEven: ℕ → Prop) (isOdd: ℕ → Prop)
#check ∀ (n : ℕ), isEven n ∨ isOdd n

/-
Answer: For all values n that are natural numbers, n will be even or odd
-/


-- D

#check ∀ (P : Prop), P ∨ ¬P

/-
Answer: For all values P that are propositions, P or not P is true
-/


-- E

#check ∀ (P : Prop), ¬(P ∧ ¬P)

/-
Answer: For all values P that are propositions, not the conjuction P and not P 
is true
-/


/-
#5 Extra Credit

Next we define contagion as a proof of a slightly long
proposition. Everything before the comma introduces new
terms, which are then used after the comma to state the
main content of the proposition. 

Using the names we've given to the variables to infer
real-world meanings, state what the logic means in plain
natural English. Please don't just give a verbatim reading
of the formal logic. 
-/

variable contagion : 
  ∀ (Animal : Type) 
  (hasVirus : Animal → Prop) 
  (a1 a2 : Animal) 
  (hasVirus : Animal → Prop)
  (closeContact : Animal → Animal → Prop), 
  hasVirus a1 → closeContact a1 a2 → hasVirus a2


