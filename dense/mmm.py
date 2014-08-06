import numpy
import scipy
import sys
import time

start = time.time()
try:
	size = int(sys.argv[1])
except IndexError:
	size = 4

A = numpy.empty((size,size))
B = numpy.empty((size,size))
C = numpy.empty((size,size))
for i in xrange(size):
	for j in xrange(size):
		A[i,j] = i + j
		B[i,j] = i + j
end = time.time()
print "Size:", size,
print "Setup:", end-start,
start = time.time()
C = numpy.dot(A, B)
end = time.time()
print "Product:", end-start