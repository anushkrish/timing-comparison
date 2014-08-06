#include <iostream>
#include <Eigen/Dense>
#include <sys/time.h>

using namespace std;
using Eigen::MatrixXd;

double time_elapsed(timeval &start, timeval &end)
{
	return (end.tv_sec-start.tv_sec) + (end.tv_usec-start.tv_usec)*1e-6;
}

int main(int argc, char **argv)
{
	int     size;
	timeval start, end;

	gettimeofday(&start, 0);
	if(argc > 1)
	{
		size = atoi(argv[1]);
	}
	else
	{
		size = 4;
	}

	MatrixXd A(size, size);
	MatrixXd B(size, size);
	MatrixXd C(size, size);
	for(int j=0; j<size; j++)
	{
		for(int i=0; i<size; i++)
		{
			A(i,j) = i + j;
			B(i,j) = i + j;
		}
	}
	gettimeofday(&end, 0);
	cout << "Size: " << size << ' ';
	cout << "Setup: " << time_elapsed(start, end) << ' ';
	
	gettimeofday(&start, 0);
	C = A*B;
	gettimeofday(&end, 0);
	cout << "Product: " << time_elapsed(start, end) << endl;
}