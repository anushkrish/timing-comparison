all: cpp compare

cpp: mmm.cpp
	${CXX} -O3 -I ${EIGEN_DIR} $^

compare:
	@echo 'Python (Numpy)'
	@python mmm.py 1000
	@python mmm.py 2000
	@python mmm.py 3000
	@python mmm.py 4000
	@python mmm.py 5000
	@python mmm.py 6000
	@echo 'C++ (Eigen)'
	@./a.out 1000
	@./a.out 2000
	@./a.out 3000
	@./a.out 4000
	@./a.out 5000
	@./a.out 6000