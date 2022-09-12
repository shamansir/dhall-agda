

-- ∀, λ

let Universe_ : Kind =
    < U0 : Type
    | U1 : Type
    | U2 : Type
    | U3 : Type
    | U4 : Type
    | U5 : Type
    >


let Universe : Kind = ∀(X : Type) -> Universe_

let u0 : Universe_ = Universe_.U0 {}
let u1 : Universe_ = Universe_.U1 {}
let u2 : Universe_ = Universe_.U2 {}
let u3 : Universe_ = Universe_.U3 {}
let u4 : Universe_ = Universe_.U4 {}
let u5 : Universe_ = Universe_.U5 {}

let U0 : Universe = \(X : Type) -> u0
let U1 : Universe = \(X : Type) -> u1
let U2 : Universe = \(X : Type) -> u2
let U3 : Universe = \(X : Type) -> u3
let U4 : Universe = \(X : Type) -> u4
let U5 : Universe = \(X : Type) -> u5

let Universe/upper
    : Universe_ -> Universe_ -> Universe_
    = \(right : Universe_) -> \(left : Universe_) ->
        merge
            { U0 = \(_ : Type) ->
                merge
                    { U0 = \(_ : Type) -> u0
                    , U1 = \(_ : Type) -> u1
                    , U2 = \(_ : Type) -> u2
                    , U3 = \(_ : Type) -> u3
                    , U4 = \(l : Type) -> u4
                    , U5 = \(l : Type) -> u5
                    }
                    left
            , U1 = \(_ : Type) ->
                merge
                    { U0 = \(_ : Type) -> u1
                    , U1 = \(_ : Type) -> u1
                    , U2 = \(_ : Type) -> u2
                    , U3 = \(_ : Type) -> u3
                    , U4 = \(l : Type) -> u4
                    , U5 = \(l : Type) -> u5
                    }
                    left
            , U2 = \(_ : Type) ->
                merge
                    { U0 = \(_ : Type) -> u2
                    , U1 = \(_ : Type) -> u2
                    , U2 = \(_ : Type) -> u2
                    , U3 = \(_ : Type) -> u3
                    , U4 = \(l : Type) -> u4
                    , U5 = \(l : Type) -> u5
                    }
                    left
            , U3 = \(_ : Type) ->
                merge
                    { U0 = \(_ : Type) -> u3
                    , U1 = \(_ : Type) -> u3
                    , U2 = \(_ : Type) -> u3
                    , U3 = \(_ : Type) -> u3
                    , U4 = \(l : Type) -> u4
                    , U5 = \(l : Type) -> u5
                    }
                    left
            , U4 = \(_ : Type) ->
                merge
                    { U0 = \(_ : Type) -> u4
                    , U1 = \(_ : Type) -> u4
                    , U2 = \(_ : Type) -> u4
                    , U3 = \(_ : Type) -> u4
                    , U4 = \(l : Type) -> u4
                    , U5 = \(l : Type) -> u5
                    }
                    left
            , U5 = \(_ : Type) ->
                merge
                    { U0 = \(_ : Type) -> u5
                    , U1 = \(_ : Type) -> u5
                    , U2 = \(_ : Type) -> u5
                    , U3 = \(_ : Type) -> u5
                    , U4 = \(l : Type) -> u5
                    , U5 = \(l : Type) -> u5
                    }
                    left
            }
            right

in { Universe, U0, U1, U2, U3, U4, Universe/upper }