#
# Finds the largest number (maximum) number from a list of
# numbers
#
# Uses of registers:
# - %edi : holds index of number in list being examined
# - %ebx : largest number found
# - %eax : current number being examined
#
# Memory locations:
# - numbers : list of numbers. A `0` is used to terminate the list
#
# Adapted from:
# - Programming from the Ground Up
# - by Jonathan Bartlett
# - found at: http://savannah.nognu.org/projects/pgubook
#

.section .data
  numbers:
    .long 10, 20, 2, 3, 56, 21, 34, 0

.section .text

  .globl _start

  _start:
    movl $0, %edi
    movl numbers(, %edi, 4), %eax
    movl %eax, %ebx
    jmp loop

  loop:
    cmpl $0, %eax
    je loop_end
    incl %edi
    movl numbers(, %edi, 4), %eax
    cmpl %ebx, %eax
    jle loop
    movl %eax, %ebx
    jmp loop

  loop_end:
    movl $1, %eax
    int $0x80
