# 🧮 Assembly Calculator

A minimalist calculator written **entirely in x86-64 Assembly** using Linux syscalls — no C standard library, no external dependencies, just pure low-level power.

## 🚀 About This Project

This calculator is a personal achievement in systems programming. Designed and written in NASM assembly, it demonstrates:

- Manual input/output handling via Linux `syscall`
- String to integer conversion without helper libraries
- Integer to string conversion for output
- Arithmetic operations: `+`, `-`, `*`, `/`
- Clean memory management with `.data`, `.bss`, and `.text` segmentation

It reads two numbers and an operator from the user and prints the result back to the terminal — the rawest way possible.

## 🛠️ How It Works

- Takes user input for the **first number**, **second number**, and the **operation**
- Parses ASCII input into actual integers
- Performs the operation selected: addition, subtraction, multiplication, or division
- Converts the result back to a human-readable string and prints it

All this is done **without** the help of standard libraries. Only syscalls like `read`, `write`, and `exit` are used.

---

## 🧪 Sample Run

```bash 
bash run.sh
1-son:
> 12
2-son:
> 4
(+ - * /):
> *
result:
48
```
