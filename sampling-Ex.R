pkgname <- "sampling"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('sampling')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("HTestimator")
### * HTestimator

flush(stderr()); flush(stdout())

### Name: HTestimator
### Title: The Horvitz-Thompson estimator
### Aliases: HTestimator
### Keywords: survey

### ** Examples

# Belgian municipalities data base
data(belgianmunicipalities)
attach(belgianmunicipalities)
# Computes the inclusion probabilities
pik=inclusionprobabilities(Tot04,200)
N=length(pik)
n=sum(pik)
# Defines the variable of interest
y=TaxableIncome
# Draws a Poisson sample of expected size 200
s=UPpoisson(pik)
# Computes the Horvitz-Thompson estimator
HTestimator(y[s==1],pik[s==1])



cleanEx()
nameEx("HTstrata")
### * HTstrata

flush(stderr()); flush(stdout())

### Name: HTstrata
### Title: The Horvitz-Thompson estimator for a stratified design
### Aliases: HTstrata
### Keywords: survey

### ** Examples

# Swiss municipalities data base
data(swissmunicipalities)
# the variable 'REG' has 7 categories in the population 
# it is used as stratification variable
# computes the population stratum sizes
table(swissmunicipalities$REG)
# do not run
#  1   2   3   4   5   6   7
# 589 913 321 171 471 186 245
# the sample stratum sizes are given by size=c(30,20,45,15,20,11,44)
# the method is simple random sampling without replacement 
# (equal probability, without replacement)
st=strata(swissmunicipalities,stratanames=c("REG"),size=c(30,20,45,15,20,11,44), 
method="srswor")
# extracts the observed data
# the order of the columns is different from the order in the initial database
x=getdata(swissmunicipalities, st)
# computes the HT estimator of the variable Pop020 
HTstrata(x$Pop020,x$Prob,x$Stratum,description=TRUE)



cleanEx()
nameEx("Hajekestimator")
### * Hajekestimator

flush(stderr()); flush(stdout())

### Name: Hajekestimator
### Title: The Hajek estimator
### Aliases: Hajekestimator
### Keywords: survey

### ** Examples

# Belgian municipalities data base
data(belgianmunicipalities)
# Computes the inclusion probabilities
pik=inclusionprobabilities(belgianmunicipalities$Tot04,200)
N=length(pik)
n=sum(pik)
# Defines the variable of interest
y=belgianmunicipalities$TaxableIncome
# Draws a Poisson sample of expected size 200
s=UPpoisson(pik)
# Computes the Hajek estimator of the population mean
Hajekestimator(y[s==1],pik[s==1],type="mean")
# Computes the Hajek estimator of the population total
Hajekestimator(y[s==1],pik[s==1],N=N,type="total")



cleanEx()
nameEx("Hajekstrata")
### * Hajekstrata

flush(stderr()); flush(stdout())

### Name: Hajekstrata
### Title: The Hajek estimator for a stratified design
### Aliases: Hajekstrata
### Keywords: survey

### ** Examples

# Swiss municipalities data base
data(swissmunicipalities)
# the variable 'REG' has 7 categories in the population 
# it is used as stratification variable
# computes the population stratum sizes
table(swissmunicipalities$REG)
# do not run
#  1   2   3   4   5   6   7
# 589 913 321 171 471 186 245
# the sample stratum sizes are given by size=c(30,20,45,15,20,11,44)
# the method is simple random sampling without replacement 
# (equal probability, without replacement)
st=strata(swissmunicipalities,stratanames=c("REG"),size=c(30,20,45,15,20,11,44), 
method="srswor")
# extracts the observed data
# the order of the columns is different from the order in the swsissmunicipalities database
x=getdata(swissmunicipalities, st)
# computes the population sizes of strata
N=table(swissmunicipalities$REG)
N=N[unique(x$REG)]
# computes the Hajek estimator of the variable Pop020 
Hajekstrata(x$Pop020,x$Prob,x$Stratum,N,type="total",description=TRUE)


cleanEx()
nameEx("MU284")
### * MU284

flush(stderr()); flush(stdout())

### Name: MU284
### Title: The MU284 population
### Aliases: MU284
### Keywords: datasets

### ** Examples

data(MU284)
hist(MU284$RMT85)



cleanEx()
nameEx("UPbrewer")
### * UPbrewer

flush(stderr()); flush(stdout())

### Name: UPbrewer
### Title: Brewer sampling
### Aliases: UPbrewer
### Keywords: survey

### ** Examples

#define the inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
s=UPbrewer(pik)
#the sample is
(1:length(pik))[s==1]



cleanEx()
nameEx("UPmaxentropy")
### * UPmaxentropy

flush(stderr()); flush(stdout())

### Name: UPmaxentropy
### Title: Maximum entropy sampling with fixed sample size and unequal
###   probabilities
### Aliases: UPmaxentropy UPmaxentropypi2 UPMEqfromw UPMEpikfromq
###   UPMEpiktildefrompik UPMEsfromq UPMEpik2frompikw
### Keywords: survey

### ** Examples

############
## Example 1
############
# Simple example - sample selection 
pik=c(0.07,0.17,0.41,0.61,0.83,0.91)
# First method
UPmaxentropy(pik)
# Second method by using the intermediate procedures
n=sum(pik)
pikt=UPMEpiktildefrompik(pik)
w=pikt/(1-pikt)
q=UPMEqfromw(w,n)
UPMEsfromq(q)
# The matrix of inclusion probabilities
# First method: direct computation from pik
UPmaxentropypi2(pik)
# Second method: computation from pik and w
UPMEpik2frompikw(pik,w)
############
## Example 2
############
# Sample of Belgian municipalities
data(belgianmunicipalities)
attach(belgianmunicipalities)
n=200
pik=inclusionprobabilities(averageincome,n)
s=UPmaxentropy(pik)
#the sample is
as.character(Commune[s==1])
#the joint inclusion probabilities
pi2=UPmaxentropypi2(pik)
rowSums(pi2)/pik/n
############
## Example 3
############
# Selection of 200 samples of Belgian municipalities
# Once matrix q is computed, the selection of a sample is very quick.
# Simulations are thus possible.
data(belgianmunicipalities)
attach(belgianmunicipalities)
pik=inclusionprobabilities(averageincome,200)
pik=pik[pik!=1]
n=sum(pik)
pikt=UPMEpiktildefrompik(pik)
w=pikt/(1-pikt)
q=UPMEqfromw(w,n)
N=length(pik)
tt=rep(0,times=N)
#number of simulations; for accurate results, increase the value of 'sim'
sim=200
for(i in 1:sim) tt = tt+UPMEsfromq(q)
tt=tt/sim
sum(abs(tt-pik))



cleanEx()
nameEx("UPmidzuno")
### * UPmidzuno

flush(stderr()); flush(stdout())

### Name: UPmidzuno
### Title: Midzuno sampling
### Aliases: UPmidzuno
### Keywords: survey

### ** Examples

#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
s=UPmidzuno(pik)
#the sample is
(1:length(pik))[s==1]



cleanEx()
nameEx("UPmidzunopi2")
### * UPmidzunopi2

flush(stderr()); flush(stdout())

### Name: UPmidzunopi2
### Title: Joint inclusion probabilities for Midzuno sampling
### Aliases: UPmidzunopi2
### Keywords: survey

### ** Examples

#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#matrix of the joint inclusion probabilities
UPmidzunopi2(pik)



cleanEx()
nameEx("UPminimalsupport")
### * UPminimalsupport

flush(stderr()); flush(stdout())

### Name: UPminimalsupport
### Title: Minimal support sampling
### Aliases: UPminimalsupport
### Keywords: survey

### ** Examples

############
## Example 1
############
#defines the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#selects a sample
s=UPminimalsupport(pik)
#the sample is
(1:length(pik))[s==1]
############
## Example 2
############
data(belgianmunicipalities)
Tot=belgianmunicipalities$Tot04
name=belgianmunicipalities$Commune
pik=inclusionprobabilities(Tot,200)
#selects a sample
s=UPminimalsupport(pik)  
#the sample is
as.vector(name[s==1])



cleanEx()
nameEx("UPmultinomial")
### * UPmultinomial

flush(stderr()); flush(stdout())

### Name: UPmultinomial
### Title: Multinomial sampling
### Aliases: UPmultinomial
### Keywords: survey

### ** Examples

#defines the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#selects a sample
s=UPmultinomial(pik)
#the sample is
(1:length(pik))[s==1] 



cleanEx()
nameEx("UPopips")
### * UPopips

flush(stderr()); flush(stdout())

### Name: UPopips
### Title: Order pips sampling
### Aliases: UPopips
### Keywords: survey

### ** Examples

#define the working inclusion probabilities
lambda=c(0.2,0.7,0.8,0.5,0.4,0.4)
#draw a Pareto sample
s=UPopips(lambda, type="pareto")
#the sample is
s



cleanEx()
nameEx("UPpivotal")
### * UPpivotal

flush(stderr()); flush(stdout())

### Name: UPpivotal
### Title: Pivotal sampling
### Aliases: UPpivotal
### Keywords: survey

### ** Examples

#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
s=UPpivotal(pik)
#the sample is
(1:length(pik))[s==1]



cleanEx()
nameEx("UPpoisson")
### * UPpoisson

flush(stderr()); flush(stdout())

### Name: UPpoisson
### Title: Poisson sampling
### Aliases: UPpoisson
### Keywords: survey

### ** Examples

############
## Example 1
############
# definition of pik
pik=c(1/3,1/3,1/3)
# selects a sample
s=UPpoisson(pik)
#the sample is
(1:length(pik))[s==1]
############
## Example 2
############
data(belgianmunicipalities)
Tot=belgianmunicipalities$Tot04
name=belgianmunicipalities$Commune
n=200
pik=inclusionprobabilities(Tot,n)
# select a sample
s=UPpoisson(pik)  
#the sample is
getdata(name,s)



cleanEx()
nameEx("UPrandompivotal")
### * UPrandompivotal

flush(stderr()); flush(stdout())

### Name: UPrandompivotal
### Title: Random pivotal sampling
### Aliases: UPrandompivotal
### Keywords: survey

### ** Examples

#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
s=UPrandompivotal(pik)
#the sample is
(1:length(pik))[s==1]



cleanEx()
nameEx("UPrandomsystematic")
### * UPrandomsystematic

flush(stderr()); flush(stdout())

### Name: UPrandomsystematic
### Title: Random systematic sampling
### Aliases: UPrandomsystematic
### Keywords: survey

### ** Examples

#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
s=UPrandomsystematic(pik)
#the sample is
(1:length(pik))[s==1]



cleanEx()
nameEx("UPsampford")
### * UPsampford

flush(stderr()); flush(stdout())

### Name: UPsampford
### Title: Sampford sampling
### Aliases: UPsampford
### Keywords: survey

### ** Examples

#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
s=UPsampford(pik)
#the sample is
(1:length(pik))[s==1]



cleanEx()
nameEx("UPsampfordpi2")
### * UPsampfordpi2

flush(stderr()); flush(stdout())

### Name: UPsampfordpi2
### Title: Joint inclusion probabilities for Sampford sampling
### Aliases: UPsampfordpi2
### Keywords: survey

### ** Examples

#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#matrix of the joint inclusion probabilities
UPsampfordpi2(pik)



cleanEx()
nameEx("UPsystematic")
### * UPsystematic

flush(stderr()); flush(stdout())

### Name: UPsystematic
### Title: Systematic sampling
### Aliases: UPsystematic
### Keywords: survey

### ** Examples

############
## Example 1
############
#defines the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#selects a sample
s=UPsystematic(pik)
#the sample is
(1:length(pik))[s==1]
############
## Example 2
############
data(belgianmunicipalities)
Tot=belgianmunicipalities$Tot04
name=belgianmunicipalities$Commune
pik=inclusionprobabilities(Tot,200)
#selects a sample
s=UPsystematic(pik)  
#the sample is
as.vector(name[s==1])
# extracts the observed data
getdata(belgianmunicipalities,s)



cleanEx()
nameEx("UPsystematicpi2")
### * UPsystematicpi2

flush(stderr()); flush(stdout())

### Name: UPsystematicpi2
### Title: Joint inclusion probabilities for systematic sampling
### Aliases: UPsystematicpi2
### Keywords: survey

### ** Examples

#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#matrix of the joint inclusion probabilities
UPsystematicpi2(pik)



cleanEx()
nameEx("UPtille")
### * UPtille

flush(stderr()); flush(stdout())

### Name: UPtille
### Title: Tille sampling
### Aliases: UPtille
### Keywords: survey

### ** Examples

############
## Example 1
############
#defines the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#selects a sample
s=UPtille(pik)
#the sample is
(1:length(pik))[s==1]
############
## Example 2
############
# see the vignette (UPexamples.pdf)



cleanEx()
nameEx("UPtillepi2")
### * UPtillepi2

flush(stderr()); flush(stdout())

### Name: UPtillepi2
### Title: Joint inclusion probabilties for Tille sampling
### Aliases: UPtillepi2
### Keywords: survey

### ** Examples

#defines the prescribed inclusion probabilities 
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
pik_joint=UPtillepi2(pik)
#the joint inclusion probabilities  
pik_joint



cleanEx()
nameEx("balancedcluster")
### * balancedcluster

flush(stderr()); flush(stdout())

### Name: balancedcluster
### Title: Balanced cluster
### Aliases: balancedcluster
### Keywords: survey

### ** Examples

############
## Example 1
############
# definition of the clusters; there are 15 units in 3 clusters
cluster=c(1,1,1,1,1,2,2,2,2,2,3,3,3,3,3)
# matrix of balancing variables
X=cbind(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15))
# selection of 2 clusters
s=balancedcluster(X,2,cluster,2,TRUE)
# the sample of clusters with the inclusion probabilities of the clusters
s
# the selected clusters
unique(cluster[s[,1]==1])
# the selected units 
(1:length(cluster))[s[,1]==1]
# with the probabilities
s[s[,1]==1,2]
############
## Example 2
############
data(MU284)
X=cbind(MU284$P75,MU284$CS82,MU284$SS82,MU284$S82,MU284$ME84)
s=balancedcluster(X,10,MU284$CL,1,TRUE)
cluster=MU284$CL
# the selected clusters
unique(cluster[s[,1]==1])
# the selected units 
(1:length(cluster))[s[,1]==1]
# with the probabilities
s[s[,1]==1,2]



cleanEx()
nameEx("balancedstratification")
### * balancedstratification

flush(stderr()); flush(stdout())

### Name: balancedstratification
### Title: Balanced stratification
### Aliases: balancedstratification
### Keywords: survey

### ** Examples

############
## Example 1
############
# variable of stratification (3 strata)
strata=c(1,1,1,1,1,2,2,2,2,2,3,3,3,3,3)
# matrix of balancing variables
X=cbind(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15))
# Vector of inclusion probabilities.
# the sample has its size equal to 9.
pik=rep(3/5,times=15)
# selection of a stratified sample
s=balancedstratification(X,strata,pik,comment=TRUE)
# the sample is
(1:length(pik))[s==1]
############
## Example 2
############
data(MU284)
X=cbind(MU284$P75,MU284$CS82,MU284$SS82,MU284$S82,MU284$ME84)
strata=MU284$REG
pik=inclusionprobabilities(MU284$P75,80)
s=balancedstratification(X,strata,pik,TRUE)
############
## Example 3
############
data(swissmunicipalities)
swiss=swissmunicipalities
X=cbind(swiss$HApoly,
        swiss$Surfacesbois,
        swiss$P00BMTOT,
        swiss$P00BWTOT,
        swiss$POPTOT,
        swiss$Pop020,
        swiss$Pop2040,
        swiss$Pop4065,
        swiss$Pop65P,
        swiss$H00PTOT )
pik=inclusionprobabilities(swiss$POPTOT,400)
sample=balancedstratification(X,swiss$REG,pik,comment=TRUE)
#the sample is
as.character(swiss$Nom[sample==1])



cleanEx()
nameEx("balancedtwostage")
### * balancedtwostage

flush(stderr()); flush(stdout())

### Name: balancedtwostage
### Title: Balanced two-stage sampling
### Aliases: balancedtwostage
### Keywords: survey

### ** Examples

############
## Example 1
############
# definition of the primary units (3 primary units)
PU=c(1,1,1,1,1,2,2,2,2,2,3,3,3,3,3)
# matrix of balancing variables
X=cbind(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15))
# selection of 2 primary sampling units and 4 second-stage sampling units
s=balancedtwostage(X,1,2,4,PU,comment=TRUE)
# the sample and the inclusion probabilities
s
############
## Example 2
############
data(MU284)
X=cbind(MU284$P75,MU284$CS82,MU284$SS82,MU284$ME84)
N=dim(X)[1]
PU=MU284$CL
m=20
n=60
res=balancedtwostage(X,1,m,n,PU,TRUE)
# the sample and the inclusion probabilities
res



cleanEx()
nameEx("belgianmunicipalities")
### * belgianmunicipalities

flush(stderr()); flush(stdout())

### Name: belgianmunicipalities
### Title: The Belgian municipalities population
### Aliases: belgianmunicipalities
### Keywords: datasets

### ** Examples

data(belgianmunicipalities)
hist(belgianmunicipalities$medianincome)



cleanEx()
nameEx("calib")
### * calib

flush(stderr()); flush(stdout())

### Name: calib
### Title: g-weights of the calibration estimator
### Aliases: calib
### Keywords: survey

### ** Examples

############
## Example 1
############
# matrix of sample calibration variables 
Xs=cbind(
c(1,1,1,1,1,0,0,0,0,0),
c(0,0,0,0,0,1,1,1,1,1),
c(1,2,3,4,5,6,7,8,9,10)
)
# inclusion probabilities
piks=rep(0.2,times=10)
# vector of population totals
total=c(24,26,290)
# the g-weights using the truncated method
g=calib(Xs,d=1/piks,total,method="truncated",bounds=c(0.75,1.2))
# the calibration estimator of X is equal to 'total' vector
tcal=t(g/piks)%*%Xs
# the g-weights are between lower and upper bounds
g
############
## Example 2
############
# Example of g-weights (linear, raking, truncated, logit),
# with the data of Belgian municipalities as population.
# Firstly, a sample is selected by means of Poisson sampling.
# Secondly, the g-weights are calculated.
data(belgianmunicipalities)
attach(belgianmunicipalities)
# matrix of calibration variables for the population
X=cbind(
Men03/mean(Men03),
Women03/mean(Women03),
Diffmen,
Diffwom,
TaxableIncome/mean(TaxableIncome),
Totaltaxation/mean(Totaltaxation),
averageincome/mean(averageincome),
medianincome/mean(medianincome))
# selection of a sample with expectation size equal to 200
# by means of Poisson sampling
# the inclusion probabilities are proportional to the average income 
pik=inclusionprobabilities(averageincome,200)
N=length(pik)               # population size
s=UPpoisson(pik)            # sample
Xs=X[s==1,]                 # sample matrix of calibration variables
piks=pik[s==1]              # sample inclusion probabilities
n=length(piks)              # sample size
# vector of population totals of the calibration variables
total=c(t(rep(1,times=N))%*%X)  
# the population total 
total
# computation of the g-weights
# by means of different calibration methods.
g1=calib(Xs,d=1/piks,total,method="linear")
g2=calib(Xs,d=1/piks,total,method="raking")
g3=calib(Xs,d=1/piks,total,method="truncated",bounds=c(0.5,1.5))
g4=calib(Xs,d=1/piks,total,method="logit",bounds=c(0.5,1.5))
# In some cases, the calibration does not exist
# particularly when bounds are used.
# if the calibration is possible, the calibration estimator of Xs is printed
if(checkcalibration(Xs,d=1/piks,total,g1)$result) 
    print(c((g1/piks) %*% Xs)) else print("error")
if(!is.null(g2))
    if(checkcalibration(Xs,d=1/piks,total,g2)$result) 
        print(c((g2/piks) %*% Xs)) else print("error")
if(!is.null(g3))
    if(checkcalibration(Xs,d=1/piks,total,g3)$result) 
        print(c((g3/piks) %*% Xs)) else print("error")
if(!is.null(g4))
    if(checkcalibration(Xs,d=1/piks,total,g4)$result) 
        print(c((g4/piks) %*% Xs)) else print("error")
############
## Example 3
############
# Example of calibration and adjustment for nonresponse in the 'calibration' vignette
vignette("calibration", package="sampling")



cleanEx()
nameEx("calibev")
### * calibev

flush(stderr()); flush(stdout())

### Name: calibev
### Title: Calibration estimator and its variance estimation
### Aliases: calibev
### Keywords: survey

### ** Examples

############
## Example
############
# Example of g-weights (linear, raking, truncated, logit),
# with the data of Belgian municipalities as population.
# Firstly, a sample is selected by means of Poisson sampling.
# Secondly, the g-weights are calculated.
data(belgianmunicipalities)
attach(belgianmunicipalities)
# matrix of calibration variables for the population
X=cbind(
Men03/mean(Men03),
Women03/mean(Women03),
Diffmen,
Diffwom,
TaxableIncome/mean(TaxableIncome),
Totaltaxation/mean(Totaltaxation),
averageincome/mean(averageincome),
medianincome/mean(medianincome))
# selection of a sample with expected size equal to 200
# by means of Poisson sampling
# the inclusion probabilities are proportional to the average income 
pik=inclusionprobabilities(averageincome,200)
N=length(pik)               # population size
s=UPsystematic(pik)         # draws a sample s using systematic sampling    
Xs=X[s==1,]                 # matrix of sample calibration variables
piks=pik[s==1]              # sample inclusion probabilities
n=length(piks)              # sample size
# vector of population totals of the calibration variables
total=c(t(rep(1,times=N))%*%X)  
g1=calib(Xs,d=1/piks,total,method="linear") # computes the g-weights
pikl=UPsystematicpi2(pik)   # computes the matrix of the joint inclusion probabilities 
pikls=pikl[s==1,s==1]       # the same matrix for the units in s
Ys=Tot04[s==1]          # the variable of interest is Tot04 (for the units in s)
calibev(Ys,Xs,total,pikls,d=1/piks,g1,with=FALSE,EPS=1e-6)



cleanEx()
nameEx("checkcalibration")
### * checkcalibration

flush(stderr()); flush(stdout())

### Name: checkcalibration
### Title: Check calibration
### Aliases: checkcalibration
### Keywords: survey

### ** Examples

# matrix of auxiliary variables
Xs=cbind(c(1,1,1,1,1,0,0,0,0,0),c(0,0,0,0,0,1,1,1,1,1),c(1,2,3,4,5,6,7,8,9,10))
# inclusion probabilities
pik=rep(0.2,times=10)
# vector of totals
total=c(24,26,280)
# the g-weights
g=calib(Xs,d=1/pik,total,method="raking")
# the calibration is possible
checkcalibration(Xs,d=1/pik,total,g)



cleanEx()
nameEx("cleanstrata")
### * cleanstrata

flush(stderr()); flush(stdout())

### Name: cleanstrata
### Title: Clean strata
### Aliases: cleanstrata
### Keywords: survey

### ** Examples

# definition of the stratification variable
strata=c(-2,3,-2,3,4,4,4,-2,-2,3,4,0,0,0)
# renumber the strata
cleanstrata(strata)



cleanEx()
nameEx("cluster")
### * cluster

flush(stderr()); flush(stdout())

### Name: cluster
### Title: Cluster sampling
### Aliases: cluster
### Keywords: survey

### ** Examples

############
## Example 1
############
# Uses the swissmunicipalities data to draw a sample of clusters
data(swissmunicipalities)
# the variable 'REG' has 7 categories in the population
# it is used as clustering variable
# the sample size is 3; the method is simple random sampling without replacement
cl=cluster(swissmunicipalities,clustername=c("REG"),size=3,method="srswor")
# extracts the observed data 
# the order of the columns is different from the order in the initial database
getdata(swissmunicipalities, cl)
############
## Example 2
############
# the same data as in Example 1
# the sample size is 3; the method is systematic sampling
# the pik vector is randomly generated using the U(0,1) distribution
cl_sys=cluster(swissmunicipalities,clustername=c("REG"),size=3,method="systematic",
pik=runif(7))
# extracts the observed data
getdata(swissmunicipalities,cl_sys)



cleanEx()
nameEx("disjunctive")
### * disjunctive

flush(stderr()); flush(stdout())

### Name: disjunctive
### Title: Disjunctive combination
### Aliases: disjunctive
### Keywords: survey

### ** Examples

# definition of the variable of stratification
strata=c(-2,3,-2,3,4,4,4,-2,-2,3,4,0,0,0)
# computation of the matrix
disjunctive(strata)



cleanEx()
nameEx("fastflightcube")
### * fastflightcube

flush(stderr()); flush(stdout())

### Name: fastflightcube
### Title: Fast flight phase for the cube method
### Aliases: fastflightcube
### Keywords: survey

### ** Examples

# Matrix of balancing variables
X=cbind(c(1,1,1,1,1,1,1,1,1),c(1,2,3,4,5,6,7,8,9))
# Vector of inclusion probabilities.
# The sample size is 3.
pik=c(1/3,1/3,1/3,1/3,1/3,1/3,1/3,1/3,1/3)
# pikstar is almost a balanced sample and is ready for the landing phase
pikstar=fastflightcube(X,pik,order=1,comment=TRUE)
pikstar



cleanEx()
nameEx("gencalib")
### * gencalib

flush(stderr()); flush(stdout())

### Name: gencalib
### Title: g-weights of the generalized calibration estimator
### Aliases: gencalib

### ** Examples

############
## Example 1
############
# matrix of sample calibration variables 
Xs=cbind(
c(1,1,1,1,1,0,0,0,0,0),
c(0,0,0,0,0,1,1,1,1,1),
c(1,2,3,4,5,6,7,8,9,10))
# inclusion probabilities
piks=rep(0.2,times=10)
# vector of population totals
total=c(24,26,290)
# matrix of instrumental variables
Zs=Xs+matrix(runif(nrow(Xs)*ncol(Xs)),nrow(Xs),ncol(Xs))
# the g-weights using the truncated method
g=gencalib(Xs,Zs,d=1/piks,total,method="truncated",bounds=c(0.5,1.5))
# the calibration estimator of X is equal to the 'total' vector
t(g/piks)%*%Xs
# the g-weights are between lower and upper bounds
summary(g)
############
## Example 2
############
# Example of generalized g-weights (linear, raking, truncated, logit),
# with the data of Belgian municipalities as population.
# Firstly, a sample is selected by means of Poisson sampling.
# Secondly, the g-weights are calculated.
data(belgianmunicipalities)
attach(belgianmunicipalities)
# matrix of calibration variables for the population
X=cbind(Totaltaxation/mean(Totaltaxation),medianincome/mean(medianincome))
# selection of a sample with expected size equal to 200
# by means of Poisson sampling
# the inclusion probabilities are proportional to the average income 
pik=inclusionprobabilities(averageincome,200)
N=length(pik)               # population size
s=UPpoisson(pik)            # sample
Xs=X[s==1,]                 # sample calibration variable matrix 
piks=pik[s==1]              # sample inclusion probabilities
n=length(piks)              # sample size
# vector of population totals of the calibration variables
total=c(t(rep(1,times=N))%*%X)  
# the population total
total
Z=cbind(TaxableIncome/mean(TaxableIncome),averageincome/mean(averageincome))
# defines the instrumental variables
Zs=Z[s==1,]
# computation of the generalized g-weights
# by means of different generalized calibration methods
g1=gencalib(Xs,Zs,d=1/piks,total,method="linear")
g2=gencalib(Xs,Zs,d=1/piks,total,method="raking")
g3=gencalib(Xs,Zs,d=1/piks,total,method="truncated",bounds=c(0.5,8))
g4=gencalib(Xs,Zs,d=1/piks,total,method="logit",bounds=c(0.5,1.5))
# In some cases, the calibration does not exist
# particularly when bounds are used.
# if the calibration is possible, the calibration estimator of Xs is printed
if(checkcalibration(Xs,d=1/piks,total,g1)$result) print(c((g1/piks)%*% Xs)) else print("error")
if(!is.null(g2))
if(checkcalibration(Xs,d=1/piks,total,g2)$result) print(c((g2/piks)%*% Xs)) else print("error")
if(!is.null(g3))
if(checkcalibration(Xs,d=1/piks,total,g3)$result) print(c((g3/piks)%*% Xs)) else print("error")
if(!is.null(g4))
if(checkcalibration(Xs,d=1/piks,total,g4)$result) print(c((g4/piks)%*% Xs)) else print("error")



cleanEx()
nameEx("getdata")
### * getdata

flush(stderr()); flush(stdout())

### Name: getdata
### Title: Get data
### Aliases: getdata
### Keywords: survey

### ** Examples

############
## Example 1
############
# Generates artificial data (a 235X3 matrix with 3 columns: state, region, income).
# The variable 'state' has 2 categories (nc and sc); 
# the variable 'region' has 3 categories (1, 2 and 3);
# the variable 'income' is generated using the U(0,1) distribution.
data=rbind(matrix(rep("nc",165),165,1,byrow=TRUE),
matrix(rep("sc",70),70,1,byrow=TRUE))
data=cbind.data.frame(data,c(rep(1,100), rep(2,50), rep(3,15), rep(1,30),rep(2,40)),
1000*runif(235))
names(data)=c("state","region","income")
# the inclusion probabilities are computed using the variable 'income'
pik=inclusionprobabilities(data$income,20)
# draw a sample s using systematic sampling (sample size is 20)
s=UPsystematic(pik) 
# extracts the observed data
getdata(data,s)
############
## Example 2
############
# see other examples in 'strata', 'cluster', 'mstage' help files



cleanEx()
nameEx("inclusionprobabilities")
### * inclusionprobabilities

flush(stderr()); flush(stdout())

### Name: inclusionprobabilities
### Title: Inclusion probabilities
### Aliases: inclusionprobabilities
### Keywords: survey

### ** Examples

############
## Example 1
############
# a vector of positive numbers
a=1:20
# computation of the inclusion probabilities for a sample size n=12
pik=inclusionprobabilities(a,12)
pik
############
## Example 2
############
# Computation of the inclusion probabilities proportional to the number 
# of inhabitants in each municipality of the Belgian database.
data(belgianmunicipalities)
pik=inclusionprobabilities(belgianmunicipalities$Tot04,200)
# the first-order inclusion probabilities for each municipality
data.frame(pik=pik,name=belgianmunicipalities$Commune)
# the inclusion probability sum is equal to the sample size
sum(pik)



cleanEx()
nameEx("inclusionprobastrata")
### * inclusionprobastrata

flush(stderr()); flush(stdout())

### Name: inclusionprobastrata
### Title: Inclusion probabilities for a stratified design
### Aliases: inclusionprobastrata
### Keywords: survey

### ** Examples

# the strata
strata=c(1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,3)
# sample size in each stratum
nh=c(2,3,3)
inclusionprobastrata(strata,nh)



cleanEx()
nameEx("landingcube")
### * landingcube

flush(stderr()); flush(stdout())

### Name: landingcube
### Title: Landing phase for the cube method
### Aliases: landingcube
### Keywords: survey

### ** Examples

# matrix of balancing variables
X=cbind(c(1,1,1,1,1,1,1,1,1),c(1.1,2.2,3.1,4.2,5.1,6.3,7.1,8.1,9.1))
# Vector of inclusion probabilities
# The sample has the size equal to 3.
pik=c(1/3,1/3,1/3,1/3,1/3,1/3,1/3,1/3,1/3)
# pikstar is almost a balanced sample and is ready for the landing phase
pikstar=fastflightcube(X,pik,order=1,comment=TRUE)
# selection of the sample s
s=landingcube(X,pikstar,pik,comment=TRUE)
round(s)



cleanEx()
nameEx("mstage")
### * mstage

flush(stderr()); flush(stdout())

### Name: mstage
### Title: Multistage sampling
### Aliases: mstage
### Keywords: survey

### ** Examples

############
## Example 1
############
# Two-stage cluster sampling
# Uses the 'swissmunicipalities' data for drawing a sample of units
data(swissmunicipalities)
# the variable 'REG' (region) has 7 categories;
# it is used as clustering variable in the first-stage sample
# the variable 'CT' (canton) has 26 categories; 
# it is used as clustering variable in the second-stage sample
# 4 clusters (regions) are selected in the first-stage 
# 1 canton is selected in the second-stage from each sampled cluster 
# the method is simple random sampling without replacement 
# (equal probability, without replacement)
m=mstage(swissmunicipalities,stage=list("cluster","cluster"), varnames=list("REG","CT"),
size=list(4,c(1,1,1,1)), method="srswor")
# the first stage is m$'1' and the second stage is m$'2'
# extracts the observed data
# the order of the columns is different from the order in the swsissmunicipalities database
getdata(swissmunicipalities, m)
############
## Example 2
############
# Two-stage element sampling
# Example from An and Watts (New SAS procedures for Analysis of Sample Survey Data)
# Generates artificial data (a 235X3 matrix with 3 columns: state, region, income).
# The variable "state" has 2 categories ('nc' and 'sc'). 
# The variable "region" has 3 categories (1, 2 and 3).
# The variable "income" is generated using the U(0,1) distribution. 
data=rbind(matrix(rep("nc",165),165,1,byrow=TRUE),matrix(rep("sc",70),70,1,byrow=TRUE))
data=cbind.data.frame(data,c(rep(1,100),rep(2,50),rep(3,15),rep(1,30),rep(2,40)),
100*runif(235))
names(data)=c("state","region","income")
# the method is simple random sampling with replacement
# 25 units are drawn in the first-stage
# in the second-stage, 10 units are drawn from the already 25 selected units
m=mstage(data,size=list(25,10),method="srswr") 
# extracts the observed data
getdata(data,m)
############
## Example 3
############
# One-stage stratified cluster sampling
# The same data as in Example 2
# the variable 'state' is used as stratification variable 
# 20 states are drawn in the first stratum and 10 states in the second stratum
# the variable 'region' is used as clustering variable
# 1 cluster (region) is drawn in each stratum
m=mstage(data, stage=list("stratified","cluster"), varnames=list("state","region"), 
size=list(c(20,10),c(1,1)),method="srswor") 
# extracts the observed data
getdata(data,m)
############
## Example 4
############
# Two-stage cluster sampling
# The same data as in Example 1
data(swissmunicipalities)
# in the first-stage, the clustering variable is 'REG' (region) with 7 categories
# each region is selected with the probability 1/7
# in the second-stage, the clustering variable is 'CT'(canton) with 26 categories
# in the region 1, there are 3 cantons and each canton is selected with the prob. 1/3
# in the region 2, there are 5 cantons and each canton is selected with the prob. 1/5
# in the region 3, there are 3 cantons and each canton is selected with the prob. 1/3
# in the region 4, there is 1 canton, which it is selected with the prob. 1
# in the region 5, there are 7 cantons and each canton is selected with the prob. 1/7
# in the region 6, there are 6 cantons and each canton is selected with the prob. 1/6
# in the region 7, there is 1 canton, which it is selected with the prob. 1
# it is necessary to use a list of selection probabilities at each stage
# prob is the list of the selection probabilities
# the method is systematic sampling (unequal probabilities, without replacement)
# 4 clusters (regions) are drawn in the first-stage 
# 1 cluster (canton) is drawn from each selected region in the second-stage
# ls is the list of sizes
ls=list(4,c(1,1,1,1))
prob=list(rep(4/7,7),list(rep(1/3,3),rep(1/5,5),rep(1/3,3),rep(1,1),rep(1/7,7),
rep(1/6,6),rep(1,1)))
m=mstage(swissmunicipalities,stage=list("cluster","cluster"),varnames=list("REG","CT"),
size=ls, method="systematic",pik=prob)
# extracts the observed data
getdata(swissmunicipalities,m)



cleanEx()
nameEx("postest")
### * postest

flush(stderr()); flush(stdout())

### Name: postest
### Title: The poststratified estimator
### Aliases: postest
### Keywords: survey

### ** Examples

############
## Example 1
############
#stratified sampling and poststratification
# Swiss municipalities data base
data(swissmunicipalities)
attach(swissmunicipalities)
# the variable 'REG' has 7 categories in the population
# it is used as stratification variable
# Computes the population stratum sizes
table(swissmunicipalities$REG)
# do not run
#  1   2   3   4   5   6   7 
# 589 913 321 171 471 186 245 
# the sample stratum sizes are given by size=c(30,20,45,15,20,11,44)
# the method is simple random sampling without replacement 
st=strata(swissmunicipalities,stratanames=c("REG"),
size=c(30,20,45,15,20,11,44), method="srswor")
# extracts the observed data
# the order of the columns is different from the order in the initial database
x=getdata(swissmunicipalities, st)
px=poststrata(x,"REG")
ct=unique(px$data$REG)
yy=numeric(length(ct))
for(i in 1:length(ct))
  {xx=swissmunicipalities[REG==ct[i],]
   yy[i]=nrow(xx)
  }
yy
postest(px$data,y=px$data$Pop020,pik=px$data$Prob,NG=diag(yy),description=TRUE)
HTstrata(x$Pop020,x$Prob,x$Stratum)
#the two estimators are equal
############
## Example 2
############
# systematic sampling and poststratification
# Belgian municipalities data base
data(belgianmunicipalities)
Tot=belgianmunicipalities$Tot04
name=belgianmunicipalities$Commune
pik=inclusionprobabilities(Tot,200)
#selects a sample
s=UPsystematic(pik)  
#the sample is
as.vector(name[s==1])
# extracts the observed data
b=getdata(belgianmunicipalities,s)
attach(belgianmunicipalities)
pb=poststrata(b,"Province") 
#computes the population frequency in each group
ct=unique(pb$data$Province)
yy=numeric(length(ct))
for(i in 1:length(ct))
  {xx=belgianmunicipalities[Province==ct[i],]
   yy[i]=nrow(xx)
  }
postest(pb$data,y=pb$data$TaxableIncome,pik=pik[s==1],NG=yy,description=TRUE)
HTestimator(pb$data$TaxableIncome,pik=pik[s==1])
############
## Example 3
############
#cluster sampling and postratification
# Swiss municipalities data base
data(swissmunicipalities)
# the variable 'REG' has 7 categories in the population
# it is used as clustering variable
# the sample size is 3; the method is simple random sampling without replacement
cl=cluster(swissmunicipalities,clustername=c("REG"),size=3,method="srswor")
# extracts the observed data 
# the order of the columns is different from the order in the initial database
c=getdata(swissmunicipalities, cl)
pc=poststrata(c,"CT") 
#computes the population frequency in each group
ct=unique(pc$data$CT)
yy=numeric(length(ct))
for(i in 1:length(ct))
  {xx=swissmunicipalities[CT==ct[i],]
   yy[i]=nrow(xx)
  }
postest(pc$data,y=pc$data$Pop020,pik=pc$data$Prob,NG=yy,description=TRUE)
############
## Example 4
############
#postratification with two criteria
#artificial data frame
data=rbind(matrix(rep("nc",165),165,1,byrow=TRUE),matrix(rep("sc",70),70,1,byrow=TRUE))
data=cbind.data.frame(data,c(rep(1,100), rep(2,50), rep(3,15), rep(1,30),rep(2,40)),
1000*runif(235))
names(data)=c("state","region","income")
# computes the population stratum sizes
table(data$region,data$state)
# not run
#     nc  sc
#  1 100  30
#  2  50  40
#  3  15   0
#selects a sample of size 10
s=srswor(10,nrow(data))  
# postratification using region and state
ps=poststrata(data[s==1,],c("region","state"))
#computes the population frequency in each group
ct=unique(ps$data$poststratum)
yy=numeric(length(ct))
for(i in 1:length(ct))
  {
   xy=ps$data[ps$data$poststratum==ct[i],]
   xstate=unique(xy$state)
   ystate=unique(xy$region)
   xx=data[data$state==xstate & data$region==ystate,]
   yy[i]=nrow(xx)
  }
postest(ps$data,y=ps$data$income,pik=rep(10/nrow(data),10),NG=yy,description=TRUE)



cleanEx()
nameEx("poststrata")
### * poststrata

flush(stderr()); flush(stdout())

### Name: poststrata
### Title: Postratification
### Aliases: poststrata
### Keywords: survey

### ** Examples

# Example from An and Watts (New SAS procedures for Analysis of Sample Survey Data)
# generates artificial data (a 235X3 matrix with 3 columns: state, region, income).
# the variable "state" has 2 categories ('nc' and 'sc'). 
# the variable "region" has 3 categories (1, 2 and 3).
# the income variable is randomly generated
data=rbind(matrix(rep("nc",165),165,1,byrow=TRUE),matrix(rep("sc",70),70,1,byrow=TRUE))
data=cbind.data.frame(data,c(rep(1,100), rep(2,50), rep(3,15), rep(1,30),rep(2,40)),
1000*runif(235))
names(data)=c("state","region","income")
# computes the population stratum sizes
table(data$region,data$state)
# not run
#     nc  sc
#  1 100  30
#  2  50  40
#  3  15   0
# postratification using two criteria: state and region
poststrata(data,postnames=c("state","region"))     



cleanEx()
nameEx("ratioest")
### * ratioest

flush(stderr()); flush(stdout())

### Name: ratioest
### Title: The ratio estimator
### Aliases: ratioest
### Keywords: survey

### ** Examples

data(MU284)
# there are 3 outliers which are deleted from the population
MU281=MU284[MU284$RMT85<=3000,]
attach(MU281)
# computes the inclusion probabilities using the variable P85; sample size 120
pik=inclusionprobabilities(P85,120)
# defines the variable of interest
y=RMT85
# defines the auxiliary information
x=CS82
# draws a systematic sample of size 120
s=UPsystematic(pik)
# computes the ratio estimator
ratioest(y[s==1],x[s==1],sum(x),pik[s==1])



cleanEx()
nameEx("ratioest_strata")
### * ratioest_strata

flush(stderr()); flush(stdout())

### Name: ratioest_strata
### Title: The ratio estimator for a stratified design
### Aliases: ratioest_strata
### Keywords: survey

### ** Examples

###########
# Example 1
###########
# this example uses MU284 data with the 'REG' variable for stratification
data(MU284)
attach(MU284)
# there are 3 outliers which are deleted from the population
MU281=MU284[RMT85<=3000,]
detach(MU284)
attach(MU281)
# computes the inclusion probabilities using the variable P85
pik=inclusionprobabilities(P85,120)
# defines the variable of interest
y=RMT85
# defines the auxiliary information
x=CS82
# computes the population stratum sizes
table(MU281$REG)
# not run
# 1  2  3  4  5  6  7  8 
# 24 48 32 37 55 41 15 29 
# a sample is drawn in each region
# the sample stratum sizes are given by size=c(4,10,8,4,6,4,6,7)
s=strata(MU281,c("REG"),size=c(4,10,8,4,6,4,6,7), method="systematic",pik=P85)
# extracts the observed data
MU281sample=getdata(MU281,s)
# computes the population x-totals in each stratum
TX_strata=as.vector(tapply(CS82,list(REG),FUN=sum))
# computes the ratio estimator
ratioest_strata(MU281sample$RMT85,MU281sample$CS82,TX_strata,
MU281sample$Prob,MU281sample$Stratum)
###########
# Example 2
###########
# this is an artificial example (see Example 1 in the 'strata' function)
# there are 4 columns: state, region, income and aux
# 'income' is the variable of interest, and 'aux' is the auxiliary information 
# which is correlated to the income
data=rbind(matrix(rep("nc",165),165,1,byrow=TRUE),matrix(rep("sc",70),70,1,byrow=TRUE))
data=cbind.data.frame(data,c(rep(1,100), rep(2,50), rep(3,15), rep(1,30),rep(2,40)),
1000*runif(235))
names(data)=c("state","region","income")
attach(data)
aux=income+rnorm(length(income),0,1)
data=cbind.data.frame(data,aux)
# computes the population stratum sizes
table(data$region,data$state)
# not run
#     nc  sc
#  1 100  30
#  2  50  40
#  3  15   0
# there are 5 cells with non-zero values; one draws 5 samples (1 sample in each stratum)
# the sample stratum sizes are 10,5,10,4,6, respectively
# the method is 'srswor' (equal probability, without replacement)
s=strata(data,c("region","state"),size=c(10,5,10,4,6), method="srswor")
# extracts the observed data
xx=getdata(data,s)
# computes the population x-total for each stratum
TX_strata=na.omit(as.vector(tapply(aux,list(region,state),FUN=sum)))
# computes the ratio estimator 
ratioest_strata(xx$income,xx$aux,TX_strata,xx$Prob,xx$Stratum,description=TRUE)



cleanEx()
nameEx("regest")
### * regest

flush(stderr()); flush(stdout())

### Name: regest
### Title: The regression estimator
### Aliases: regest
### Keywords: survey

### ** Examples

# uses the MU284 population to draw a systematic sample
data(MU284)
# there are 3 outliers which are deleted from the population
MU281=MU284[MU284$RMT85<=3000,]
attach(MU281)
# computes the inclusion probabilities using the variable P85; sample size 40
pik=inclusionprobabilities(P85,40)
# the joint inclusion probabilities for systematic sampling
pikl=UPsystematicpi2(pik)
# draws a systematic sample of size 40
s=UPsystematic(pik)
# defines the variable of interest
y=RMT85[s==1]
# defines the auxiliary information
x1=CS82[s==1]
x2=SS82[s==1]
# the joint inclusion probabilities for s
pikls=pikl[s==1,s==1]
# the first-order inclusion probabilities for s
piks=pik[s==1]
# computes the regression estimator with the model y~x1+x2-1 
r=regest(formula=y~x1+x2-1,Tx=c(sum(CS82),sum(SS82)),weights=1/piks,pikl=pikls,n=40)
# the regression estimator is
r$regest
# the beta coefficients are
r$coefficients
# regression estimator is the same as the calibration estimator 
Xs=cbind(x1,x2)
total=c(sum(CS82),sum(SS82))
g1=calib(Xs,d=1/piks,total,method="linear")
checkcalibration(Xs,d=1/piks,total,g1)
calibev(y,Xs,total,pikls,d=1/piks,g1,with=TRUE,EPS=1e-6)



cleanEx()
nameEx("regest_strata")
### * regest_strata

flush(stderr()); flush(stdout())

### Name: regest_strata
### Title: The regression estimator for a stratified design
### Aliases: regest_strata
### Keywords: survey

### ** Examples

# generates artificial data
y=rgamma(10,3)
x=y+rnorm(10)
Stratum=c(1,1,2,2,2,3,3,3,3,3)
# population size
N=200
# sample size
n=10
# assume proportional allocation, nh/Nh=n/N 
pikl=matrix(0,n,n)
for(i in 1:n)
 {for(j in 1:n)
  if(i!=j)
      pikl[i,j]=pikl[j,i]=n*(n-1)/(N*(N-1))
  pikl[i,i]=n/N
  }
regest_strata(formula=y~x-1,weights=rep(N/n,n),Tx_strata=c(50,30,40),
strata=Stratum,pikl,description=TRUE)



cleanEx()
nameEx("rhg")
### * rhg

flush(stderr()); flush(stdout())

### Name: rhg
### Title: Response homogeneity groups
### Aliases: rhg
### Keywords: survey

### ** Examples

# defines the inclusion probabilities for the population
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
# X is the population data frame
X=cbind.data.frame(pik,c("A","B","A","A","C","B"))
names(X)=c("Prob","town")
# selects a sample using systematic sampling
s=UPsystematic(pik)
# Xs is the sample data frame
Xs=getdata(X,s)
# adds the status column to Xs (1 - sample respondent, 0 otherwise)
Xs=cbind.data.frame(Xs,status=c(1,0,1))
# creates the response homogeneity groups using the 'town' variable
rhg(Xs,selection="town")



cleanEx()
nameEx("rhg_strata")
### * rhg_strata

flush(stderr()); flush(stdout())

### Name: rhg_strata
### Title: Response homogeneity groups for a stratified sampling
### Aliases: rhg_strata
### Keywords: survey

### ** Examples

############
## Example 1
############
# uses Example 2 from the 'strata' function help file
data=rbind(matrix(rep("nc",165),165,1,byrow=TRUE),matrix(rep("sc",70),70,1,byrow=TRUE))
data=cbind.data.frame(data,c(rep(1,100), rep(2,50), rep(3,15), rep(1,30),rep(2,40)),
1000*runif(235))
names(data)=c("state","region","income")
# draws a sample
s1=strata(data,c("region","state"),size=c(10,5,10,4,6), method="systematic",
pik=data$income)
# extracts the observed data
s1=getdata(data,s1)
# generates randomly the 'status' variable (1-sample respondent, 0-otherwise)
status=runif(nrow(s1))
for(i in 1:length(status))
 if(status[i]<0.3)  status[i]=0 else status[i]=1
# adds the 'status' variable to the sample data frame s1
s1=cbind.data.frame(s1,status)
# creates classes of income using the median of income
# suppose that the income is available for all units in sample
classincome=numeric(nrow(s1))
for(i in 1:length(classincome))
 if(s1$income[i]<median(s1$income))  classincome[i]=1 else classincome[i]=2
# adds 'classincome' to s1
s1=cbind.data.frame(s1,classincome)
# computes the response homogeneity groups using the 'classincome' variable   
rhg_strata(s1,selection=c("classincome"))
############
## Example 2
############
# the same data as in Example 1
# but we also add the 'sex' column (1-female, 2-male)
# suppose that the sex is available for all units in sample
sex=c(rep(1,12),rep(2,8),rep(1,10),rep(2,5))
s1=cbind.data.frame(s1,sex)
# computes the response homogeneity groups using the 'classincome' and 'sex' variables   
rhg_strata(s1,selection=c("classincome","sex"))



cleanEx()
nameEx("rmodel")
### * rmodel

flush(stderr()); flush(stdout())

### Name: rmodel
### Title: Response probability using logistic regression
### Aliases: rmodel
### Keywords: survey

### ** Examples

# Example from An and Watts (New SAS procedures for Analysis of Sample Survey Data)
# generates artificial data (a 235X3 matrix with 3 columns: state, region, income).
# the variable "state" has 2 categories ('nc' and 'sc'). 
# the variable "region" has 3 categories (1, 2 and 3).
# the sampling frame is stratified by region within state.
# the income variable is randomly generated
data=rbind(matrix(rep("nc",165),165,1,byrow=TRUE),matrix(rep("sc",70),70,1,byrow=TRUE))
data=cbind.data.frame(data,c(rep(1,100), rep(2,50), rep(3,15), rep(1,30),rep(2,40)),
1000*runif(235))
names(data)=c("state","region","income")
# computes the population stratum sizes
table(data$region,data$state)
# not run
#     nc  sc
#  1 100  30
#  2  50  40
#  3  15   0
# there are 5 cells with non-zero values; one draws 5 samples (1 sample in each stratum)
# the sample stratum sizes are 10,5,10,4,6, respectively
# the method is 'srswor' (equal probability, without replacement)
s=strata(data,c("region","state"),size=c(10,5,10,4,6), method="srswor")
# extracts the observed data
x=getdata(data,s)
# generates randomly the 'status' column (1 - respondent, 0 - nonrespondent)
status=round(runif(nrow(x)))
x=cbind(x,status)
# computes the response probabilities 
rmodel(x$status~x$income+x$Stratum,weights=1/x$Prob,x)
# the same example without stratification
rmodel(x$status~x$income,weights=1/x$Prob,x)



cleanEx()
nameEx("samplecube")
### * samplecube

flush(stderr()); flush(stdout())

### Name: samplecube
### Title: Sample cube method
### Aliases: samplecube
### Keywords: survey

### ** Examples

############
## Example 1
############
# matrix of balancing variables
X=cbind(c(1,1,1,1,1,1,1,1,1),c(1.1,2.2,3.1,4.2,5.1,6.3,7.1,8.1,9.1))
# vector of inclusion probabilities
# the sample size is 3.
pik=c(1/3,1/3,1/3,1/3,1/3,1/3,1/3,1/3,1/3)
# selection of the sample
s=samplecube(X,pik,order=1,comment=TRUE)
# The selected sample
(1:length(pik))[s==1]
############
## Example 2
############
# 2 strata and 2 auxiliary variables
# we verify the values of the inclusion probabilities by simulations
X=rbind(c(1,0,1,2),c(1,0,2,5),c(1,0,3,7),c(1,0,4,9),
c(1,0,5,1),c(1,0,6,5),c(1,0,7,7),c(1,0,8,6),c(1,0,9,9),
c(1,0,10,3),c(0,1,11,3),c(0,1,12,2),c(0,1,13,3),
c(0,1,14,6),c(0,1,15,8),c(0,1,16,9),c(0,1,17,1),
c(0,1,18,2),c(0,1,19,3),c(0,1,20,4))
pik=rep(1/2,times=20)
ppp=rep(0,times=20)
sim=100 #for accurate results increase this value
for(i in (1:sim))
	ppp=ppp+samplecube(X,pik,1,FALSE) 
ppp=ppp/sim
print(ppp)
print(pik)
############
## Example 3
############
# unequal probability sampling by cube method
# one auxiliary variable equal to the inclusion probability
N=200
pik=runif(N)
pikfin=samplecube(array(pik,c(N,1)),pik,1,TRUE)
############ 
## Example 4
############
# p auxiliary variables generated randomly
N=1000
p=7
x=rnorm(N*p,10,3)
# random inclusion probabilities 
pik= runif(N)
X=array(x,c(N,p))
X=cbind(cbind(X,rep(1,times=N)),pik)
pikfin=samplecube(X,pik,1,TRUE)
############ 
## Example 5
############
# strata and an auxiliary variable
N=5000
a=rep(1,times=N)
b=rep(0,times=N)
V1=c(a,b,b)
V2=c(b,a,b)
V3=c(b,b,a)
X=cbind(V1,V2,V3)
pik=rep(2/10,times=3*N)
pikfin=samplecube(X,pik,1,TRUE)
############
## Example 6
############
# Selection of a balanced sample using the MU284 population,
# simulation and comparison of the variance with
# unequal probability sampling of fixed sample size.
############
data(MU284)
# Computation of the inclusion probabilities
pik=inclusionprobabilities(MU284$P75,50)
# Definition of the matrix of balancing variables
X=cbind(MU284$P75,MU284$CS82,MU284$SS82,MU284$S82,MU284$ME84,MU284$REV84)
# Computation of the Horvitz-Thompson estimator for a balanced sample
s=samplecube(X,pik,1,FALSE)
HTestimator(MU284$RMT85[s==1],pik[s==1])
# Computation of the Horvitz-Thompson estimator for an unequal probability sample
s=samplecube(matrix(pik),pik,1,FALSE)
HTestimator(MU284$RMT85[s==1],pik[s==1])
# simulations; for a better accurancy, increase the value of 'sim'
sim=8
res1=rep(0,times=sim)
res2=rep(0,times=sim)
for(i in 1:sim)
{
cat("Simulation number ",i,"\n")
s=samplecube(X,pik,1,FALSE)
res1[i]=HTestimator(MU284$RMT85[s==1],pik[s==1])
s=samplecube(matrix(pik),pik,1,FALSE)
res2[i]=HTestimator(MU284$RMT85[s==1],pik[s==1])
}
# summary and boxplots
summary(res1)
summary(res2)
ss=cbind(res1,res2)
colnames(ss) = c("balanced sampling","uneq prob sampling")
boxplot(data.frame(ss), las=1)



cleanEx()
nameEx("srswor")
### * srswor

flush(stderr()); flush(stdout())

### Name: srswor
### Title: Simple random sampling without replacement
### Aliases: srswor
### Keywords: survey

### ** Examples

############
## Example 1
############
#select a sample
s=srswor(3,10)
#the sample is
(1:10)[s==1]
############
## Example 2
############
data(belgianmunicipalities)
Tot=belgianmunicipalities$Tot04
name=belgianmunicipalities$Commune
n=200
#select a sample
s=srswor(n,length(Tot))  
#the sample is 
as.vector(name[s==1])



cleanEx()
nameEx("srswor1")
### * srswor1

flush(stderr()); flush(stdout())

### Name: srswor1
### Title: Selection-rejection method
### Aliases: srswor1
### Keywords: survey

### ** Examples

s=srswor1(3,10)
#the sample is
(1:10)[s==1]



cleanEx()
nameEx("srswr")
### * srswr

flush(stderr()); flush(stdout())

### Name: srswr
### Title: Simple random sampling with replacement
### Aliases: srswr
### Keywords: survey

### ** Examples

s=srswr(3,10)
#the selected units are 
(1:10)[s!=0]
#wiht the number of replicates 
s[s!=0]



cleanEx()
nameEx("strata")
### * strata

flush(stderr()); flush(stdout())

### Name: strata
### Title: Stratified sampling
### Aliases: strata
### Keywords: survey

### ** Examples

############
## Example 1
############
# Example from An and Watts (New SAS procedures for Analysis of Sample Survey Data)
# generates artificial data (a 235X3 matrix with 3 columns: state, region, income).
# the variable "state" has 2 categories ('nc' and 'sc'). 
# the variable "region" has 3 categories (1, 2 and 3).
# the sampling frame is stratified by region within state.
# the income variable is randomly generated
data=rbind(matrix(rep("nc",165),165,1,byrow=TRUE),matrix(rep("sc",70),70,1,byrow=TRUE))
data=cbind.data.frame(data,c(rep(1,100), rep(2,50), rep(3,15), rep(1,30),rep(2,40)),
1000*runif(235))
names(data)=c("state","region","income")
# computes the population stratum sizes
table(data$region,data$state)
# not run
#     nc  sc
#  1 100  30
#  2  50  40
#  3  15   0
# there are 5 cells with non-zero values
# one draws 5 samples (1 sample in each stratum)
# the sample stratum sizes are 10,5,10,4,6, respectively
# the method is 'srswor' (equal probability, without replacement)
s=strata(data,c("region","state"),size=c(10,5,10,4,6), method="srswor")
# extracts the observed data
getdata(data,s)
############
## Example 2
############
# The same data as in Example 1
# the method is 'systematic' (unequal probability, without replacement)
# the selection probabilities are computed using the variable 'income'
s=strata(data,c("region","state"),size=c(10,5,10,4,6), method="systematic",
pik=data$income)
# extracts the observed data
getdata(data,s)
############
## Example 3
############
# Uses the 'swissmunicipalities' data for drawing a sample of units
data(swissmunicipalities)
# the variable 'REG' has 7 categories in the population
# it is used as stratification variable
# Computes the population stratum sizes
table(swissmunicipalities$REG)
# do not run
#  1   2   3   4   5   6   7 
# 589 913 321 171 471 186 245 
# the sample stratum sizes are given by size=c(30,20,45,15,20,11,44)
# the method is simple random sampling without replacement 
# (equal probability, without replacement)
st=strata(swissmunicipalities,stratanames=c("REG"),size=c(30,20,45,15,20,11,44), 
method="srswor")
# extracts the observed data
# the order of the columns is different from the order in the initial database
getdata(swissmunicipalities, st)



cleanEx()
nameEx("swissmunicipalities")
### * swissmunicipalities

flush(stderr()); flush(stdout())

### Name: swissmunicipalities
### Title: The Swiss municipalities population
### Aliases: swissmunicipalities
### Keywords: datasets

### ** Examples

data(swissmunicipalities)
hist(swissmunicipalities$POPTOT)



cleanEx()
nameEx("varest")
### * varest

flush(stderr()); flush(stdout())

### Name: varest
### Title: Variance estimation using the Deville's method
### Aliases: varest
### Keywords: survey

### ** Examples

# Belgian municipalities data base
data(belgianmunicipalities)
attach(belgianmunicipalities)
# Computes the inclusion probabilities
pik=inclusionprobabilities(Tot04,200)
N=length(pik)
n=sum(pik)
# Defines the variable of interest
y=TaxableIncome
# Draws a Tille sample of size 200
s=UPtille(pik)
# Computes the Horvitz-Thompson estimator
HTestimator(y[s==1],pik[s==1])
# Computes the variance estimation of the Horvitz-Thompson estimator
varest(Ys=y[s==1],pik=pik[s==1])
# for an example using calibration estimator see the 'calibration' vignette 
vignette("calibration", package="sampling")



cleanEx()
nameEx("vartaylor_ratio")
### * vartaylor_ratio

flush(stderr()); flush(stdout())

### Name: vartaylor_ratio
### Title: Taylor-series linearization variance estimation of a ratio
### Aliases: vartaylor_ratio
### Keywords: survey

### ** Examples

# Belgian municipalities data base
data(belgianmunicipalities)
attach(belgianmunicipalities)
# Computes the inclusion probabilities
pik=inclusionprobabilities(averageincome,100)
# the first variable on the population
Y=Men03
# the second variable on the population
X=Women03
# population size
N=length(pik)             
# matrix of joint inclusion prob. on the population for Tille sampling
pikl=UPtillepi2(pik)     
# draw a sample using the Tille sampling 
s=UPtille(pik)           
# inclusion probabilities on the sample
piks=pik[s==1]            
# the first observed variable
Ys=Y[s==1]
# the second observed variable
Xs=X[s==1]              
# matrix of joint inclusion prob. on the sample          
pikls=pikl[s==1,s==1] 
# computes the ratio HTestimator(Ys,piks)/HTestimator(Xs,piks) and its estimated variance
vartaylor_ratio(Ys,Xs,pikls)



cleanEx()
nameEx("writesample")
### * writesample

flush(stderr()); flush(stdout())

### Name: writesample
### Title: All possible samples of fixed size
### Aliases: writesample
### Keywords: survey

### ** Examples

# all samples of size 4
# from a population of size 10.
w=writesample(4,10)
# the samples are
t(apply(w,1,function(x) (1:ncol(w))[x==1]))



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
