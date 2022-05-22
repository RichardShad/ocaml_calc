%{
    open Ast
%}

%token LPARAN
%token RPARAN

%token PLUS
%token STAR
%token MINUS
%token SLASH

%token <int> INT
%token <float> FLOAT

%token EOF

%left PLUS MINUS
%left STAR SLASH

%start <expr option> prog

%%

prog: 
    | expr; EOF { Some $1 }
    | EOF { None }

let terminal ==
    | i = INT; { Int i }
    | f = FLOAT; { Float f }

let expr :=
    | terminal
    | e1 = expr; op = operation; e2 = expr; { Op (op, e1, e2) }
    | LPARAN; e = expr; RPARAN; { e }
    | err

let subexpr :=
    | terminal
    | LPARAN; e = expr; RPARAN; { e }

let err :=
    | e1 = subexpr; e2 = expr;
        { raise (SyntaxError (Printf.sprintf "Expected operation between %s and %s!" (string_of_expr e1) (string_of_expr e2))) }

let operation ==
    | PLUS; { Add }
    | MINUS; { Sub }
    | STAR; { Mult }
    | SLASH; { Div }
