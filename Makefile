DOC := doc/
EXTRA_DIR := extra/
HEADER := $(EXTRA_DIR)header.html
FOOTER := $(EXTRA_DIR)footer.html
COQDOCFLAGS := \
  --external 'http://ssr2.msr-inria.inria.fr/doc/ssreflect-1.5/' Ssreflect \
  --external 'http://ssr2.msr-inria.inria.fr/doc/mathcomp-1.5/' MathComp \
  --external 'https://www.ps.uni-saarland.de/autosubst/doc/' Autosubst \
  --toc --toc-depth 2 --html --interpolate \
  --index indexpage --no-lib-name --parse-comments \
  --with-header $(HEADER) --with-footer $(FOOTER) \
  -d $(DOC)
COQMAKEFILE := Makefile.coq
COQMAKE := +$(MAKE) -f $(COQMAKEFILE)
VS := $(wildcard *.v)

ifneq "$(COQBIN)" ""
        COQBIN := $(COQBIN)/
endif

doc: clean-doc all
	- mkdir -p $(DOC)
	coqdoc $(COQDOCFLAGS) `cat _CoqProject` $(VS)
	cp $(EXTRA_DIR)resources/* $(DOC)

all: $(COQMAKEFILE)
	+$(MAKE) -f $(COQMAKEFILE) all

clean-doc:
	rm -rf $(DOC)

clean: clean-doc
	-$(COQMAKE) clean
	rm -f $(COQMAKEFILE)

$(COQMAKEFILE): Makefile $(VS)
	coq_makefile -f _CoqProject $(VS) -o $(COQMAKEFILE)


.PHONY: all clean clean-doc doc
