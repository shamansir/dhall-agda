

-- ∀, λ

let MaybeT : Kind =
    < SomeT : Type
    | NoneT
    >

let MergeRec : Kind = { a : Type, b : Type, m : MaybeT }
let Universe_ : Kind =
    < U0 : Type
    | U1 : Type
    | U2 : Type
    | U3 : Type
    | U4 : Type
    | U5 : Type
    | Merge : MergeRec
    >


let qm
    : Type -> Type -> Universe_
    : Kind
    = \(a : Type) -> \(b : Type) -> Universe_.Merge { a, b, m = MaybeT.NoneT }
let qmc
    : Type -> Type -> Type -> Universe_
    : Kind
    = \(a : Type) -> \(b : Type) -> \(c : Type) -> Universe_.Merge { a, b, m = MaybeT.SomeT c }


let Universe : Kind = ∀(X : Type) -> Universe_

let U0 : Universe = \(X : Type) -> Universe_.U0 X
let U1 : Universe = \(X : Type) -> Universe_.U1 X
let U2 : Universe = \(X : Type) -> Universe_.U2 X
let U3 : Universe = \(X : Type) -> Universe_.U3 X
let U4 : Universe = \(X : Type) -> Universe_.U4 X
let U5 : Universe = \(X : Type) -> Universe_.U5 X

let Universe/upper
    : Universe_ -> Universe_ -> Universe_
    = \(right : Universe_) -> \(left : Universe_) ->
        merge
            { U0 = \(r : Type) ->
                merge
                    { U0 = \(l : Type) -> qm r l
                    , U1 = \(l : Type) -> qm r l
                    , U2 = \(l : Type) -> qm r l
                    , U3 = \(l : Type) -> qm r l
                    , U4 = \(l : Type) -> qm r l
                    , U5 = \(l : Type) -> qm r l
                    , Merge = \(rec : MergeRec) -> qmc rec.a rec.b r
                    }
                    left
            , U1 = \(t : Type) -> U0 t
            , U2 = \(t : Type) -> U0 t
            , U3 = \(t : Type) -> U0 t
            , U4 = \(t : Type) -> U0 t
            , U5 = \(t : Type) -> U0 t
            , Merge = \(rec : MergeRec) -> qm rec.a rec.b
            }
            right


let Units : Universe_ = Universe_.U0 {}

in { Universe, Units, U0, U1, U2, U3, U4, Universe/upper }