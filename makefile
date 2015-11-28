LCC=nasm
ASMFLAGS=-felf64
ASMFLAGS_BUILD=-felf64

TCC=gcc
TCCFLAGS=-O3

#TEST_SRC=test.c
#EXEC=ftest

SRC= $(wildcard *.S)
OBJ=$(SRC:.S=.o)

TBINS_SRC=$(wildcard *.test.c)
TBINS=$(TBINS_SRC:.test.c=.tbin)

##	$@ Le nom de la cible 
##      $< Le nom de la première dépendance 
##      $^ La liste des dépendances 
##      $?  La liste des dépendances plus récentes que la cible $* Le nom 
##	du fichier sans suffixe

# define what a carriage return is
define \n


endef

all: debug build_tests

debug: $(OBJ)

#build: ASMFLAGS=$(ASMFLAGS_BUILD)
#build: clean all

build_tests: $(TBINS)

tests: build_tests
	@bash runtests.sh

#$(EXEC): $(TEST_SRC) $(OBJ)
#	@echo "Building the testing binary..."
#	@$(TCC) -o $@ $^ $(TCCFLAGS) 

%.tbin: %.test.c %.o
	@echo "Building $@ testing binary..."
	@$(TCC) -o $@ $^ `if [ -f $*.opts ]; then cat $*.opts;fi;` $(TCCFLAGS)

%.o: %.S
	@echo "Building $@..."
	@$(LCC) -o $@ $<  $(ASMFLAGS)


#.phony reconstruit toujours ses dépendances
.PHONY: clean bclean

clean:
	find . -type f -name '*.o' -delete
bclean: clean
	find . -type f -name '*.tbin' -delete
