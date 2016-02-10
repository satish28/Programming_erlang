-module(bin).
-export([test/0, reverse/1, term_to_packet/1, packet_to_term/1]).

reverse(Bin) ->
    reverse(Bin, <<>>).

reverse(<<Byte:8, X/binary>>, T) -> 
    reverse(X, <<Byte, T/binary>>);
    
reverse(<<>>, Bin) -> 
    Bin.


term_to_packet(Term) ->
    Data = term_to_binary(Term),
    Length = byte_size(Data),
    
    Binary = <<Length:4, Data/binary>>,
    Binary.

packet_to_term(Bin) ->
    <<_Len:4, Term/binary>> = Bin,
    binary_to_term(Term).


test() ->
    <<6, 5, 4, 3, 2, 1>> = reverse(<<1, 2, 3, 4, 5, 6>>),
    Term = [1, 2, 3, 4, 5, 6],
    <<168,54,176,0,96,16,32,48,64,80,6:4>> = term_to_packet(Term),
    Term = packet_to_term(<<168,54,176,0,96,16,32,48,64,80,6:4>>),
    tests_worked.
