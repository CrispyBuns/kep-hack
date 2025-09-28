.PHONY: all clean

CC := gcc

# Base safe flags
CFLAGS := -O2 -flto -std=c11 -Wall -Wextra -pedantic

# --- CPU feature detection ---
# Check if compiler accepts -march=native
HAS_NATIVE := $(shell echo | $(CC) -march=native -E - 2>/dev/null && echo yes)
ifeq ($(HAS_NATIVE),yes)
  CFLAGS += -march=native -mtune=native
endif

# Check AVX2
HAS_AVX2 := $(shell echo | $(CC) -mavx2 -E - 2>/dev/null && echo yes)
ifeq ($(HAS_AVX2),yes)
  CFLAGS += -mavx2 -mfma -mbmi -mbmi2
endif

# Check SSE4.2 (will imply earlier SSEs)
HAS_SSE42 := $(shell echo | $(CC) -msse4.2 -E - 2>/dev/null && echo yes)
ifeq ($(HAS_SSE42),yes)
  CFLAGS += -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2
endif
# --- end detection ---

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
