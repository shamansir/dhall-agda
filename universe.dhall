-- let UniverseT : ∀(X : Type) → Type : Kind = λ(X : Type) → X

-- let Universe : Type = UniverseT {}

let Universe : Kind = ∀(X : Type) → Type

-- let Marker : Type = Integer

-- let Universe_ : Marker -> { marker : Marker, f : Kind } = ∀(X : Type) → Type

let UniverseT : Universe : Kind = λ(X : Type) → X

let Units : Type = UniverseT {}

let Sub : ∀(K : Universe) → Universe = λ(K : Universe) → K

let U0 : Universe = Sub UniverseT

let U1 : Universe = Sub U0

let U2 : Universe = Sub U1

let U3 : Universe = Sub U2

in { Universe, Units, U0, U1, U2, U3 }