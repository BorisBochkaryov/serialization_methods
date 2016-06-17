%% Generated by the Erlang ASN.1 BER_V2-compiler version, utilizing bit-syntax:4.0.2
%% Purpose: encoder and decoder to the types in mod SP

-module('SP').
-compile(nowarn_unused_vars).
-dialyzer(no_improper_lists).
-include("SP.hrl").
-asn1_info([{vsn,'4.0.2'},
            {module,'SP'},
            {options,[warnings,ber,errors,
 {cwd,"/home/borisbochkarev/test/first/src"},
 {outdir,"/home/borisbochkarev/test/first/src"},
 {i,"."},
 {i,"/home/borisbochkarev/test/first/src"}]}]).

-export([encoding_rule/0,bit_string_format/0,
         legacy_erlang_types/0]).
-export(['dialyzer-suppressions'/1]).
-export([
'enc_Packet'/2
]).

-export([
'dec_Packet'/2
]).

-export([info/0]).


-export([encode/2,decode/2]).

encoding_rule() -> ber.

bit_string_format() -> bitstring.

legacy_erlang_types() -> false.

encode(Type, Data) ->
try iolist_to_binary(element(1, encode_disp(Type, Data))) of
  Bytes ->
    {ok,Bytes}
  catch
    Class:Exception when Class =:= error; Class =:= exit ->
      case Exception of
        {error,Reason}=Error ->
          Error;
        Reason ->
         {error,{asn1,Reason}}
      end
end.

decode(Type,Data) ->
try decode_disp(Type, element(1, ber_decode_nif(Data))) of
  Result ->
    {ok,Result}
  catch
    Class:Exception when Class =:= error; Class =:= exit ->
      case Exception of
        {error,Reason}=Error ->
          Error;
        Reason ->
         {error,{asn1,Reason}}
      end
end.

encode_disp('Packet',Data) -> 'enc_Packet'(Data);
encode_disp(Type,_Data) -> exit({error,{asn1,{undefined_type,Type}}}).


decode_disp('Packet',Data) -> 'dec_Packet'(Data);
decode_disp(Type,_Data) -> exit({error,{asn1,{undefined_type,Type}}}).




info() ->
   case ?MODULE:module_info(attributes) of
     Attributes when is_list(Attributes) ->
       case lists:keyfind(asn1_info, 1, Attributes) of
         {_,Info} when is_list(Info) ->
           Info;
         _ ->
           []
       end;
     _ ->
       []
   end.


%%================================
%%  Packet
%%================================
'enc_Packet'(Val) ->
    'enc_Packet'(Val, [<<48>>]).

'enc_Packet'(Val, TagIn) ->
{_,Cindex1, Cindex2, Cindex3, Cindex4, Cindex5, Cindex6, Cindex7, Cindex8, Cindex9, Cindex10, Cindex11} = Val,

%%-------------------------------------------------
%% attribute portsrc(1) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes1,EncLen1} = encode_restricted_string(Cindex1, [<<128>>]),

%%-------------------------------------------------
%% attribute portdst(2) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes2,EncLen2} = encode_restricted_string(Cindex2, [<<129>>]),

%%-------------------------------------------------
%% attribute sernum(3) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes3,EncLen3} = encode_restricted_string(Cindex3, [<<130>>]),

%%-------------------------------------------------
%% attribute confnum(4) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes4,EncLen4} = encode_restricted_string(Cindex4, [<<131>>]),

%%-------------------------------------------------
%% attribute length(5) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes5,EncLen5} = encode_restricted_string(Cindex5, [<<132>>]),

%%-------------------------------------------------
%% attribute res(6) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes6,EncLen6} = encode_restricted_string(Cindex6, [<<133>>]),

%%-------------------------------------------------
%% attribute flags(7) with type SEQUENCE
%%-------------------------------------------------
   {EncBytes7,EncLen7} = 'enc_Packet_flags'(Cindex7, [<<166>>]),

%%-------------------------------------------------
%% attribute size(8) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes8,EncLen8} = encode_restricted_string(Cindex8, [<<135>>]),

%%-------------------------------------------------
%% attribute summ(9) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes9,EncLen9} = encode_restricted_string(Cindex9, [<<136>>]),

%%-------------------------------------------------
%% attribute prior(10) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes10,EncLen10} = encode_restricted_string(Cindex10, [<<137>>]),

%%-------------------------------------------------
%% attribute data(11) with type SEQUENCE
%%-------------------------------------------------
   {EncBytes11,EncLen11} = 'enc_Packet_data'(Cindex11, [<<170>>]),

   BytesSoFar = [EncBytes1, EncBytes2, EncBytes3, EncBytes4, EncBytes5, EncBytes6, EncBytes7, EncBytes8, EncBytes9, EncBytes10, EncBytes11],
LenSoFar = EncLen1 + EncLen2 + EncLen3 + EncLen4 + EncLen5 + EncLen6 + EncLen7 + EncLen8 + EncLen9 + EncLen10 + EncLen11,
encode_tags(TagIn, BytesSoFar, LenSoFar).



%%================================
%%  Packet_flags
%%================================
'enc_Packet_flags'(Val, TagIn) ->
   {_,Cindex1, Cindex2, Cindex3, Cindex4} = Val,

%%-------------------------------------------------
%% attribute ax(1) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes1,EncLen1} = encode_restricted_string(Cindex1, [<<128>>]),

%%-------------------------------------------------
%% attribute bx(2) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes2,EncLen2} = encode_restricted_string(Cindex2, [<<129>>]),

%%-------------------------------------------------
%% attribute cx(3) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes3,EncLen3} = encode_restricted_string(Cindex3, [<<130>>]),

%%-------------------------------------------------
%% attribute dx(4) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes4,EncLen4} = encode_restricted_string(Cindex4, [<<131>>]),

   BytesSoFar = [EncBytes1, EncBytes2, EncBytes3, EncBytes4],
LenSoFar = EncLen1 + EncLen2 + EncLen3 + EncLen4,
encode_tags(TagIn, BytesSoFar, LenSoFar).



%%================================
%%  Packet_data
%%================================
'enc_Packet_data'(Val, TagIn) ->
   {_,Cindex1, Cindex2, Cindex3, Cindex4} = Val,

%%-------------------------------------------------
%% attribute name(1) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes1,EncLen1} = encode_restricted_string(Cindex1, [<<128>>]),

%%-------------------------------------------------
%% attribute fam(2) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes2,EncLen2} = encode_restricted_string(Cindex2, [<<129>>]),

%%-------------------------------------------------
%% attribute city(3) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes3,EncLen3} = encode_restricted_string(Cindex3, [<<130>>]),

%%-------------------------------------------------
%% attribute street(4) with type OCTET STRING
%%-------------------------------------------------
   {EncBytes4,EncLen4} = encode_restricted_string(Cindex4, [<<131>>]),

   BytesSoFar = [EncBytes1, EncBytes2, EncBytes3, EncBytes4],
LenSoFar = EncLen1 + EncLen2 + EncLen3 + EncLen4,
encode_tags(TagIn, BytesSoFar, LenSoFar).


'dec_Packet'(Tlv) ->
   'dec_Packet'(Tlv, [16]).

'dec_Packet'(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),

%%-------------------------------------------------
%% attribute portsrc(1) with type OCTET STRING
%%-------------------------------------------------
[V1|Tlv2] = Tlv1, 
Term1 = decode_octet_string(V1, [131072]),

%%-------------------------------------------------
%% attribute portdst(2) with type OCTET STRING
%%-------------------------------------------------
[V2|Tlv3] = Tlv2, 
Term2 = decode_octet_string(V2, [131073]),

%%-------------------------------------------------
%% attribute sernum(3) with type OCTET STRING
%%-------------------------------------------------
[V3|Tlv4] = Tlv3, 
Term3 = decode_octet_string(V3, [131074]),

%%-------------------------------------------------
%% attribute confnum(4) with type OCTET STRING
%%-------------------------------------------------
[V4|Tlv5] = Tlv4, 
Term4 = decode_octet_string(V4, [131075]),

%%-------------------------------------------------
%% attribute length(5) with type OCTET STRING
%%-------------------------------------------------
[V5|Tlv6] = Tlv5, 
Term5 = decode_octet_string(V5, [131076]),

%%-------------------------------------------------
%% attribute res(6) with type OCTET STRING
%%-------------------------------------------------
[V6|Tlv7] = Tlv6, 
Term6 = decode_octet_string(V6, [131077]),

%%-------------------------------------------------
%% attribute flags(7) with type SEQUENCE
%%-------------------------------------------------
[V7|Tlv8] = Tlv7, 
Term7 = 'dec_Packet_flags'(V7, [131078]),

%%-------------------------------------------------
%% attribute size(8) with type OCTET STRING
%%-------------------------------------------------
[V8|Tlv9] = Tlv8, 
Term8 = decode_octet_string(V8, [131079]),

%%-------------------------------------------------
%% attribute summ(9) with type OCTET STRING
%%-------------------------------------------------
[V9|Tlv10] = Tlv9, 
Term9 = decode_octet_string(V9, [131080]),

%%-------------------------------------------------
%% attribute prior(10) with type OCTET STRING
%%-------------------------------------------------
[V10|Tlv11] = Tlv10, 
Term10 = decode_octet_string(V10, [131081]),

%%-------------------------------------------------
%% attribute data(11) with type SEQUENCE
%%-------------------------------------------------
[V11|Tlv12] = Tlv11, 
Term11 = 'dec_Packet_data'(V11, [131082]),

case Tlv12 of
[] -> true;_ -> exit({error,{asn1, {unexpected,Tlv12}}}) % extra fields not allowed
end,
   {'Packet', Term1, Term2, Term3, Term4, Term5, Term6, Term7, Term8, Term9, Term10, Term11}.

'dec_Packet_flags'(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),

%%-------------------------------------------------
%% attribute ax(1) with type OCTET STRING
%%-------------------------------------------------
[V1|Tlv2] = Tlv1, 
Term1 = decode_octet_string(V1, [131072]),

%%-------------------------------------------------
%% attribute bx(2) with type OCTET STRING
%%-------------------------------------------------
[V2|Tlv3] = Tlv2, 
Term2 = decode_octet_string(V2, [131073]),

%%-------------------------------------------------
%% attribute cx(3) with type OCTET STRING
%%-------------------------------------------------
[V3|Tlv4] = Tlv3, 
Term3 = decode_octet_string(V3, [131074]),

%%-------------------------------------------------
%% attribute dx(4) with type OCTET STRING
%%-------------------------------------------------
[V4|Tlv5] = Tlv4, 
Term4 = decode_octet_string(V4, [131075]),

case Tlv5 of
[] -> true;_ -> exit({error,{asn1, {unexpected,Tlv5}}}) % extra fields not allowed
end,
   {'Packet_flags', Term1, Term2, Term3, Term4}.

'dec_Packet_data'(Tlv, TagIn) ->
   %%-------------------------------------------------
   %% decode tag and length 
   %%-------------------------------------------------
Tlv1 = match_tags(Tlv, TagIn),

%%-------------------------------------------------
%% attribute name(1) with type OCTET STRING
%%-------------------------------------------------
[V1|Tlv2] = Tlv1, 
Term1 = decode_octet_string(V1, [131072]),

%%-------------------------------------------------
%% attribute fam(2) with type OCTET STRING
%%-------------------------------------------------
[V2|Tlv3] = Tlv2, 
Term2 = decode_octet_string(V2, [131073]),

%%-------------------------------------------------
%% attribute city(3) with type OCTET STRING
%%-------------------------------------------------
[V3|Tlv4] = Tlv3, 
Term3 = decode_octet_string(V3, [131074]),

%%-------------------------------------------------
%% attribute street(4) with type OCTET STRING
%%-------------------------------------------------
[V4|Tlv5] = Tlv4, 
Term4 = decode_octet_string(V4, [131075]),

case Tlv5 of
[] -> true;_ -> exit({error,{asn1, {unexpected,Tlv5}}}) % extra fields not allowed
end,
   {'Packet_data', Term1, Term2, Term3, Term4}.


%%%
%%% Run-time functions.
%%%

'dialyzer-suppressions'(Arg) ->
    ok.

ber_decode_nif(B) ->
    asn1rt_nif:decode_ber_tlv(B).

collect_parts(TlvList) ->
    collect_parts(TlvList, []).

collect_parts([{_,L}|Rest], Acc) when is_list(L) ->
    collect_parts(Rest, [collect_parts(L)|Acc]);
collect_parts([{3,<<Unused,Bits/binary>>}|Rest], _Acc) ->
    collect_parts_bit(Rest, [Bits], Unused);
collect_parts([{_T,V}|Rest], Acc) ->
    collect_parts(Rest, [V|Acc]);
collect_parts([], Acc) ->
    list_to_binary(lists:reverse(Acc)).

collect_parts_bit([{3,<<Unused,Bits/binary>>}|Rest], Acc, Uacc) ->
    collect_parts_bit(Rest, [Bits|Acc], Unused + Uacc);
collect_parts_bit([], Acc, Uacc) ->
    list_to_binary([Uacc|lists:reverse(Acc)]).

decode_octet_string(Tlv, TagsIn) ->
    Bin = match_and_collect(Tlv, TagsIn),
    binary:copy(Bin).

encode_length(L) when L =< 127 ->
    {[L],1};
encode_length(L) ->
    Oct = minimum_octets(L),
    Len = length(Oct),
    if
        Len =< 126 ->
            {[128 bor Len|Oct],Len + 1};
        true ->
            exit({error,{asn1,too_long_length_oct,Len}})
    end.

encode_restricted_string(OctetList, TagIn) when is_binary(OctetList) ->
    encode_tags(TagIn, OctetList, byte_size(OctetList));
encode_restricted_string(OctetList, TagIn) when is_list(OctetList) ->
    encode_tags(TagIn, OctetList, length(OctetList)).

encode_tags([Tag|Trest], BytesSoFar, LenSoFar) ->
    {Bytes2,L2} = encode_length(LenSoFar),
    encode_tags(Trest,
                [Tag,Bytes2|BytesSoFar],
                LenSoFar + byte_size(Tag) + L2);
encode_tags([], BytesSoFar, LenSoFar) ->
    {BytesSoFar,LenSoFar}.

match_and_collect(Tlv, TagsIn) ->
    Val = match_tags(Tlv, TagsIn),
    case Val of
        [_|_] = PartList ->
            collect_parts(PartList);
        Bin when is_binary(Bin) ->
            Bin
    end.

match_tags({T,V}, [T]) ->
    V;
match_tags({T,V}, [T|Tt]) ->
    match_tags(V, Tt);
match_tags([{T,V}], [T|Tt]) ->
    match_tags(V, Tt);
match_tags([{T,_V}|_] = Vlist, [T]) ->
    Vlist;
match_tags(Tlv, []) ->
    Tlv;
match_tags({Tag,_V} = Tlv, [T|_Tt]) ->
    exit({error,{asn1,{wrong_tag,{{expected,T},{got,Tag,Tlv}}}}}).

minimum_octets(0, Acc) ->
    Acc;
minimum_octets(Val, Acc) ->
    minimum_octets(Val bsr 8, [Val band 255|Acc]).

minimum_octets(Val) ->
    minimum_octets(Val, []).
