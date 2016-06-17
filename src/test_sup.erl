-module(test_sup).
-behaviour(supervisor).

%% API
-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    {ok, {{one_for_one, 1, 10},
        [{tag1,
            {compress, start_link, []},
            permanent,
            10000,
            worker,
            [compress]
        }]
    }}.

