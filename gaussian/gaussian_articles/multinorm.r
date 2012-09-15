

#Example of singular covariance
z1=rnorm(10000)
z2=rnorm(10000)
z3=rnorm(10000)
pairs(cbind(z1,z2,z3))

zbar=(z1+z2+z3)/3
x1=z1-zbar
x2=z2-zbar
x3=z3-zbar
pairs(cbind(x1,x2,x3))

x1+x2+x3

#Note x=Az
amat=cbind(c(2/3,-1/3,-1/3),c(-1/3,2/3,-1/3),c(-1/3,-1/3,2/3))
sigmat=amat%*%t(amat)
det(sigmat)

#note that X1,X2 alone have nonsingular covariance matrix
sigmatprime=sigmat[1:2,1:2]
det(sigmatprime)


########################

#begin with z1,z2
#stretch x1=3z_1 while x2=(-1.2)z_2
#make sure to plot with equal axes
plot(z1,z2)
x1=3*z1
x2=(-1.2)*z2
plot(x1,x2)
plot(x1,x2,xlim=c(-15,15),ylim=c(-15,15))

#to rotate by 30 degrees
#30 degrees = pi/6 radians
rmat=cbind(c(cos(pi/6),sin(pi/6)),c(-sin(pi/6),cos(pi/6)))

wmat=rmat%*%rbind(x1,x2)
plot(wmat[1,],wmat[2,],xlim=c(-15,15),ylim=c(-15,15))
abline(0,tan(pi/6))

#if you have the rotation matrix, take arccos to find angles

#note amat=rmat%*%diag(c(3,-1.2))
amat=rmat%*%diag(c(3,-1.2))
wmat=amat%*%rbind(z1,z2)
plot(wmat[1,],wmat[2,],xlim=c(-15,15),ylim=c(-15,15))
abline(0,tan(pi/6))

#notes eigenvalues of sigmat are the principal directions of the ellipse
sigmat=amat%*%t(amat)
eigen(sigmat)

###############################

z1=rnorm(10000)
z2=rnorm(10000)
plot(z1,z2)
cutoff=qchisq(0.95,2)
sum((z1^2)+(z2^2)<cutoff)

x1=3*z1
x2=(-1.2)*z2
plot(x1,x2,xlim=c(-15,15),ylim=c(-15,15))
lines(c(0,3*sqrt(cutoff)),c(0,0),col="red",lwd=2)
lines(c(0,0),c(0,-1.2*sqrt(cutoff)),col="red",lwd=2)

rmat=cbind(c(cos(pi/6),sin(pi/6)),c(-sin(pi/6),cos(pi/6)))
wmat=rmat%*%rbind(x1,x2)
plot(wmat[1,],wmat[2,],xlim=c(-15,15),ylim=c(-15,15))

amat=rmat%*%diag(c(3,-1.2))
wmat=amat%*%rbind(z1,z2)
plot(wmat[1,],wmat[2,],xlim=c(-15,15),ylim=c(-15,15))

sigeig=eigen(amat%*%t(amat))

