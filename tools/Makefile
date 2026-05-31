.PHONY: all clean

CC := gcc

# CPU-specific flags
CPU_FLAGS := -march=native -mtune=native

# On amd64 (x86_64), also enable AVX2
ARCH := $(shell uname -m)
ifeq ($(ARCH),x86_64)
  CPU_FLAGS += -mavx2
endif

# Base safe flags
CFLAGS := -O2 -flto -std=c11 -Wall -Wextra -pedantic $(CPU_FLAGS)


tools := \
	gfx \
	make_patch \
	pkmncompress \
	scan_includes

all: $(tools)
	@:

clean:
	$(RM) $(tools)

gfx: common.h
scan_includes: common.h

%: %.c
	$(CC) $(CFLAGS) -o $@ $<