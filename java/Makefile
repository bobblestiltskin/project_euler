JAVAC := javac
JAVAOPTS := -Werror -Xlint:unchecked -Xlint:deprecation

all: $(patsubst %.java,%.class,$(wildcard pe0*.java))

#020: factorial.cpp numstring.cpp
#025: numstring.cpp

#test_factorial: test_factorial.cpp factorial.cpp numstring.cpp
#test_add_digit_strings: test_add_digit_strings.cpp numstring.cpp
#test_mul_int_string: test_mul_int_string.cpp numstring.cpp
#test_mul_digit_string: test_mul_digit_string.cpp numstring.cpp

%.class: %.java
	$(JAVAC) $(JAVAOPTS) $^

clean:
	/bin/rm -f pe*.class
