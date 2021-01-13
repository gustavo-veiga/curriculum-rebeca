# Remove utility
ifeq ($(OS),Windows_NT)
	REMOVE=del /f
else
	REMOVE=rm -f
endif

# pdft
PDFTK=pdftk
PDFTK_FLAGS=output

# Libreoffice
LIBREOFFICE=libreoffice
LIBREOFFICE_FLAGS= --headless \
	--convert-to pdf

curriculo.pdf: page1.pdf page2.pdf
	@echo "Gerando um único arquivo final ($@)..."
	@$(PDFTK) $^ $(PDFTK_FLAGS) $@

page1.pdf:
	@echo "Gerando o PDF da primeira página..."
	@$(LIBREOFFICE) $(LIBREOFFICE_FLAGS) page1.odt > /dev/null

page2.pdf:
	@echo "Gerando o PDF da segunda página..."
	@$(LIBREOFFICE) $(LIBREOFFICE_FLAGS) page2.odt > /dev/null

clean:
	@echo "Limpando os arquivos gerados..."
	@$(REMOVE) page1.pdf page2.pdf curriculo.pdf

.PHONY: clean
