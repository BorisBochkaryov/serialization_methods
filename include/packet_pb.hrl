-ifndef(PACKET_PB_H).
-define(PACKET_PB_H, true).
-record(packet, {
    portsrc,
    portdst,
    sernum,
    confnum,
    length,
    res,
    flags,
    size,
    summ,
    prior,
    data
}).
-endif.

-ifndef(PACKET_DATA_PB_H).
-define(PACKET_DATA_PB_H, true).
-record(packet_data, {
    name,
    fam,
    city,
    street
}).
-endif.

-ifndef(PACKET_FLAGS_PB_H).
-define(PACKET_FLAGS_PB_H, true).
-record(packet_flags, {
    ax,
    bx,
    cx,
    dx
}).
-endif.

