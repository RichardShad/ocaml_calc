
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | STAR
    | SLASH
    | RPARAN
    | PLUS
    | MINUS
    | LPARAN
    | INT of (
# 13 "bin/parser.mly"
       (int)
# 21 "bin/parser.ml"
  )
    | FLOAT of (
# 14 "bin/parser.mly"
       (float)
# 26 "bin/parser.ml"
  )
    | EOF
  
end

include MenhirBasics

# 1 "bin/parser.mly"
  
    open Ast

# 38 "bin/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_prog) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState01 : (('s, _menhir_box_prog) _menhir_cell1_LPARAN, _menhir_box_prog) _menhir_state
    (** State 01.
        Stack shape : LPARAN.
        Start symbol: prog. *)

  | MenhirState04 : (('s, _menhir_box_prog) _menhir_cell1_subexpr, _menhir_box_prog) _menhir_state
    (** State 04.
        Stack shape : subexpr.
        Start symbol: prog. *)

  | MenhirState06 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 06.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState09 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 09.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState11 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 11.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState13 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 13.
        Stack shape : expr.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Ast.expr)

and ('s, 'r) _menhir_cell1_subexpr = 
  | MenhirCell1_subexpr of 's * ('s, 'r) _menhir_state * (Ast.expr)

and ('s, 'r) _menhir_cell1_LPARAN = 
  | MenhirCell1_LPARAN of 's * ('s, 'r) _menhir_state

and _menhir_box_prog = 
  | MenhirBox_prog of (Ast.expr option) [@@unboxed]

let _menhir_action_01 =
  fun e1 e2 ->
    (
# 45 "bin/parser.mly"
        ( raise (SyntaxError (Printf.sprintf "Expected operation between %s and %s!" (string_of_expr e1) (string_of_expr e2))) )
# 94 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_02 =
  fun i ->
    (
# 30 "bin/parser.mly"
               ( Int i )
# 102 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_03 =
  fun f ->
    (
# 31 "bin/parser.mly"
                 ( Float f )
# 110 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_04 =
  fun _1 e1 e2 ->
    let op = 
# 48 "bin/parser.mly"
            ( Add )
# 118 "bin/parser.ml"
     in
    (
# 35 "bin/parser.mly"
                                            ( Op (op, e1, e2) )
# 123 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_05 =
  fun _1 e1 e2 ->
    let op = 
# 49 "bin/parser.mly"
             ( Sub )
# 131 "bin/parser.ml"
     in
    (
# 35 "bin/parser.mly"
                                            ( Op (op, e1, e2) )
# 136 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_06 =
  fun _1 e1 e2 ->
    let op = 
# 50 "bin/parser.mly"
            ( Mult )
# 144 "bin/parser.ml"
     in
    (
# 35 "bin/parser.mly"
                                            ( Op (op, e1, e2) )
# 149 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_07 =
  fun _1 e1 e2 ->
    let op = 
# 51 "bin/parser.mly"
             ( Div )
# 157 "bin/parser.ml"
     in
    (
# 35 "bin/parser.mly"
                                            ( Op (op, e1, e2) )
# 162 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_08 =
  fun _1 _3 e ->
    (
# 36 "bin/parser.mly"
                                ( e )
# 170 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_09 =
  fun _1 ->
    (_1 : (Ast.expr))

let _menhir_action_10 =
  fun _1 ->
    (
# 26 "bin/parser.mly"
                ( Some _1 )
# 182 "bin/parser.ml"
     : (Ast.expr option))

let _menhir_action_11 =
  fun () ->
    (
# 27 "bin/parser.mly"
          ( None )
# 190 "bin/parser.ml"
     : (Ast.expr option))

let _menhir_action_12 =
  fun i ->
    (
# 30 "bin/parser.mly"
               ( Int i )
# 198 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_13 =
  fun f ->
    (
# 31 "bin/parser.mly"
                 ( Float f )
# 206 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_14 =
  fun _1 _3 e ->
    (
# 41 "bin/parser.mly"
                                ( e )
# 214 "bin/parser.ml"
     : (Ast.expr))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | EOF ->
        "EOF"
    | FLOAT _ ->
        "FLOAT"
    | INT _ ->
        "INT"
    | LPARAN ->
        "LPARAN"
    | MINUS ->
        "MINUS"
    | PLUS ->
        "PLUS"
    | RPARAN ->
        "RPARAN"
    | SLASH ->
        "SLASH"
    | STAR ->
        "STAR"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPARAN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPARAN ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | INT _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01
      | FLOAT _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | EOF | MINUS | PLUS | RPARAN | SLASH | STAR ->
          let i = _v in
          let _v = _menhir_action_02 i in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | FLOAT _ | INT _ | LPARAN ->
          let i = _v in
          let _v = _menhir_action_12 i in
          _menhir_goto_subexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState13 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState11 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState06 ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState04 ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_19 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STAR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SLASH ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF ->
          let _1 = _v in
          let _v = _menhir_action_10 _1 in
          MenhirBox_prog _v
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPARAN ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | INT _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06
      | FLOAT _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | EOF | MINUS | PLUS | RPARAN | SLASH | STAR ->
          let f = _v in
          let _v = _menhir_action_03 f in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | FLOAT _ | INT _ | LPARAN ->
          let f = _v in
          let _v = _menhir_action_13 f in
          _menhir_goto_subexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_subexpr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_subexpr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LPARAN ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | INT _v_0 ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState04
      | FLOAT _v_1 ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState04
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_09 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPARAN ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | INT _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09
      | FLOAT _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPARAN ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | INT _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState11
      | FLOAT _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState11
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPARAN ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | INT _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13
      | FLOAT _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LPARAN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STAR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SLASH ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPARAN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EOF | MINUS | PLUS | RPARAN | SLASH | STAR ->
              let MenhirCell1_LPARAN (_menhir_stack, _menhir_s) = _menhir_stack in
              let (_1, _3, e) = ((), (), _v) in
              let _v = _menhir_action_08 _1 _3 e in
              _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | FLOAT _ | INT _ | LPARAN ->
              let MenhirCell1_LPARAN (_menhir_stack, _menhir_s) = _menhir_stack in
              let (_1, _3, e) = ((), (), _v) in
              let _v = _menhir_action_14 _1 _3 e in
              _menhir_goto_subexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok)
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STAR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SLASH ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF | MINUS | PLUS | RPARAN ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let (_1, e2) = ((), _v) in
          let _v = _menhir_action_05 _1 e1 e2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_12 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STAR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SLASH ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF | MINUS | PLUS | RPARAN ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let (_1, e2) = ((), _v) in
          let _v = _menhir_action_04 _1 e1 e2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_10 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
      let (_1, e2) = ((), _v) in
      let _v = _menhir_action_07 _1 e1 e2 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_07 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
      let (_1, e2) = ((), _v) in
      let _v = _menhir_action_06 _1 e1 e2 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_05 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_subexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STAR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SLASH ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF | RPARAN ->
          let MenhirCell1_subexpr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_01 e1 e2 in
          let _1 = _v in
          let _v = _menhir_action_09 _1 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPARAN ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | INT _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | FLOAT _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | EOF ->
          let _v = _menhir_action_11 () in
          MenhirBox_prog _v
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v