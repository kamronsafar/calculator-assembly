nasm -f elf64 -o calculator.o calculator.asm
ld -o calculator calculator.o
./calculator
