import numpy
import sys
from numpy.lib import recfunctions as rfn
from sklearn.decomposition import PCA

rows = numpy.genfromtxt(sys.stdin, delimiter=',', names=True, dtype=float)
data = rfn.structured_to_unstructured(rows)
X = data[..., 2:]

pca = PCA(n_components=5)
pca.fit(X)


X_r = numpy.hstack((data[..., :2], pca.transform(X)))
numpy.savetxt(sys.stdout,
              X_r,
              delimiter=",",
              header='ward,precinct,component_1,component_2,component_3,component_4,component_5',
              comments='')
