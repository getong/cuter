%% -*- erlang-indent-level: 2 -*-
%%------------------------------------------------------------------------------

%%====================================================================
%% Types
%%====================================================================

-record(svs, {
  code    :: pid(),
  monitor :: pid()
}).

-type loaded_ret_atoms() :: cover_compiled | preloaded | non_existing.
-type logs() :: [{atom(), any()}].
-type servers() :: #svs{}.

%%====================================================================
%% Directories
%%====================================================================

-define(DATA_DIR(BaseDir, No), BaseDir ++ "/exec" ++ integer_to_list(No)).
-define(TRACE_DIR(BaseDir), BaseDir ++ "/traces").
-define(CORE_DIR(BaseDir), BaseDir ++ "/core").
-define(TMP_DIR, "temp").
-define(PYTHON_CALL, ?PYTHON_PATH ++ " -u " ++ ?PRIV ++ "/cuter_interface.py").

%%====================================================================
%% Prefixes
%%====================================================================

-define(DEPTH_PREFIX, '__conc_depth').
-define(EXECUTION_PREFIX, '__conc_prefix').
-define(SYMBOLIC_PREFIX, '__s').
-define(CONCOLIC_PREFIX_MSG, '__concm').
-define(ZIPPED_VALUE_PREFIX, '__czip').
-define(CONCOLIC_PREFIX_PDICT, '__concp').
-define(FUNCTION_PREFIX, '__cfunc').
-define(UNBOUND_VAR_PREFIX, '__uboundvar').

%%====================================================================
%% Flags
%%====================================================================

-define(LOGGING_FLAG, ok).
-define(DELETE_TRACE, ok).

%%====================================================================
%% Solver Responses
%%====================================================================

-define(RSP_MODEL_DELIMITER_START, <<"model_start">>).
-define(RSP_MODEL_DELIMITER_END, <<"model_end">>).

%%====================================================================
%% Various OpCodes
%%====================================================================

-define(JSON_TYPE_ANY, 0).
-define(JSON_TYPE_INT, 1).
-define(JSON_TYPE_FLOAT, 2).
-define(JSON_TYPE_ATOM, 3).
-define(JSON_TYPE_LIST, 4).
-define(JSON_TYPE_TUPLE, 5).
-define(JSON_TYPE_PID, 6).
-define(JSON_TYPE_REF, 7).

-define(JSON_CMD_LOAD_TRACE_FILE, 1).
-define(JSON_CMD_SOLVE, 2).
-define(JSON_CMD_GET_MODEL, 3).
-define(JSON_CMD_ADD_AXIOMS, 4).
-define(JSON_CMD_FIX_VARIABLE, 5).
-define(JSON_CMD_RESET_SOLVER, 6).
-define(JSON_CMD_STOP, 42).

-define(CONSTRAINT_TRUE, 1).
-define(CONSTRAINT_FALSE, 2).
-define(NOT_CONSTRAINT, 3).

-define(CONSTRAINT_TRUE_REPR, 84).   %% $T
-define(CONSTRAINT_FALSE_REPR, 70).  %% $F

-define(OP_PARAMS, 1).
-define(OP_SPEC, 2).
-define(OP_GUARD_TRUE, 3).
-define(OP_GUARD_FALSE, 4).
-define(OP_MATCH_EQUAL_TRUE, 5).
-define(OP_MATCH_EQUAL_FALSE, 6).
-define(OP_TUPLE_SZ, 7).
-define(OP_TUPLE_NOT_SZ, 8).
-define(OP_TUPLE_NOT_TPL, 9).
-define(OP_LIST_NON_EMPTY, 10).
-define(OP_LIST_EMPTY, 11).
-define(OP_LIST_NOT_LST, 12).
-define(OP_SPAWN, 13).
-define(OP_SPAWNED, 14).
-define(OP_MSG_SEND, 15).
-define(OP_MSG_RECEIVE, 16).
-define(OP_UNFOLD_TUPLE, 17).
-define(OP_UNFOLD_LIST, 18).
-define(OP_ERLANG_HD_1, 25).
-define(OP_ERLANG_TL_1, 26).
