"inclusionprobabilities" <-
function(a,n)
{
nnull=length(a[(a==0)])
nneg=length(a[(a<0)])
if(nnull>0) cat("WARNING : There are ",null," null values\n")
if(nneg>0){
             cat("WARNING : There are ",nneg," negative value(s)")
             cat(" shifted to zero\n")
             a[(a<0)]=0
            }
pik=n*a/sum(a)
lll1=-1
list=(pik>=1)
lll=length(list[list==TRUE])
while(lll!=lll1 )
     {
     pik[(!list)]=(n-lll)*pik[(!list)]/sum(pik[(!list)])
     pik[(list)]=1
     lll1=lll
     list=(pik>=1)
     lll=length(list[list==TRUE])
     }
pik
}

