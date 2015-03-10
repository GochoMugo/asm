max.o: max.asm
	as $? -o $@

max: max.o
	ld $? -o $@

clean:
	ls | grep -Ev "*.asm|.gitignore|Makefile|Readme.md|LICENSE" | xargs rm

