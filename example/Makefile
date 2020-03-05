COQMAKEFILE ?= Makefile.coq
COQDOCFLAGS_EXTRA = -s

all: $(COQMAKEFILE)
	$(MAKE) -f $^ $@

include coqdocjs/Makefile.doc

clean: $(COQMAKEFILE)
	$(MAKE) -f $^ cleanall
	$(RM) $^ $^.conf

$(COQMAKEFILE): _CoqProject
	$(COQBIN)coq_makefile -f $^ -o $@
