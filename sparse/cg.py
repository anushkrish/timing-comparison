#import pyamg
import pyamg.gallery
import scipy
#import scipy.sparse
import scipy.sparse.linalg
import sys
import time

start = time.time()
try:
	size = int(sys.argv[1])
except IndexError:
	size = 10

A = pyamg.gallery.poisson((size,size), format='csr')
b = scipy.ones(A.shape[0])
x = scipy.zeros(A.shape[0])
end = time.time()
print "Size:", size*size,
print "Setup:", end-start,
start = time.time()
x = scipy.sparse.linalg.cg(A, b)
end = time.time()
print "Solve:", end-start