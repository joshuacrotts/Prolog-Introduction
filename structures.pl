has(albert, olive).

/* Albert owns a pet cat named olive) */
owns(albert, pet(cat, olive)).

customer(tom, smith, 20.55).
customer(sally, smith, 120.55).

get_customer_balance(FName, LName) :-
  customer(FName, LName, Bal),
  format('~w ~w has $~2f ~n', [FName, LName, Bal]).

/* Define certain relationships as follows: */
vertical(line(point(X, Y), point(X, Y2))).
horizontal(line(point(X, Y), point(X2, Y))).
