# 📈 Third-Order Newton Method for Nonlinear Optimization

![MATLAB](https://img.shields.io/badge/MATLAB-0076A8?style=for-the-badge&logo=mathworks&logoColor=white)
![Numerical Methods](https://img.shields.io/badge/Numerical%20Methods-4B8BBE?style=for-the-badge)
![Optimization](https://img.shields.io/badge/Optimization-2E8B57?style=for-the-badge)
![Linear Algebra](https://img.shields.io/badge/Linear%20Algebra-8A2BE2?style=for-the-badge)
![LaTeX](https://img.shields.io/badge/LaTeX-008080?style=for-the-badge&logo=latex&logoColor=white)

A MATLAB implementation of a **third-order Newton-type method** for solving systems of nonlinear equations and nonlinear optimization problems.

This project applies a research-based numerical algorithm to optimization and regression-style problems. It shows how mathematical formulas can be translated into working code, tested through iterations, and analyzed based on convergence behavior.

---

📄 [Download the technical report](report/third_order_newton_report.pdf)

---

## Why this project is useful

This is a portfolio-friendly project because it demonstrates:

- numerical methods for nonlinear systems,
- optimization using gradients and Jacobian matrices,
- MATLAB programming with loops, vectors, and matrices,
- implementation of an algorithm based on a research paper,
- analysis of convergence and divergence behavior,
- technical communication through a LaTeX report.

---

## Features

- 📈 **Third-order Newton-type algorithm** — implements a modified Newton method with an intermediate update step
- 🧮 **Nonlinear system solving** — solves systems of equations using iterative updates
- 🔢 **Jacobian construction** — manually builds Jacobian matrices for each problem
- 📊 **Optimization problems** — converts minimization problems into nonlinear systems
- 🧪 **Convergence analysis** — compares when the method converges and when it does not
- 💻 **MATLAB implementation** — uses matrix operations, loops, and numerical computation
- 📄 **Technical report** — includes the mathematical background, implementation, and results

---

## Demo

The algorithm starts with an initial guess and improves the solution over multiple iterations.

For Task 1, the initial vector was:

```text
[-1, 1, -1]
```

After running the third-order Newton-type method, some of the results were:

| Iteration | x | y | z |
|---|---:|---:|---:|
| 1 | 1.1105 | 2.6810 | 1.4024 |
| 2 | 2.4736 | 3.6808 | 2.8837 |
| 8 | 2.4317 | 3.0000 | 3.5683 |

For Task 2, the method was tested on an exponential regression problem. The expected solution was:

```text
x1 = sqrt(3), x2 = sqrt(7)
```

However, with the given starting point, the method did not converge to the true solution. This showed the importance of the initial guess when using Newton-type methods.

---

## Tech stack

| Component | Technology |
|---|---|
| Language | MATLAB |
| Mathematical writing | LaTeX |
| Main topic | Numerical methods |
| Algorithm type | Third-order Newton-type method |
| Concepts used | Nonlinear systems, optimization, Jacobians, iteration |
| Output | MATLAB results and technical report |

---

## How it works

The classical Newton method solves a nonlinear system:

```text
F(x) = 0
```

using the update:

```text
x_next = x - inv(F'(x)) * F(x)
```

The third-order Newton-type method improves this by adding an intermediate step.

First, it computes:

```text
y = x - inv(F'(x)) * F(x)
```

Then, it updates the solution using both `F(x)` and `F(y)`:

```text
x_next = x - inv(F'(x)) * (F(x) + F(y))
```

The general workflow is:

```text
Choose an initial vector
        │
        ▼
Compute F(x)
        │
        ▼
Compute the Jacobian F'(x)
        │
        ▼
Compute intermediate vector y
        │
        ▼
Evaluate F(y)
        │
        ▼
Update x using the third-order formula
        │
        ▼
Repeat for a fixed number of iterations
        │
        ▼
Analyze convergence behavior
```

This method can converge faster than the classical Newton method when the starting point is close enough to the solution.

---

## Task 1: Nonlinear optimization problem

The first task minimized the function:

```text
f(x, y, z) =
(x - 1)^4 + (y - 3)^4 + (z - 5)^4
+ (x - y)^6 + (y - z)^6 + (x - z)^6
```

To solve the problem, the partial derivatives were taken with respect to `x`, `y`, and `z`. These equations were then set equal to zero, creating a nonlinear system.

The third-order Newton-type method was then applied to solve that system.

Key result:

| Iteration | x | y | z |
|---|---:|---:|---:|
| 1 | 1.1105 | 2.6810 | 1.4024 |
| 2 | 2.4736 | 3.6808 | 2.8837 |
| 8 | 2.4317 | 3.0000 | 3.5683 |

This part of the project shows how optimization problems can be solved by converting them into nonlinear systems.

---

## Task 2: Exponential regression problem

The second task focused on a nonlinear regression problem:

```text
f(x1, x2) =
1/2 * sum([y_j - exp(x1 * t_j) - exp(x2 * u_j)]^2)
```

The data was generated from:

```text
y_j = exp(sqrt(3) * t_j) + exp(sqrt(7) * u_j)
```

So the true solution was expected to be:

```text
x1 = sqrt(3)
x2 = sqrt(7)
```

However, starting from:

```text
[0.75, 0.25]
```

the method did not converge to the expected solution.

Some of the outputs were:

| Iteration | x1 | x2 |
|---|---:|---:|
| 2 | -9.2165 | -8.3486 |
| 5 | -23.5653 | -18.6448 |
| 10 | -53.1977 | -38.5236 |

This result was useful because it showed that even powerful numerical methods can fail when the initial guess is not close enough to the true solution.

---

## What I learned

This project helped me understand that numerical algorithms are not just about coding formulas. They also require testing, debugging, and interpreting the results.

The most important takeaways were:

- how to implement an iterative algorithm from mathematical notation,
- how to build Jacobian matrices manually,
- how optimization problems can become systems of equations,
- why Newton-type methods can be sensitive to the initial guess,
- why convergence analysis is important in numerical computing.

---

## Project structure

```text
third-order-newton-matlab/
├── README.md
├── src/
│   ├── task1_nonlinear_optimization.m
│   └── task2_exponential_regression.m
├── results/
│   ├── task1_iteration_output.txt
│   └── task2_iteration_output.txt
├── report/
│   ├── third_order_newton_report.pdf
│   └── third_order_newton_report.tex
└── figures/
    └── optional_matlab_plot.png
```

---

## Getting started

### Prerequisites

- MATLAB
- Optional: a LaTeX distribution if you want to compile the report locally

### Run Task 1

Open MATLAB and run:

```matlab
task1_nonlinear_optimization
```

### Run Task 2

Open MATLAB and run:

```matlab
task2_exponential_regression
```

---

## Results

The project includes two main experiments.

| Task | Problem type | Result |
|---|---|---|
| Task 1 | Nonlinear optimization | Method moved toward a stable solution |
| Task 2 | Exponential regression | Method did not converge from the given starting point |

The second result is especially important because it shows a real limitation of Newton-type methods: they can be very sensitive to the initial guess.

---

## Limitations and future improvements

- The current implementation uses a fixed number of iterations.
- The algorithm does not automatically stop based on an error tolerance.
- The method can fail if the starting point is too far from the solution.
- Future work could compare this method with the classical Newton method.
- Future work could add convergence plots and error tracking.
- Future work could replace `inv(A) * b` with MATLAB’s backslash operator `A \ b` for better numerical stability.

---

## About me

Built by **Carlota Arzúa**, a developer interested in mathematical modeling, optimization, numerical methods, and applied algorithms.

- LinkedIn: https://www.linkedin.com/in/carlota-a-53a75b206/
- Email: carlotaarzua@gmail.com

---

## License

This project is intended for educational and portfolio purposes. You may adapt the code with attribution.
