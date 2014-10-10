
rhel = $(shell lsb_release -rs | cut -f1 -d.)

ifeq ($(rhel),7)
	PYTHON=python
endif
ifeq ($(rhel),6)
	PYTHON=python
endif
ifeq ($(rhel),5)
	PYTHON=python26
	EXTRA_REQUIRES=,python26-ordereddict
endif

RPM:
	$(PYTHON) setup.py bdist_rpm --python=$(PYTHON) --requires=$(PYTHON)-netaddr$(EXTRA_REQUIRES)
