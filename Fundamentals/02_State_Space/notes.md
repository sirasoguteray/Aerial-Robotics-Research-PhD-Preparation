# State-Space Representation

## Overview

State-space representation is a mathematical framework used to model dynamic systems using first-order differential (or difference) equations.

Unlike transfer functions, state-space models can naturally describe:

- Multi-input multi-output (MIMO) systems
- Internal system dynamics
- Time-varying systems
- Nonlinear systems (after linearization)
- Modern control algorithms

State-space representation is the foundation of modern control theory.

---

# Why Do We Need State-Space?

Classical control mainly relies on transfer functions.

However, transfer functions have several limitations:

- Only describe input-output relationships.
- Do not explicitly represent internal states.
- Difficult to extend to MIMO systems.
- Less suitable for modern estimation and optimization methods.

State-space solves these problems by describing how the internal state evolves over time.

---

# General Continuous-Time State-Space Model

State Equation

ẋ = Ax + Bu

Output Equation

y = Cx + Du

where

x : State vector

u : Input vector

y : Output vector

A : System matrix

B : Input matrix

C : Output matrix

D : Feedthrough matrix

---

# General Discrete-Time State-Space Model

x(k+1) = Ax(k) + Bu(k)

y(k) = Cx(k) + Du(k)

Most digital controllers use discrete-time models.

---

# Components of the State-Space Model

## State Vector (x)

Contains the minimum set of variables required to describe the system.

Example (Mass-Spring-Damper)

x =
[
position
velocity
]

Example (Quadrotor)

x =
[
x
y
z
vx
vy
vz
roll
pitch
yaw
p
q
r
]

---

## Input Vector (u)

External control commands applied to the system.

Examples

- Motor thrust
- Force
- Torque
- Voltage

Quadrotor

u =
[
T₁
T₂
T₃
T₄
]

---

## Output Vector (y)

Measured quantities.

Examples

- Position
- Velocity
- Attitude

Outputs do not have to include every state.

---

# Meaning of Each Matrix

## A — System Matrix

Describes how the current state affects the future state.

It represents the natural dynamics of the system.

Without any input

ẋ = Ax

---

## B — Input Matrix

Describes how control inputs influence the system.

Large values indicate stronger control authority.

---

## C — Output Matrix

Maps internal states to measurable outputs.

Example

State

[
position
velocity
]

Output

[
position
]

Then

C =
[
1 0
]

---

## D — Feedthrough Matrix

Represents the direct effect of the input on the output.

Most mechanical systems have

D = 0

---

# Example

Mass-Spring-Damper System

Equation

mẍ + cẋ + kx = F

Choose

x₁ = position

x₂ = velocity

Then

ẋ₁ = x₂

ẋ₂ = -(k/m)x₁ -(c/m)x₂ +(1/m)F

State-space

ẋ = Ax + Bu

---

# Advantages

✔ Represents internal dynamics

✔ Supports MIMO systems

✔ Suitable for digital control

✔ Easy to simulate

✔ Compatible with optimization

✔ Used in estimation algorithms

---

# Applications

State-space models are used in

- Kalman Filter
- Extended Kalman Filter
- Unscented Kalman Filter
- LQR
- MPC
- Observer Design
- Adaptive Control
- Fault-Tolerant Control
- Robotics
- Aerospace
- Autonomous Vehicles

---

# State-Space vs Transfer Function

| State-Space | Transfer Function |
|-------------|-------------------|
| Describes internal states | Only input-output relationship |
| Suitable for MIMO systems | Mainly SISO |
| Time-domain representation | Frequency-domain representation |
| Used in modern control | Used in classical control |
| Supports state estimation | Cannot estimate internal states |

---

# Research Notes

Questions

- Why does Kalman Filter require a state-space model?
- Why is MPC formulated in state-space?
- How can nonlinear quadrotor dynamics be converted into a linear state-space model?
- How does the choice of state variables affect controller performance?

Connections

State-Space

↓

Kalman Filter

↓

LQR

↓

Model Predictive Control

↓

Fault-Tolerant Control

↓

Quadrotor Control

---

# Key Takeaways

- State-space models describe the internal behavior of dynamic systems.
- The state vector contains the minimum information required to predict future behavior.
- Matrix A defines system dynamics.
- Matrix B defines control influence.
- Matrix C defines measurable outputs.
- Matrix D represents direct input-output coupling.
- Nearly all modern robotics and aerospace control algorithms are built upon state-space models.