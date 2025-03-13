CC = gcc
CFLAGS = -Wall -Wextra -fPIC
LDFLAGS = -lpam

TARGET = build/pam_push_auth.so
SOURCE = src/main.c
HEADER = src/config.h
SCRIPT = script/login-push

INSTALL_DIR_SO = /usr/lib/x86_64-linux-gnu/security
INSTALL_DIR_SCRIPT = /usr/local/bin

all: $(TARGET)

config: generate_config.sh
		bash generate_config.sh

$(TARGET): $(SOURCE) $(HEADER)
	mkdir -p build
	$(CC) $(CFLAGS) -shared $(SOURCE) -o $(TARGET) $(LDFLAGS)

install: $(TARGET) $(SCRIPT)
	install -D $(TARGET) $(INSTALL_DIR_SO)/
	install -D $(SCRIPT) $(INSTALL_DIR_SCRIPT)/

uninstall:
	rm -f $(INSTALL_DIR_SO)/$(notdir $(TARGET))
	rm -f $(INSTALL_DIR_SCRIPT)/$(notdir $(SCRIPT))

clean:
	rm -f build/*
	rm -f $(HEADER)
