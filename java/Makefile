JAVAC := javac
JAVAOPTS := -Werror -Xlint:unchecked -Xlint:deprecation

all: $(patsubst %.java,%.class,$(wildcard pe0*.java))

%.class: %.java
	$(JAVAC) $(JAVAOPTS) $^

clean:
	/bin/rm -f pe*.class
