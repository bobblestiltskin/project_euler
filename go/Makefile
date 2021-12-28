GO := go
BUILD := build
CLEAN := clean

all: $(patsubst %.go,%,$(wildcard pe0*.go))

%: %.go
	$(GO) $(BUILD) $^

clean:
	$(GO) $(CLEAN)
	-rm -f pe0??
