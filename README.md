# trajectories
Briley et al. (2024), npj Mental Health Research
Trajectories of improvement with repetitive transcranial magnetic stimulation for treatment-resistant major depression in the BRIGhTMIND trial

fit_trajectories_to_cgi_ratings.r: R code to fit trajectories of improvement to CGI (patient global impression of change) ratings across sessions of a treatment course. Requires lcmm toolbox (Proust-Lima et al. 2017, doi: 10.18637/jss.v078.i02) for latent class growth analysis

fitted_values.RData: contains variables...

    cgi - data frame with columns of Session (session number, 0 = pre-treatment), ID - patient ID code, CGI - CGI value (re-coded such that 1/2 = 1, 3 = 2, 4 = 3, 5 = 4), Tx - treatment group

    datnew - simple data frame with a Session term, to facilitate plotting of response trajectories; datnew <- data.frame(Session=seq(0,20,length=21))

    c1d3 - fitted lcmm model (one class, polynomial degree 3 i.e., cubic)
    c2d3-c8d3 fitted lcmm models (two-eight classes)

 To produce a plot of improvement trajectories for each class of the five-class model (as in manuscript Figure 2), use...
     
     plotpred <- predictY(c5d3,datnew,var.time="Session",draws = TRUE)
     plot(plotpred,lty=1,xlab="Session",ylab="CGI",legend.loc="topleft",cex=0.75)
