{
    open Parser
    open Big_int_Z
}

let white = [' ' '\t']
let digit = ['0'-'9']
let int = '-'? digit+
let float = int '.' digit+

rule read = 
    parse 
    | white { read lexbuf }
    | int as i { INT (big_int_of_string i) }
    | float as f { FLOAT (float_of_string f) }
    | "(" { LPARAN }
    | ")" { RPARAN }
    | "+" { PLUS }
    | "*" { STAR }
    | "-" { MINUS }
    | "/" { SLASH }
    | eof { EOF }
