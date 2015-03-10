max.o: max.asm
	as $? -o $@

max: max.o
	ld $? -o $@

clean:
	ls | grep -Ev "*.asm|.gitignore|Makefile|README.md|LICENSE" | xargs rm

