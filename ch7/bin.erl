-module(bin).
-export([test/0, reverse/1, term_to_packet/1, packet_to_term/1, reverse_binary/1]).

%% Take a binary and reverse it
reverse(Bin) ->
    reverse(Bin, <<>>).

reverse(<<Byte:8, X/binary>>, T) -> 
    reverse(X, <<Byte, T/binary>>);
    
reverse(<<>>, Bin) -> 
    Bin.

%%Take a term and turn into packet
term_to_packet(Term) ->
    Data = term_to_binary(Term),
    Length = byte_size(Data),

    Binary = <<Length:4, Data/binary>>,
    Binary.

%%Take a packet and turn it back into terms
packet_to_term(Bin) ->
    <<_Len:4, Term/binary>> = Bin,
    binary_to_term(Term).

reverse_binary(Term) ->
    rev_bits(term_to_binary(Term), <<>>).

rev_bits(<<>>, Bits_rev) ->
    Bits_rev;
rev_bits(<<Head:1/binary, Tail/binary>>, Bits_rev) ->
    rev_bits(Tail, <<Head/binary, Bits_rev/binary>>).

test() ->
    <<6, 5, 4, 3, 2, 1>> = reverse(<<1, 2, 3, 4, 5, 6>>),
    Term = [1, 2, 3, 4, 5, 6],
    <<168,54,176,0,96,16,32,48,64,80,6:4>> = term_to_packet(Term),
    Term = packet_to_term(<<168,54,176,0,96,16,32,48,64,80,6:4>>),
    <<3,2,1,3,0,107,131>> = reverse_binary([1,2,3]),
    tests_worked.
