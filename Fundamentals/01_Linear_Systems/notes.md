# Linear Systems Fundamentals

## What is a System?

A **system** is a mathematical representation of a physical process that transforms one or more inputs into outputs according to a set of dynamic rules.

Examples:
- Quadcopter
- Mobile robot
- Electric motor
- Mass-spring-damper system

General representation:

Input → System → Output

---

## State

The **state** is the minimum set of variables that completely describes the current condition of a dynamic system.

Knowing the current state and future inputs is sufficient to predict the future behavior of the system.

Examples:

Mass-Spring System

State vector

x = [position, velocity]ᵀ

Quadrotor

State vector may include

- Position
- Velocity
- Orientation (Roll, Pitch, Yaw)
- Angular Velocity

---

## Input and Output

### Input (Control Input)

The external signal applied to the system.

Examples

- Motor thrust
- Force
- Torque
- Voltage

Usually denoted as

u(t)

---

### Output

Measured or observed quantities.

Examples

- Position
- Velocity
- Attitude
- Temperature

Usually denoted as

y(t)

---

## Continuous-Time vs Discrete-Time Systems

### Continuous-Time Systems

The state evolves continuously over time.

Typically modeled using differential equations.

dx/dt = f(x,u)

Examples

- Aircraft dynamics
- Mechanical systems
- Electrical circuits

---

### Discrete-Time Systems

The state is updated only at discrete sampling instants.

x(k+1)=f(x(k),u(k))

Examples

- Digital controllers
- Embedded systems
- Computer simulations

---

## Linear Systems

A system is linear if it satisfies the **Superposition Principle**.

### Additivity

If

u₁ → y₁

and

u₂ → y₂

then

u₁+u₂ → y₁+y₂

---

### Homogeneity

If

u → y

then

αu → αy

for any scalar α.

Most real robotic systems are nonlinear, but many can be approximated as linear around an operating point.

---

## State-Space Representation

State-space modeling provides a compact mathematical framework for representing multi-variable dynamic systems.

Continuous-time

ẋ = Ax + Bu

y = Cx + Du

where

x : State vector

u : Input vector

y : Output vector

A : System matrix

B : Input matrix

C : Output matrix

D : Feedthrough matrix

Advantages

- Suitable for MIMO systems
- Supports modern control methods
- Used in Kalman Filter
- Used in MPC
- Used in LQR
- Easy computer implementation

---

## Stability

A system is stable if bounded inputs produce bounded outputs and the system naturally returns to equilibrium after a disturbance.

For continuous linear systems

Stable if

Real(λᵢ) < 0

For discrete systems

Stable if

|λᵢ| < 1

where λᵢ are the eigenvalues of A.

---

## Eigenvalues

Eigenvalues describe the intrinsic dynamic behavior of a system.

For a linear system

Av = λv

where

λ : Eigenvalue

v : Eigenvector

Physical interpretation

- Stability
- Response speed
- Oscillation frequency
- Damping

Eigenvalues are fundamental in

- Stability analysis
- Pole placement
- Observer design
- Kalman Filter
- Model Predictive Control

---

## Why Linear Systems Matter

Linear system theory forms the mathematical foundation of many modern robotics algorithms, including

- PID Control
- State Estimation
- Kalman Filter
- LQR
- MPC
- Observer Design
- Fault-Tolerant Control

Although aerial robots are inherently nonlinear, linearization around operating points enables efficient analysis and controller design.