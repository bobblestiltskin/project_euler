FILES:=$(patsubst %.adb,%,$(wildcard pe0*.adb))

%: %.adb
	gnatmake $?

all: $(FILES)

clean:
	rm -f pe0?? *.ali *.o
