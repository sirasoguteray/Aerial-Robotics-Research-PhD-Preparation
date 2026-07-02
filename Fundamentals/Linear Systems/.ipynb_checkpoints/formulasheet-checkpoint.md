# Linear Systems - Formula Sheet

---

# 1. Continuous-Time State Space Model

State Equation

ẋ = Ax + Bu

Output Equation

y = Cx + Du

where

x ∈ ℝⁿ  : State vector
u ∈ ℝᵐ  : Input vector
y ∈ ℝᵖ  : Output vector

A : System Matrix
B : Input Matrix
C : Output Matrix
D : Feedthrough Matrix

---

# 2. Discrete-Time State Space Model

State Equation

x(k+1) = Ax(k) + Bu(k)

Output Equation

y(k) = Cx(k) + Du(k)

---

# 3. Linear System Conditions

Superposition Principle

Additivity

f(u₁ + u₂)
=
f(u₁) + f(u₂)

Homogeneity

f(αu)
=
αf(u)

A system is linear if both properties hold.

---

# 4. Matrix Dimensions

A ∈ ℝⁿˣⁿ

B ∈ ℝⁿˣᵐ

C ∈ ℝᵖˣⁿ

D ∈ ℝᵖˣᵐ

---

# 5. General Linear Differential Equation

ẋ = f(x,u)

Linearized

ẋ = Ax + Bu

---

# 6. Equilibrium Point

At equilibrium

ẋ = 0

Therefore

Ax + Bu = 0

---

# 7. Eigenvalue Equation

Av = λv

where

λ : Eigenvalue

v : Eigenvector

---

# 8. Characteristic Equation

det(A − λI) = 0

Solutions

↓

Eigenvalues

---

# 9. Stability Conditions

Continuous-Time

Stable

Re(λᵢ) < 0

Marginally Stable

Re(λᵢ) = 0

Unstable

Re(λᵢ) > 0

---

Discrete-Time

Stable

|λᵢ| < 1

Marginally Stable

|λᵢ| = 1

Unstable

|λᵢ| > 1

---

# 10. Time Response

Continuous

x(t)

Discrete

x(k)

---

# 11. Common Dynamic Models

First Order

τẋ + x = Ku

Transfer Function

G(s) = K/(τs+1)

---

Second Order

x¨ + 2ζωₙẋ + ωₙ²x
=
ωₙ²u

Parameters

ζ : Damping Ratio

ωₙ : Natural Frequency

---

# 12. Transfer Function

Continuous

G(s)
=
Y(s)/U(s)

Discrete

G(z)
=
Y(z)/U(z)

---

# 13. Linearization

Nonlinear

ẋ = f(x,u)

Around equilibrium

x₀,u₀

↓

δẋ = Aδx + Bδu

where

A = ∂f/∂x

B = ∂f/∂u

evaluated at (x₀,u₀)

---

# 14. Important Relationships

Continuous

ẋ → Differential Equation

↓

State Space

↓

Controller Design

↓

Kalman Filter

↓

MPC

↓

Fault-Tolerant Control

---

# 15. Common Symbols

x      State

u      Input

y      Output

A      System Matrix

B      Input Matrix

C      Output Matrix

D      Feedthrough Matrix

λ      Eigenvalue

v      Eigenvector

I      Identity Matrix

n      Number of States

m      Number of Inputs

p      Number of Outputs