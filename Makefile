.PHONY: examples

CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<
	mv $(EXAMPLES_DIR)/$@ $@

clean:
	rm -f *.pdf

distclean: clean
	for EXT in pdf aux log out ; do rm -f $(EXAMPLES_DIR)/*.$${EXT}; rm -f *.$${EXT}; done
