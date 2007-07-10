strata<-function(data, stratanames=NULL, size, method=c("srswor","srswr","poisson","systematic"),pik,description=FALSE)
{
if(missing(method)) {warning("the method is not specified; by default, the method is srswor")
                     method="srswor"
                    }
if(!(method %in% c("srswor","srswr","poisson","systematic"))) 
  stop("the name of the method is wrong")
if(method %in% c("poisson","systematic") & missing(pik)) stop("the vector of probabilities is missing")
if(missing(stratanames)|is.null(stratanames))
   {
   if(method=="srswor")
	result=data.frame((1:nrow(data))[srswor(size,nrow(data))==1],rep(size/nrow(data),size))
   if(method=="srswr")
     {
      s=srswr(size,nrow(data))
      st=s[s!=0]
      l=length(st)
      result=data.frame((1:nrow(data))[s!=0])
      if(size<=nrow(data))    
          result=cbind.data.frame(result,st,prob=rep(size/nrow(data),l))
      else 
          {prob=rep(size/nrow(data),l)/sum(rep(size/nrow(data),l))
           result=cbind.data.frame(result,st,prob)
          }  
  
      colnames(result)=c("ID_unit","Replicates","Prob")
     }
   if(method=="poisson")
    {
     pikk=inclusionprobabilities(pik,size)
     s=(UPpoisson(pikk)==1)
     if(length(s)>0)
     result=data.frame((1:nrow(data))[s],pikk[s])
     if(description) 
      cat("\nPopulation total and number of selected units:",nrow(data),sum(s),"\n") 
     }
    if(method=="systematic")
    {
     pikk=inclusionprobabilities(pik,size)
     s=(UPsystematic(pikk)==1)
     result=data.frame((1:nrow(data))[s],pikk[s])
     }
   if(method!="srswr")
          colnames(result)=c("ID_unit","Prob")
   if(description & method!="poisson") cat("\nPopulation total and number of selected units:",nrow(data),sum(size),"\n")
   }
else
{
data=data.frame(data)
index=1:nrow(data)
m=match(stratanames,colnames(data))
if(any(is.na(m))) stop("the names of the strata are wrong")
data2=cbind.data.frame(data[,m])
x1=data.frame(unique(data[,m]))
colnames(x1)=stratanames
result=NULL
for(i in 1:nrow(x1))
	{
expr=rep(FALSE,nrow(data2))
for(j in 1:nrow(data2)) 
    expr[j]=all(data2[j,]==x1[i,])
y=index[expr]
if(description & method!="poisson") 
 {cat("Stratum" ,i,"\n")
  cat("\nPopulation total and number of selected units:",length(y),size[i],"\n")
  }
if(method!="srswr" & length(y)<size[i]) 
	{stop("not enough obervations for the stratum ", i, "\n") 
	 st=c(st,NULL)
       }
else
	{if(method=="srswor")
		{st=y[srswor(size[i],length(y))==1]
             r=x1[i,1]
             if(ncol(x1)>=2) 
             for(j in 2:ncol(x1))
                 r=cbind.data.frame(r,rep(x1[i,j],size[i]))
             r=cbind.data.frame(r,st,rep(size[i]/length(y),size[i]))
             }
       if(method=="systematic")
		{pikk=inclusionprobabilities(pik[y],size[i])
             s=(UPsystematic(pikk)==1)
             st=y[s]
             r=x1[i,1]
             if(ncol(x1)>=2)   
             for(j in 2:ncol(x1))
                 r=cbind.data.frame(r,rep(x1[i,j],size[i]))
             r=cbind.data.frame(r,st,pikk[s])
            }
 
	 if(method=="srswr") 
	   {s=srswr(size[i],length(y))
          st=cbind.data.frame(y[s!=0],s[s!=0])
          l=length(s[s!=0])
          r=x1[i,1]
          if(ncol(x1)>=2)  
          for(j in 2:ncol(x1))
             r=cbind.data.frame(r,rep(x1[i,j],l))   
          if(size[i]<=length(y))    
          r=cbind.data.frame(r,st,prob=rep(size[i]/length(y),l))
          else 
          {prob=rep(size[i]/length(y),l)/sum(rep(size[i]/length(y),l))
          r=cbind.data.frame(r,st,prob)}  
          }
       if(method=="poisson") 
		{pikk=inclusionprobabilities(pik[y],size[i])
             s=(UPpoisson(pikk)==1)
             if(any(s))
             { 
             st=y[s]
             r=x1[i,1]
             if(ncol(x1)>=2) 
 		 for(j in 2:ncol(x1))
                 r=cbind.data.frame(r,rep(x1[i,j],length(st)))
             r=cbind.data.frame(r,st,pikk[s])
            if(description) 
		 {cat("Stratum" ,i,"\n")
		  cat("\nPopulation total and number of selected units:",length(y),length(st),"\n")
		  }
               }
             else 
		{if(description) 
		 {cat("Stratum" ,i,"\n")
		  cat("\nPopulation total and number of selected units:",length(y),0,"\n")
              }
             r=NULL 
     	       }
            }
  
	}
if(!is.null(r))
	{
r=cbind(r,i)
result=rbind.data.frame(result,r)
        } 

 }  
if(method=="srswr")
colnames(result)=c(stratanames,"ID_unit","Replicates","Prob","Stratum")
else
colnames(result)=c(stratanames,"ID_unit","Prob","Stratum")
if(description)  {cat("Number of strata ",nrow(x1),"\n")
                  if(method=="poisson")
   			 cat("Total number of selected units", nrow(result),"\n")
                  else       
                  cat("Total number of selected units", sum(size),"\n")
                  }
}
result
}
