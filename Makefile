C_FLAGS := $(shell python3-config --cflags)  

build: clean  
	mkdir ./out  
	swig -c++ -python -py3 -interface lib_example -threads -DSWIGWORDSIZE64 -outdir ./  example/example.i  
	g++ -O2 -fPIC -c example/example.c -o out/example.o
	g++ -O2 -fPIC -c example/example_wrap.cxx -o  out/example_wrap.o $(C_FLAGS)  
	g++ -undefined dynamic_lookup -arch x86_64 -shared out/example.o out/example_wrap.o -o lib_example.so $(C_FLAGS)  
	rm -rf ./out  

clean:
	rm -rf ./out 
	rm -f ./*.so   
	rm -rf ./__pycache__  
	rm -f ./example/*_wrap.cxx  

cython:
	python compile.py build_ext --inplace  
	rm -f  ./example.c  
	rm -f  ./example.py  
	rm -rf ./build  &