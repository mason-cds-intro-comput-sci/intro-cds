SHELL			=		/bin/sh

RM				=		rm
ECHO			=		echo
COPY			=		cp

R				=		Rscript
ROPTS			=

CNAME			=		book.cds101.com

GITBOOK_INDEX	=		index.Rmd
GITBOOK_OUTPUT	=		bookdown::gitbook

ALL_FILES		=		gitbook

CLEAN_FILES		=		*_cache/

define cleanup
	-$(RM) -rf $(CLEAN_FILES)
	$(R) $(ROPTS) -e "bookdown::clean_book(clean = TRUE)"
endef

define render_book
	$(R) $(ROPTS) -e "bookdown::render_book(input='$(GITBOOK_INDEX)', output_format='$(1)')"
endef

.SILENT :
.PHONY : all clean environment

all : $(ALL_FILES)

clean :
	$(call cleanup)

gitbook :
	$(call render_book,$(GITBOOK_OUTPUT))
	$(ECHO) "book.cds101.com" > _book/CNAME
