NAME ?= aLn-vayu
DATE := $(shell date "+%Y%m%d-%H%M")
ZIP := $(NAME)-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* *placeholder* *.md*
DAT := Image dtb dtbo.img

normal: $(ZIP)

$(ZIP):
	@tar -cJf kernel.dat $(DAT)
	@rm -vf $(DAT)
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Done."

clean:
	@rm -vf *.zip*
	@rm -vf *.gz-dtb*
	@rm -vf *.gz*
	@rm -vf *.img*
	@rm -vf dtb
	@rm -vf Image
	@rm -vf modules/vendor/lib/modules/*.ko
	@echo "Done."
