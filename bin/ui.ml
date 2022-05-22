open Eval
open Ast

let (@) f g x = f @@ g x

let parse s = 
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast

let syntax_error_handler f = try f () with SyntaxError msg -> print_endline msg

let prompt () = print_string "> "; read_line () 

let rep () = prompt () |> parse |> Option.map (string_of_expr @ eval) |> Option.value ~default:"" |> print_endline 

let rec loop () : unit = syntax_error_handler rep |> loop
