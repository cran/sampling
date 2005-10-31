"regressionestimator" <-
function(Xs,piks,tot,q=rep(1,times=length(piks)))
#########################################################
#
# compute the g-weights of the regression estimator
# Xs is the matrix of calibration variables
# piks is the vector of inclusion probabilities
# tot is the vector of population totals
# q is the vector of weights
#
#
########################################################
{   library(MASS)
    tol=.Machine$double.eps
    n = length(piks)
    np = length(Xs)
    p = np/n
    Xs = matrix(Xs,n,p)
    Xs1 = Xs[q != 0, ]
    piks1 = piks[q != 0]
    q1 = q[q != 0]
    if (length(piks1)!= n) t1=tot-colSums((Xs/piks)[q==0,])
    else t1 = tot
w=1/piks1
tc1=c(t(w) %*% Xs1)
A=t(Xs1*q1*w)%*%Xs1
g1=1+q1*c(Xs1%*%ginv(A,tol)%*%(t1-tc1))
g=rep(1, times = n)
g[q != 0]=g1
g
}

