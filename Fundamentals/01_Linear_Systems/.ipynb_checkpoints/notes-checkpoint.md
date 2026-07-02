# Linear Systems

## Overview

Linear systems form the mathematical foundation of modern control theory. Most advanced control methods—including PID tuning, Kalman filtering, LQR, MPC, and many fault-tolerant control techniques—are either directly developed for linear systems or rely on linear approximations of nonlinear dynamics.

Although aerial robots are inherently nonlinear, their dynamics are commonly linearized around an operating point (e.g., hovering) to enable analysis and controller design.

---

# Basic System Representation

A dynamic system can be represented as

Input → System → Output

where

- **Input (u):** External signal applied to the system.
- **State (x):** Internal variables describing the current condition of the system.
- **Output (y):** Measured variables produced by the system.

Example:

Motor thrust → Quadrotor → Position

---

# Properties of Linear Systems

A system is linear if it satisfies the **Superposition Principle**, which consists of two properties.

## Additivity

If

u₁ → y₁

and

u₂ → y₂

then

u₁ + u₂ → y₁ + y₂

---

## Homogeneity (Scaling)

If

u → y

then

αu → αy

for any scalar α.

---

## Superposition

Combining both properties,

T(αu₁ + βu₂)
=
αT(u₁)+βT(u₂)

This property greatly simplifies mathematical analysis and controller design.

---

# Continuous-Time Systems

Continuous-time systems are described using differential equations.

General form

dx/dt = f(x,u)

Example

Mass-Spring-Damper

mẍ + cẋ + kx = F

---

# Discrete-Time Systems

Digital controllers operate in discrete time.

General form

x(k+1)=f(x(k),u(k))

Most practical robotic systems implement discrete controllers.

---

# State Variables

The state is the minimum set of variables that completely describes the current condition of the system.

Example

For a quadrotor

x =
[position,
velocity,
attitude,
angular velocity]

---

# Why State Space?

Advantages

- Compact representation
- Suitable for MIMO systems
- Natural formulation for estimation
- Required for Kalman Filter
- Required for LQR
- Required for MPC
- Widely used in robotics

---

# Linearization

Most robotic systems are nonlinear.

Example

Quadrotor dynamics

ẋ=f(x,u)

Around an equilibrium point

(x₀,u₀)

the nonlinear dynamics can be approximated by

ẋ = Ax + Bu

This approximation enables modern control design.

---

# Applications in Aerial Robotics

Linear system theory is used in

- PID Controller Design
- State Feedback
- Observer Design
- Kalman Filter
- Extended Kalman Filter
- Model Predictive Control
- Fault-Tolerant Control
- Trajectory Tracking
- Sensor Fusion

---

# Key Takeaways

- Most real robotic systems are nonlinear.
- Linear approximations are sufficient around operating points.
- State-space representation is the standard framework in modern robotics.
- Understanding linear systems is essential before studying estimation and advanced control.

---

# Further Reading

- Modern Control Engineering — Katsuhiko Ogata
- Feedback Systems — Åström & Murray
- Linear System Theory — Wilson Rugh