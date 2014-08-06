all: cu compare

cu: cg.cu
	nvcc -O3 -arch=compute_20 -I ${CUSP_DIR} $^

compare:
	@echo 'Python (Scipy sparse)'
	@python cg.py 100
	@python cg.py 250
	@python cg.py 500
	@python cg.py 750
	@python cg.py 1000
	@echo 'C++ (Cusp on host)'
	@./a.out 100
	@./a.out 250
	@./a.out 500
	@./a.out 750
	@./a.out 1000