let u = ./universe.dhall

-- let One : u.Universe = u.U0

let One : Type = {} -- \(t : Type) -> t


-- let Single : One = One
    -- < One : u.U1 {}
    -- >


let One/induction
    : ∀(A : One -> u.Universe) → A One → ∀(x : One) → A x
    = \(A : One -> u.Universe) -> \(a : A One) -> (x : One) -> a

in One