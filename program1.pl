/*This is a comment*/

/*Below are facts, guaranteed things to be true and queried upon.*/
loves(romeo, juliet).

/*Juliet loves romeo given that romeo loves juliet -> T*/
loves(juliet, romeo) :- loves(romeo, juliet).

male(albert).
male(bob).
male(bill).
male(charles).
male(dan).
male(joshua).

female(alice).
female(allison).
female(betsy).
female(cynthia).
female(diana).
female(lisa).

happy(albert).
happy(alice).

with_albert(alice).

near_water(bob).

not_full(jim).

/*Rules, given that one thing is true, that fact will be true*/
runs(albert) :- happy(albert).

dances(alice) :- happy(alice), with_albert(alice), runs(albert).

/* We can define predicates to take the values of certain facts
 * If alice dances, this variable will write the text below to the
 * console.
 */
does_alice_dance :- dances(alice),
  write('When Alice is happy and with Albert and Albert is running, she dances!').

swims(bob) :- happy(bob).
swims(bob) :- not_full(bob).

/* Defines a few family relation facts */
parent(albert, dan).
parent(albert, charles).
parent(albert, bob).
parent(lisa, charles).
parent(lisa, dan).
parent(lisa, bob).
parent(diana, jim).
parent(diana, betsy).
parent(charles, jim).
parent(charles, betsy).
parent(charles, allison).

siblings(betsy, jim) :- parent(charles, jim), parent(charles, betsy).

/* Will print out betsy and jim because they are defined as his grandchildren above */
get_grandchild :-
  parent(albert, X),
  parent(X, Y),
  write('Alberts grandchild is '), write(Y), nl.

/* Uses format to print out the string
 * where ~w transposes a variable X
 * ~s transposes a string s
 * ~n creates a newline (comparable to \n).
 */
get_grandparent :-
  parent(X, jim),
  parent(X, betsy),
  format('~w ~s grandparent ~n', [X, "is the"]).

/* Returns the grandparents Y of variable X
 * defined by some Z being the parent of X,
 * and that Z having some parent(s) Y
 */
grand_parent(X, Y) :-
  parent(Z, X),
  parent(Y, Z).

/* Anything defined on the right that is true
 * sets the left side to be true
 *
 * As such, any X that is a human will blush.
 */
blushes(X) :- human(X).
human(joshua).

/* Dan will shoot betsy with a big gun.
 * Henceforth, Joshua will hate whichever X
 * shot betsy. In this case, it will be Dan.
 */
shoots(dan, betsy, biggun).
hates(joshua, X) :- shoots(X, betsy, biggun).

/* To check the existance of a predicate within
 * the terminal, type predicate(_).
 * This is using anonymous variables.
 */

/* We can somewhat define conditions as follows:
 *
 * The keyword 'is' acts as the assignment operator.
 */

what_grade(5) :-
  write('Go to kindergarden').

what_grade(6) :-
  write('Go to first grade').

what_grade(Other):-
  Grade is Other - 5,
  format('Go to grade ~w', [Grade]).
