%%Chapter 4 Exercies
%% a. Find the area of a circle
%% b. Find the area of a triangle
%% c. Find the preimiter of a square
%% d. Write your own function to convert a tuple into list
%% e. Write a function to take a function as input and calculate the time elapsed
%% f. Write a function to print the current date in a readable format

-module(exercise).
-export([circle/1, triangle/2, perimeter_square/1, mytuple_to_list/1, my_time_func/1, my_date/0]).

%Area of circle
circle(Radius) ->
    Area = 3.14 * Radius * Radius,
    io:format("The area of the circle is ~p~n", [Area]).

%Area of a triangle
triangle(Base, Height) ->
    Area = 1/2 * Base * Height,
    io:format("The are of the triangle is ~p~n", [Area]).

%Perimeter of a square
perimeter_square(Side) ->
    Perimeter = 4 * Side,
    io:format("The perimieter of a square is ~p~n", [Perimeter]).

%Convert a tuple to a list
mytuple_to_list(0, _, L) ->
    L;
mytuple_to_list(N, T, L) ->
    mytuple_to_list(N-1, T, [element(N, T) | L]).
    
mytuple_to_list(T) ->
    mytuple_to_list(tuple_size(T), T, []).

%my_time_func
my_time_func(F) ->
    {_, Start_sec, _} = now(),
    fun() -> F() end,
    {_, Stop_sec, _} = now(),
    io:format("Time elapsed for the function is ~p ~n", [Stop_sec - Start_sec]).

%% Print data in a neat format
my_date() ->
    {Year, Month, Date} = date(),
    Date1 = integer_to_list(Date),
    Month1 = integer_to_list(Month),
    Year1 = integer_to_list(Year),
    Date_Month = string:concat(Date1, "/"),
    Date_Month1 = string:concat(Date_Month, Month1),
    Date_Year = string:concat(Date_Month1, "/"),
    Date_year = string:concat(Date_Year, Year1),
    io:format("Today's Date is ~p~n", [Date_year]).
    
