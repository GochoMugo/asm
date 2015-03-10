max.o: max.asm
	as $? -o $@

max: max.o
	ld $? -o $@

clean:
	ls | grep -Ev "*.asm" | grep -v "Makefile" | xargs rm

