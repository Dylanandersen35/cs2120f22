/-
The following line imports a tactic for
simplfying algebraic expressions of a certain
kind. We explain it in more detail below.
-/
import tactic.ring

/-
This assignment has three multi-part problems.
The first two problems will develop and test 
your understanding of exists introduction; and 
the third, of exist elimination. Problems that
ask you to state and prove a proposition will
get half credit for a correct proposition and
the other half for a correct proof. 
-/


/- *** Exists introduction *** -/

/- #1A.

State and prove the proposition that there's some
natural number whose square is 144.
-/

def square (n : ℕ) := n * n
def squares (n m : ℕ) : Prop := square n = m
example : squares 12 144 := rfl


/- #1B.
State and prove the proposition that there is 
some string, s, such that s ++ "!" is the string, 
"I love logic!." Note: In Lean, ++ is notation
for string.append, the function for gluing two
strings together into one.
-/

example : (∃ (s : "I love logic")) := s ++ "!"

/- #1C.

Formally state and prove the proposition that
there are three natural numbers, x, y, and z, 
such that x*x + y*y = z*z. Hint: exists.intro
takes just one witness as a time, so you will
have to apply it more than once.
-/

def pyth (x y z : ℕ) := x*x + y*y = z*z
example : ∃ (x y z : ℕ), pyth x y z :=
begin
assume X Y Z,
apply exists.intro x
apply exists.intro y
apply exists.intro z
end

/- #1D
Define predicate called pythag_triple taking
three natural number arguments, x, y, and z,
yielding the proposition that x*x + y*y = z*z.
-/

def pythag_triple (x y z : ℕ) := x*x + y*y = z*z

/- #1E
State the proposition that there exist x, y, z, 
natural numbers, that satisfy the pythag_triple, 
predicate, then prove it. (Use "example : ...")
-/

example : ∃ (x y z : ℕ), pythag_triple x y z :=
begin
--unfold pythag_triple,
apply exists.intro 3,
apply exists.intro 4,
apply exists.intro 5,
exact rfl,
end

/- #2A

Define a predicate, (multiple_of n m), where
n and m are natural numbers and where the
proposition is true if and only if n is a 
multiple of m. Hint: What has to be true for 
n to be a multiple of m? There has to be some
other number involved, right?
-/

def multiple_of (n m : ℕ) := ∃ (k), n = m * k  

/- #2B

Using the predicate multiple_of, state and 
prove the proposition that every natural number 
that is a multiple of 6 is also a multiple of 3. 

Hint: you can use "unfold multiple_of at h,"
to expand the definition of multiple_of in the
hypothesis, h (assuming you call it that).

Hint: Put the argument you will give to exists
intro in parentheses (needed for correct syntax).

Hint: You might end up with n = 3 * (2 * w) 
as a goal. The "ring" tactic in Lean will 
simplify this expression to n = 6 * w. 

Before you do the work, let's talk a little
more about the "ring" tactic. First, where does
the name come from? Second, what does it do?

A "ring" in college-level algebra (and beyond)
is any set of values (such as natural numbers) 
with + and * operations that satisfy the usual 
rules of arithmetic (such as the distributive
laws, the associativity of + and *, etc). Not
only the natural numbers form a ring, but so
do polynomials and many other kinds of "math"
objects as well.

The ring tactic is used to put any expression 
involing any rin" into a "normal" form. What 
"normal" means in this context is that if you 
put two mathematically equivalent but different 
expressions into normal form, then you get the 
same "normalized" expression in both cases,
making it easy to test them for equality. 

So, in particular, if you want to know whether 
a+(b+c)=(a+b)+c, put both expresions in normal
form and see if they are equal (which again they 
are if + is addition in any "ring").

A good English translation of the use of the 
ring tactic is "by basic algebra."
-/


/-
Here's an example. Is ℕ addition associative? 
You know it is. Prove it formally and then fill
in the English language proof below. 
-/

example (n m k : ℕ) : n + (m + k) = (n + k) + m := 
begin 
ring,
end  
-- Enlish proof (it's short!): ℕ is addition associative. To start, we must unfold
-- it and then we can see that ℕ is addition associative as both are the same, using
-- ring.

/-
Whoa! It's so easy to prove addition associative? 
Yep. Thankfully someone else wrote this beautiful 
tactic so you don't have to do the algebra yourself.
-/

/-
As a small aside on Lean syntax, if a tactic script 
is just one tactic long, you can use "by <tactic>" 
instead wrapping the tactic in a begin-end block.
-/
example (n m k : ℕ) : n + (m + k) = (n + k) + m := by ring

/-
Ok, with that background in place, let's 
return to the problem we were discussing. 
Is it true that if any natural number is
a multiple of 6 then it's also a multiple 
of 3?

Before you even consider writing a proof, 
whether in Lean or in English, figure out 
yourself whether the proposition appears to 
be true or not. Try to prove it "mentally"
to yourself first. 

The key question here is, what does it even 
mean for a  number, n, to be a multiple of 6. 
Well, n is a multiple of 6 if there's some 
number, say k, such that n = k * 6, right? 

Now you should be able to formally write, and 
then prove, the proposition on the table. Is 
it true that for any n, if n is a multiple of 
6 then it's a multiple of 3? 

What would it mean to be a multiple of 3? It
means there's some *other* number such that n
is that number times 3. The trick to this kind
of question is to figure out what that number
has to be. Also, be sure to use multiple_of in
formally stating the proposition to be proved.
-/

example : ∃ (x y : ℕ), multiple_of x y :=
begin
unfold multiple_of,
apply exists.intro 12,
apply exists.intro 6,
apply exists.intro 2,
exact rfl,
end 


/- #2C.

Is it true that if n is a multiple of h, and h
is a multiple of k, that n is a multiple of k? 
Formally state and then prove the proposition.

In writing this proof, you might need to use one
of the two axioms of equality, via the "rewrite" 
tactic (abbreviated rw) in Lean. Here's the idea.

If you've already proved/know, and so have in 
your context a proof of, an equality, such as 
pf : m = k, and if m appears in your goal, then
you can replace the m with k by using "rw pf",
and your goal will mean exactly the same thing.
The rewrite tactic uses the axiom that states
that you can replace equals by equals without
changing the truth values of propositions. 
-/

example (n h k : ℕ) : (n * h = h * k) :=
begin
ring_nf,
apply exists.intro 2,
apply exists.intro 3,
apply exists.intro 4,
exact rfl,
end



/- *** exists.elimination *** -/

/- #3A

Formally state and prove that if everyone 
who knows logic is cool and someone knows 
logic, then *someone is cool*. We set up 
everything you need to formally state this
conclusion (first hole/underscore). All 
you then have to do is to fill in is the
proof (second _).
-/

example 
  (Person : Type)
  (KnowsLogic : Person → Prop)
  (isCool : Person → Prop)
  (LogicMakesCool : ∀ (p), KnowsLogic p → isCool p)
  (SomeoneKnowsLogic : ∃ (p), KnowsLogic p) :
  (∃ (p : Person), isCool p) :=
begin
  cases SomeoneKnowsLogic with w xt,
  show ∃ (p : Person), isCool p,
  apply exists.intro w,
  apply LogicMakesCool w xt,
end


/- #3B

Formally state and prove the proposition that if
someone is not happy then not everyone is happy.
-/

example 
  (Person : Type)
  (Happy : Person → Prop) :
  (∃ (p), ¬(Happy p)) → 
  (¬ (∀ (p), Happy p))
  :=
begin
  --apply exists.intro,
  intros h,
  cases h with w wnh,
  assume ah,
  let wnh := ah w,
  contradiction,
end

/- #3C

Formally state and prove that  
"everyone is happy" is *equivalent*
(iff) to "no one is unhappy." 

Hint: In one direction, you might need 
to use classical reasoning; and remember
you can get a proposition (on which to do
classical case anaysis) by applying a
predicate to the right arguments. And
a final hint: Sometimes you have to use
information you have to prove something 
you don't yet have in order to make it
clear that there's a contradiction in
your set of assumptions. 
-/
example 
  (α : Type)
  (P : α → Prop) :
  (∀ (x), P x) ↔ 
  (¬ ∃ (x), ¬ P x) :=
begin
  apply iff.intro,
  assume h,
  assume nh,
  show false,
  cases nh with s snh,
  apply snh (h s),
  assume un,
  show ∀ (x : α), P x,
  assume y,
  cases (classical.em (P y)) with ph pnh,
  assumption,
  let nh := (exists.intro y pnh),
  contradiction,
end 



/- #3D

Formally state and prove the proposition
that if there doesn't exist an object of
some type T with some property, P, then
any object of that type has the property
¬P. Hint: We represent a "property" of 
objects of a certain type as a predicate
taking objects of that type.
-/
example 
  (T : Type)
  (P : T → Prop) :
  (¬∃ (t), P t) → 
  ∀ (t), ¬(P t) :=
begin
  intros h,
  assume t,
  assume pt,
  show false,
  let ex_x_Px := exists.intro t pt,
  contradiction,
end


/- #3E
Formally state and prove the proposition
that if there's an object with the property 
of having property P or property Q then 
there's an object with property P or there's 
an object with property with property Q.
-/

example 
  (α : Type)
  (P : α → Prop)
  (Q : α → Prop): 
  (∃ (y), (P y) ∨ (Q y)) →
  (∃ (y), P y) ∨ (∃ (y), Q y) :=
begin
  assume h,
  cases h with w pworqw,
  cases pworqw with pw qw,
  left,
  exact (exists.intro w pw),
  right,   
  exact (exists.intro w qw),
end

