%% Generated by the Erlang ASN.1 compiler version:4.0.2
%% Purpose: Erlang record definitions for each named and unnamed
%% SEQUENCE and SET, and macro definitions for each value
%% definition,in module SP



-ifndef(_SP_HRL_).
-define(_SP_HRL_, true).

-record('Packet',{
portsrc, portdst, sernum, confnum, length, res, flags, size, summ, prior, data}).

-record('Packet_flags',{
ax, bx, cx, dx}).

-record('Packet_data',{
name, fam, city, street}).

-endif. %% _SP_HRL_