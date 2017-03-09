# Compiler flags
CFLAGS := -w -m32 -D'main(a,b)=main(a,char**argv)'

# Compile selfie.c into selfie executable
selfie: selfie.c
	$(CC) $(CFLAGS) $< -o $@

# Consider these targets as targets, not files
.PHONY : test clean

# Test self-compilation, self-execution, and self-hosting
test: selfie
	./selfie -c selfie.c -o selfie1.m -s selfie1.s -m 2 -c selfie.c -o selfie2.m -s selfie2.s
	diff -q selfie1.m selfie2.m
	diff -q selfie1.s selfie2.s
	./selfie -c countdown.c -m 2; test $$? -eq 145

# Clean up
clean:
	rm -rf *.m
	rm -rf *.s
	rm -rf selfie