#HDF5 
#Used for storing large dbs
install.packages("BiocManager")
BiocManager::install()
BiocManager::install("rhdf5")

library('rhdf5')

#create file
created=h5createFile('example.h5')
#creategroups
created=h5createGroup('example.h5','foo')
created=h5createGroup('example.h5','baa')
created=h5createGroup('example.h5','foo/foobaa')
#seeing groups list ls
h5ls('example.h5')

A<-matrix(1:10,nr=5,nc=2)

h5write(A,'example.h5','foo/A')

B<-array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
#adding attributes
attr(B,'scale')<-'liter'
h5write(B,'example.h5','foo/foobaa/B')
#adding stuff to subgroups
h5ls('example.h5')
df<-data.frame(1L:5L,seq(0,1,length.out = 5),c('ab','cde','fghi','a','s'),stringsAsFactors = FALSE)
h5write(df,'example.h5','df')
#adding stuff to new group
h5ls('example.h5')

readA<-h5read('example.h5','foo/A')
readB<-h5read('example.h5','foo/foobaa/B')
readdf<-h5read('example.h5','df')
#write to the first three rows of the first column of this place this stuff
h5write(c(12,13,14),'example.h5','foo/A',index=list(1:3,1))
h5read('example.h5','foo/A')

