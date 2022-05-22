open Ast

let op_choose (op_f, op_i) e1 e2 = match (e1, e2) with
| (Float f1, Float f2) -> Float (op_f f1 f2)
| (Int i1, Int i2) -> Int (op_i i1 i2)
|_ -> failwith "Unsupported operation!"

let mult e1 e2 = match (e1, e2) with
| (Float f1, Float f2) -> Float (f1 *. f2)
| (Int i1, Int i2) -> Int (i1 * i2)
| _ -> failwith "Unsupported operation!"

let op_eval op = match op with
| Add -> op_choose ((+.), (+)) 
| Sub -> op_choose ((-.), (-))
| Mult -> mult
| Div -> op_choose ((/.), (/))

let cast_highest e1 e2 = match (e1, e2) with
| ((Float _ as f), Int i) -> (f, Float (float_of_int i))
| (Int i, (Float _ as f)) -> (Float (float_of_int i), f)
| (Int _, Int _) as i -> i
| _ -> failwith "Can't cast: complex expression!"

let eval = let prim_eval = function
  | Op (op, e1, e2) -> let (e1', e2') = cast_highest e1 e2 in op_eval op e1' e2'
  | default -> default
in iter_expr prim_eval 
