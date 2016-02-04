%% Programming Erlang Chapter 4 exercise
%% a. Find if the given no is odd or even
%% b. Write your own filter function which takes a function and list and returns a filtered list
%% c. Write a split function to filter an array of numbers into odd or even using 1.Filter function & 2.Accumulators

-module(math_functions).
-export([even/1, odd/1, filter/2,split/1, split1/1]).

%check if the given no is even
even(X) when X rem 2 =:= 0 -> true;
even(X) -> false.
    
%check if the given no is odd
odd(X) when X rem 2 =/= 0 -> true;
odd(X) -> false.

%filter a list based on the value of output F
filter(F, L) ->
    [X || X <-L, F(X)].

%split a list using the above filter function
split(L) ->
    Odd = filter(fun odd/1, L),
    Even = filter(fun even/1, L),
    {Odd, Even}.

%split a list using accumulators
split1(L) ->
    Odd = [X || X <- L, X rem 2 =/= 0],
    Even = [X || X <- L, X rem 2 =:= 0],
    {Odd, Even}.
