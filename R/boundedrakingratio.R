"boundedrakingratio" <-
function(Xs,piks,t,q=rep(1,times=length(piks)),LOW=0,UP=10)
#####################################################
# compute the g-weights of the raking-ratio estimator
# with bounds on the g-weights
# Xs is the matrix of calibration variables
# piks is the vector of inclusion probabilities
# t is the vector of population totals
# q is the vector of weights
# LOW is the smallest value for the g-weights
# UP is the largest alue for the g-weights
######################################################
{
library(MASS)
n=length(piks)
np=length(Xs)
p=np/n
Xs=array(Xs,c(n,p));
g=rakingratio(Xs,piks,t,q)
if(checkcalibration(Xs,piks,t,g))
  {
   p=dim(Xs)[2]
   n=length(piks)
   arret1=-1;
   arret=0;
   flag=rep(0,times=n);
   while(arret1!=arret &  (n-length(piks[flag!=0]))>0 )
       {
       flag=rep(0,times=n)
       for(i in 1:n)
         {
         if(g[i]<=LOW) {flag[i]=-1;g[i]=LOW;}
         if(g[i]>=UP)  {flag[i]= 1;g[i]=UP ;}
         }
       enl=rep(0,times=p)
       nr=length(piks[flag!=0])
       if(nr>0) 
             for(j in 1:p) enl[j]=sum(array((Xs*(g/piks))[flag!=0,],c(nr,p))[,j])
       tn=t-enl
       g1=rakingratio(Xs[flag==0,],piks[flag==0],tn,q[flag==0])
       g[flag==0]= g1
       if(checkcalibration(Xs,piks,t,g))
          {
          arret1=arret 
          arret=n-length(g[flag==0])
          } else
          {
          cat("\nError : Impossible to find calibrated weights with these bounds\n")
          arret1=0
          arret=0
          }
        } 
   }
   else
   {
   cat("\nError : Impossible to find calibrated weights\n")
   arret1=0
   arret=0
   }
g
}

