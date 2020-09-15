C_FLAGS := $(shell python3-config --cflags)  

build:  
	swig -c++ -python -py3 -interface __example -threads -DSWIGWORDSIZE64 example.i
	g++ -O2 -fPIC -c example.c -o example.o
	g++ -O2 -fPIC -c example_wrap.cxx -o  example_wrap.o $(C_FLAGS)  
	g++ -undefined dynamic_lookup -arch x86_64 -shared example.o example_wrap.o -o __example.so $(C_FLAGS)

clean:
	rm ./*.so &
	rm ./*.o &
	rm ./example.py &
	rm ./*_wrap.*