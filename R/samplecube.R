"samplecube" <-
function(X,pik,order=1,comment=TRUE,method=1) 
#
# return a balanced sample (a vector of 0 and 1)
# X is the matrix of balancing variables
# pik is the vector of inclusion probabilities
# order = 1 if the file is sorted randomly
#          = 2 if the file is not sorted
#          = 3 if the file is sorted in the decreasing order of the inclusion probabilities
#  comment =TRUE to have comments and FALSE otherwise
#  method = 1 for a landing phase by linear programming
#           2 for a landing phase by suppression of variables
######################################################
{
##########################################################
EPS = 1e-11
N=length(pik)
if(is.array(X)!=TRUE) X=array(X,c(N,length(X)/N)) 
if(method==1)
{
    if (length(pik[pik > EPS & pik < (1 - EPS)]) > 0) 
        pikstar = fastflightcube(X, pik, order, comment)
    else {
        if (comment == TRUE) 
            cat("\nNO FLIGHT PHASE")
        pikstar = pik
    }
    if (length(pikstar[pikstar > EPS & pikstar < (1 - EPS)]) > 
        0) 
        pikfin = landingcube(X, pikstar, pik, comment)
    else {
        if (comment == TRUE) 
            cat("\nNO LANDING PHASE")
        pikfin = pikstar
    }
}
else
{   p=length(X)/length(pik)
    pikstar=pik
    for(i in 0:(p-1))
      {
      if (length(pikstar[pikstar > EPS & pikstar < (1 - EPS)]) > 0) 
      pikstar = fastflightcube(X[,1:(p-i)]/pik*pikstar, pikstar, order, comment)
      }
      pikfin = pikstar
      for(i in 1:N) if(runif(1)<pikfin[i]) pikfin[i]=1
}
#######################################################
if (comment == TRUE) {
        A <- X[pik > EPS, ]/pik[pik > EPS]
        TOT = t(A) %*% pik[pik > EPS]
        EST = t(A) %*% pikfin[pik > EPS]
        DEV = 100 * (EST - TOT)/TOT
        cat("\n\nQUALITY OF BALANCING\n")
        if(is.null(colnames(X)))  Vn = as.character(1:length(TOT)) else Vn=colnames(X);
        for(i in 1:length(TOT)) if(Vn[i]=="") Vn[i]=as.character(i)
	ddddd = data.frame(TOTALS = c(TOT), 
        HorvitzThompson_estimators = c(EST), Relative_deviation = c(DEV))
        rownames(ddddd)<-Vn
        print(ddddd)
    }
    round(pikfin)
}
