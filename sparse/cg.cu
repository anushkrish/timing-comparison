#include <cusp/csr_matrix.h>
#include <cusp/gallery/poisson.h>
#include <cusp/krylov/cg.h>
#include <stdio.h>
#include <sys/time.h>

double time_elapsed(timeval &start, timeval &end)
{
    return (end.tv_sec-start.tv_sec) + (end.tv_usec-start.tv_usec)*1e-6;
}

int main(int argc, char **argv)
{
    int     size;
    timeval start, end;

    gettimeofday(&start, 0);
    size = atoi(argv[1]);

    // create an empty sparse matrix structure (HYB format)
    cusp::csr_matrix<int, double, cusp::host_memory> A;

    // load a matrix stored in MatrixMarket format
    cusp::gallery::poisson5pt(A, size, size);

    // allocate storage for solution (x) and right hand side (b)
    cusp::array1d<double, cusp::host_memory> x(A.num_rows, 0);
    cusp::array1d<double, cusp::host_memory> b(A.num_rows, 1);
    gettimeofday(&end, 0);
    printf("Size: %d ", size*size);
    printf("Setup: %f ", time_elapsed(start, end));

    // solve the linear system A * x = b with the Conjugate Gradient method
    gettimeofday(&start, 0);
    cusp::krylov::cg(A, x, b);
    gettimeofday(&end, 0);
    printf("Solve: %f\n", time_elapsed(start, end));

    //cusp::print(x);
    
    return 0;
}