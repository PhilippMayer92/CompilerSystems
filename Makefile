# Compiler flags
CFLAGS := -w -m32 -D'main(a,b)=main(a,char**argv)'

# Compile selfie.c into selfie executable
selfie: selfie.c
	$(CC) $(CFLAGS) $< -o $@

# Consider these targets as targets, not files
.PHONY : test clean

# Test self-compilation, self-execution, and self-hosting
test: selfie
	./selfie -c selfie.c -o selfie1.m -m 4 -l selfie1.m -y 2 -c selfie.c -o selfie2.m
	diff -q selfie1.m selfie2.m

# Clean up
clean:
	rm -rf *.m
	rm -rf *.s
	rm -rf selfie