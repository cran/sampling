HTstrata<-function(y,pik,strata)
{
str<-function(st,h,n)
.C("str",as.double(st),as.integer(h),as.integer(n),s=double(n),PACKAGE="sampling")$s
if(is.matrix(y)) sample.size=nrow(y)
else sample.size=length(y)
h=unique(strata)
s1=0
for(i in 1:length(h))
 {s=str(strata,h[i],sample.size)
  s1=s1+HTestimator(y[s==1],pik[s==1]) 
  }
s1
}
