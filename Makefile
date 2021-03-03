DESTDIR=

.PHONY: bash
bash:
	cd home/user/; \
	find .bash* -type f \
	|while read -r f; do \
		install -DT "$$f" "$(DESTDIR)$(HOME)/$$f"; \
	done;

.PHONY: git
git:
	cd home/user/; \
	find .git* -type f \
	|while read -r f; do \
		install -DT "$$f" "$(DESTDIR)$(HOME)/$$f"; \
	done;

.PHONY: groff
groff:
	find etc/groff* -type f \
	|while read -r f; do \
		install -DT "$$f" "$(DESTDIR)/$$f"; \
	done;

.PHONY: sudo
sudo:
	find etc/sudo* -type f \
	|while read -r f; do \
		install -DT "$$f" "$(DESTDIR)/$$f"; \
	done;

.PHONY: vim
vim:
	cd home/user/; \
	find .vim* -type f \
	|while read -r f; do \
		install -DT "$$f" "$(DESTDIR)$(HOME)/$$f"; \
	done;
