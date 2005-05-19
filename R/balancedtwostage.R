"balancedtwostage" <-
function(X,selection,m,n,PU,comment=TRUE,method=1)
###################################################################
#
# two stage sampling
#
# the function return a matrix with 4 vectors
# the units selected (0 or 1) 
# the final inclusion probabilities
# the units selected after the first stage
# the inclusion probabiities of the first stage
# the inclusion probabiities of the second stage
#
# 
# X the matrix of auxiliary variables on which the two stages are balanced
# selection =1 for simple random sampling at each stage
#           =2 for auto weighted two-stage sampling
# m number of primary units to select
# n number of secondary units to select
# comment=TRUE for a comment
#         FALSE without comment
####################################################################
{
N=dim(X)[1]
p=dim(X)[2]
str=cleanstrata(PU)
M=max(PU)
res1=balancedcluster(X,m,PU,method,TRUE)
if(selection==2) 
        {
         pik2=rep(n/N*M/m,times=N);
         if(n/N*M/m>1) cat("Error : at the second stage inclusion probabilities larger than 1");
         }
if(selection==1) 
        {
        pik2=inclusionprobastrata(str,rep(n/m ,times=max(str)));
        if(max(pik2)>1) cat("Error : at the second stage inclusion probabilities larger than 1");
        }
liste=(res1[,1]==1)
sf=rep(0,times=N)
sf[liste]=balancedstratification(array(X[liste,]/res1[,2][liste],c(sum(as.integer(liste)),p)),cleanstrata(str[liste]),pik2[liste],TRUE,method)
cbind(sf,res1[,2]*pik2,res1[,1],res1[,2],pik2)
}

