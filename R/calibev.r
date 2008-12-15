calibev<-function(Ys,Xs,total,pikl,d,g,q=rep(1,length(d)),with=FALSE,EPS=1e-6)
{
if(any(is.na(g))) 
   stop("There are missing values in g")
stopifnot((ns <- length(g)) >= 1)
if(min(pikl)==0) 
{ss=NULL
warning("There are zero values in the 'pikl' matrix. The variance estimator can not be computed.\n")
}
piks=as.vector(diag(pikl))
if(!checkcalibration(Xs,d,total,g,EPS)$result) 
stop("The calibration is not possible. The calibration estimator is not computed.\n")
if(is.data.frame(Xs)) Xs=as.matrix(Xs)
if(!is.vector(Ys)) Ys=as.vector(Ys)
if(is.matrix(Xs)) n=nrow(Xs)
else n=length(Xs)
if(ns!=length(Ys) | ns!=length(piks) | ns!=n | ns!=length(d)) stop("The parameters have different sizes.\n")
w<-g*d
e<-lm(Ys~Xs,weights=d*q)$res
ss<-0
for(k in 1:ns)
 {ss2<-0
 for(l in 1:ns)
       if(!with) 
       ss2<-ss2+(1-piks[k]*piks[l]/pikl[k,l])*w[k]*e[k]*w[l]*e[l]
       else 
       ss2<-ss2+(1-piks[k]*piks[l]/pikl[k,l])*d[k]*e[k]*d[l]*e[l]
 ss<-ss+ss2
 }
list(calest=sum(w*Ys),evar=as.numeric(ss))
}

