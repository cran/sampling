"rakingratio" <-
function(Xs,piks,t,q=rep(1,times=length(piks)))
{
require(MASS)
ITERATIONS=300
EPS=.Machine$double.eps	
tol=.Machine$double.eps
#####################################################
n=length(piks)
np=length(Xs)
p=np/n
Xs=matrix(Xs,n,p)
Xs1 = as.matrix(Xs[q != 0, ]) 
piks1=piks[q!=0];
q1=q[q!=0];
n1=length(piks1)
if(n1!=n) t1= t-colSums(array((Xs/piks)[q==0,],c(n-n1,p))) else t1=t;
tc1=c( t(1/piks1) %*% Xs1);
########################################################
d1=1/piks1
tc1=c(d1%*%Xs1)
#####################################################
# definition of the exponential rakingratio function
#####################################################
Fcal<-function(u,v)   F=exp(u*v)
#####################################################
# definition of the derivative of
# the exponential rakingratio function
#####################################################
Fcalprime<-function(u,v)   v*exp(u*v)
###################################################
#
# phi is the function to solve
#
###################################################
phi<-function(lambda)
{
TT=0
for(k in 1:n1) TT=TT+d1[k]*Xs1[k,]*(Fcal(Xs1[k,]%*% lambda,q1[k])-1);
TT
}
###################################################
#
# phiprime is the derivative of phi
#
###################################################
phiprime<-function(lambda)
{
TT=0
for(k in 1:n1) TT=TT+(d1[k]*Xs1[k,]*Fcalprime(Xs1[k,]%*% lambda,q1[k]))%*%t(Xs1[k,])
TT
}
#####################################################
#
# solving the rakingratio equation 
#
#####################################################
lambda=rep(0,times=p);
lambda1=rep(1,times=p);
z=lambda-lambda1;
for(i in 1:ITERATIONS)
{
lambda1=lambda-ginv(phiprime(lambda),tol)%*%c(phi(lambda)-t1+tc1)
z=lambda-lambda1
if( (t(z)%*%z<EPS)) break
lambda=lambda1
}
if(i==ITERATIONS) cat("\nImpossible to solve the program\n")
###########################################################
g1=rep(0,times=n1)
for(k in 1:n1) g1[k]=Fcal(t(lambda)%*%Xs1[k,],q1[k])
g=rep(1,times=n)
g[q!=0]=g1
g
}

