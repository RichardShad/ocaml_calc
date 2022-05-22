
(* The type of tokens. *)

type token = 
  | STAR
  | SLASH
  | RPARAN
  | PLUS
  | MINUS
  | LPARAN
  | INT of (int)
  | FLOAT of (float)
  | EOF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr option)
