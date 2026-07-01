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
