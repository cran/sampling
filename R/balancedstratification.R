"balancedstratification" <-
function(X,strat,pik,comment=TRUE,method=1)
{
strat=cleanstrata(strat)
H=max(strat)
N=dim(X)[1]
pikstar=rep(0,times=N)
for(h in 1:H) 
{
if(comment==TRUE) cat("\nFLIGHT PHASE OF STRATUM",h)
pikstar[strat==h]=fastflightcube(cbind(X[strat==h,],pik[strat==h]),pik[strat==h],1,comment) 
}
if(comment==TRUE) cat("\nFINAL TREATMENT")
XN=cbind(disjunctive(strat)*pik,X)/pik*pikstar
if(is.null(colnames(X))==FALSE)
    colnames(XN)<-c(paste("Stratum", 1:H, sep = ""),colnames(X))
samplecube(XN,pikstar,1,comment,method) 
}

