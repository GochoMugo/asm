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
  numbers: # a list of long integers
    .long 10, 20, 2, 3, 56, 21, 34, 0


.section .text
  .globl _start # marks the start of program

  _start:
    movl $0, %edi # 1st index of the list
    movl numbers(, %edi, 4), %eax # examining the 1st number
    movl %eax, %ebx # assume this 1st number is the largest
    jmp loop # start looping through the list

  loop:
    cmpl $0, %eax # check if the number being inspected is zero
    je loop_end # get out of this loop, if it was equal to zero
    incl %edi # increment the index of the list
    movl numbers(, %edi, 4), %eax # load the next number to inspect
    cmpl %ebx, %eax # compare the current largest no. and the no.
      # being inspected
    jle loop # continue to the next iteration if it is less or equal
    movl %eax, %ebx # number being inspected is larger so move it
    jmp loop # go to the next iteration

  loop_end:
    movl $1, %eax # exit system call
    int $0x80 # raise interrupt
