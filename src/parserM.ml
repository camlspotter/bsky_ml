type state = string * int

type 'a t = state -> ('a * state, string * state) result

let bind (at : 'a t) (f : 'a -> 'b t) : 'b t =
  fun state ->
  match at state with
  | Error _ as e -> e
  | Ok (a, state) -> f a state

let map (f : 'a -> 'b) (at : 'a t) : 'b t =
  fun state ->
  match at state with
  | Error _ as e -> e
  | Ok (a, state) -> Ok (f a, state)

module Syntax = struct
  let (let*) = bind
  let (let+) x f = map f x
end

let state : state t = fun state -> Ok (state, state)

let current_pos : int t = fun ((_,pos) as state) -> Ok (pos, state)

let fail s : 'a t = fun state -> Error (s, state)

let return : 'a -> 'a t = fun a state -> Ok (a, state)

let get_string len : string t = fun ((s, pos) as state) ->
  if pos + len > String.length s then Error ("get_string overrun", state)
  else Ok (String.sub s pos len, (s, pos + len))

let list (f : 'a option t) : 'a list t =
  let open Syntax in
  let rec loop acc =
    let* a = f in
    match a with
    | None -> return @@ List.rev acc
    | Some a -> loop (a::acc)
  in
  loop []

let eos : bool t =
  let open Syntax in
  let+ (s, pos) = state in
  String.length s = pos

let (<|>) a b = fun state ->
  match a state with
  | Error _ -> b state
  | Ok _ as res -> res
