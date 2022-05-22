exception SyntaxError of string

type binop =
  | Add
  | Sub
  | Mult
  | Div

type expr =
  | Int of int
  | Float of float
  | Op of binop * expr * expr

let iter_expr f = let rec aux = function
| Op (op, e1, e2) -> f @@ Op (op, aux e1, aux e2)
| d -> f d
in aux

let rec string_of_expr = function
| Op (op, e1, e2) -> string_of_expr e1 ^ (match op with |Add -> " + " |Sub -> " - " |Mult -> " * " |Div -> " / ") ^ string_of_expr e2
| Int i -> string_of_int i
| Float f -> string_of_float f
