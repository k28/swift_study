
TARGET	= "command_line_tool"

build:
	swiftc -o $(TARGET) main.swift StreamReader.swift

all: build

run: build
	./$(TARGET)

clean:
	rm $(TARGET)

