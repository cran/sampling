"regressionestimator" <-
function(Xs,piks,t,q=rep(1,times=length(piks)))
#########################################################
#
# compute the regression estimator
#
# compute de g-weights of the raking ratio estimator
# Xs is the matrix of calibration variables
# piks is the vector of inclusion probabilities
# t is the vector of population totals
# q is the vector of weights
#
#
########################################################
{library(MASS)
n=length(piks)
np=length(Xs)
p=np/n
Xs=array(Xs,c(n,p))
Xs1=Xs[q!=0,]
piks1=piks[q!=0]
q1=q[q!=0]
n1=length(piks1)
if(n1!=n) t1<-t-colSums(array((Xs/piks)[q==0,],c(n-n1,p))) else t1<-t
tc1=c(t(1/piks1)%*%Xs1)
A=t(Xs1) %*% array(diag(q1/piks1),c(n1,n1)) %*% (Xs1) 
g1=1+q1*c(t(t1-tc1) %*% ginv(A) %*% t(Xs1))  
g=rep(1,times=n)
g[q!=0]=g1
g
}




