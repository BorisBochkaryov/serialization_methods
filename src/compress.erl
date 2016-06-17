-module(compress).
-author("borisbochkarev").
-behaviour(gen_server).
-include("../include/SP.hrl").
-include("../include/packet_pb.hrl").

%% API
-export([start_link/0,init/1, command/1, handle_call/3,
  handle_cast/2,handle_info/2,code_change/3,terminate/2]).

-record(packet_data, {name = <<"">>, fam = <<"">>, city = <<"">>, street = <<"">>}).
-record(packet_flags, {ax = <<"0">>, bx = <<"0">>, cx = <<"0">>, dx = <<"">>}).
-record(packet1, {portsrc = <<"0">>, portdst = <<"0">>, sernum = <<"0">>, confnum = <<"0">>, length = <<"0">>,
  res = <<"0">>, flags = #packet_flags{}, size = <<"0">>, summ = <<"0">>, prior = <<"0">>, data = #packet_data{}}).

start_link() ->
  gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init([]) ->
  process_flag(trap_exit, true),
  {ok, 0}.

command([Mode,Compress, Op]) ->
  gen_server:call(?MODULE, [Mode, Compress, Op]).

% обычный перевод в binary
handle_call([binary, Compress, Op], _From, _State) ->
  if
    Op == 1 -> % сериализация
      Time = erlang:system_time(),
      Res = term_to_binary(Compress),
      TimeRes = erlang:system_time() - Time,
      Size = size(Res),
      {reply, {Size, TimeRes, Res}, _State};
    Op == -1 -> % десериализация
      Time = erlang:system_time(),
      Term = binary_to_term(Compress),
      TimeRes = erlang:system_time() - Time,
      {reply, {TimeRes, Term}, _State}
  end;

% ASN.1
handle_call([asn1, Compress, Op], _From, _State) ->
  if
    Op == 1 -> % компрессия
      Time = erlang:system_time(),
      {ok, Res} = 'SP':encode('Packet',Compress),
      TimeRes = erlang:system_time() - Time,
      Size = size(Res),
      {reply, {Size, TimeRes, Res}, _State};
    Op == -1 -> % декомпрессия
      Time = erlang:system_time(),
      Res = 'SP':decode('Packet',Compress),
      TimeRes = erlang:system_time() - Time,
      {reply, {TimeRes, Res}, _State}
  end;

% zlib
handle_call([zlib, Compress, Op], _From, _State) ->
  if
    Op == 1 -> % компрессия
      Time = erlang:system_time(),
      Z = zlib:open(),
      ok = zlib:deflateInit(Z,best_compression,deflated,-15,9,default),
      Res = zlib:deflate(Z, term_to_binary(Compress),finish),
      ok = zlib:deflateEnd(Z),
      zlib:close(Z),
      TimeRes = erlang:system_time() - Time,
      Size = size(list_to_binary(Res)),
      {reply, {Size, TimeRes, Res}, _State};
    Op == -1 -> % декомпрессия
      Time = erlang:system_time(),
      Z = zlib:open(),
      zlib:inflateInit(Z, -15),
      Data = zlib:inflate(Z,list_to_binary(Compress)),
      zlib:inflateEnd(Z),
      zlib:close(Z),
      TimeRes = erlang:system_time() - Time,
      Res = binary_to_term(list_to_binary(Data)),
      {reply, {TimeRes, Res}, _State}
  end;

% Google Protocol Buffers
handle_call([gpb, Compress, Op], _From, _State) ->
  % protobuffs_compile:scan_file("../include/packet.proto"), % компиляция proto файла для Google Protocol Buffers
  if
    Op == 1 -> % сериализация
      Time = erlang:system_time(),
      Res = packet_pb:encode_packet(Compress),
      TimeRes = erlang:system_time() - Time,
      Size = size(list_to_binary(Res)),
      {reply, {Size, TimeRes, Res}, _State};
    Op == -1 -> % десериализация
      Time = erlang:system_time(),
      Res = packet_pb:decode_packet(list_to_binary(Compress)),
      TimeRes = erlang:system_time() - Time,
      {reply, {TimeRes, Res}, _State}
  end;

% MsgPack
handle_call([mp, Compress, Op], _From, _State) ->
  if
    Op == 1 -> % компрессия
      Time = erlang:system_time(),
      Res = msgpack:pack(term_to_binary(Compress)),
      TimeRes = erlang:system_time() - Time,
      Size = size(Res),
      {reply, {Size, TimeRes, Res}, _State};
    Op == -1 -> % декомпрессия
      Time = erlang:system_time(),
      {ok, Term} = msgpack:unpack(Compress),
      TimeRes = erlang:system_time() - Time,
      Res = binary_to_term(Term),
      {reply, {TimeRes, Res}, _State}
  end;

% тестовый объект
handle_call([create,[], []], _From, _State) ->
  Packet = #packet{portsrc = <<"2015">>, portdst = <<"2014">>, sernum = <<"0">>, confnum = <<"4785">>,
    length = <<"14578">>, res = <<"64">>, flags = #packet_flags{ax = <<"2">>, bx = <<"3">>, cx = <<"4">>, dx = <<"10">>},
    size = <<"748596">>, summ = <<"876">>, prior = <<"1">>, data = #packet_data{name = <<"Ivan">>, fam = <<"Ivanov">>,
      city = <<"Nsk">>, street = <<"Lenina">>}},
  {reply, Packet, _State}.

handle_cast(_,N) -> {noreply, N}.
handle_info(_,N) -> {noreply, N}.
terminate(_,_) -> ok.
code_change(_,N,_) -> {ok, N}.