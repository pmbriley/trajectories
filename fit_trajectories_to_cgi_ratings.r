# Briley et al. Trajectories of improvement with repetitive transcranial magnetic stimulation for treatment-resistant major depression in the BRIGhTMIND trial
#
# Fits trajectories of improvement to CGI values across the twenty rTMS sessions in the BRIGhTMIND trial
#
# Data are in the 'cgi' data frame, which has fields: Session (session number, zero = pre-treatment), ID (participant code), CGI (CGI value), Tx (treatment group)
# CGI values originally were: 1 = Much worse, 2 = A bit worse, 3 = Just the same, 4 = A bit better, 5 = Much better
# Note that for these trajectory analyses, CGI values have been recoded such that 1/2 = 1, 3 = 2, 4 = 3, 5 = 4
#
# 19/01/2024

library('lcmm'); # lcmm toolbox; Proust-Lima et al. (2017, doi: 10.18637/jss.v078.i02)
library('parallel'); # Speeds up grid searches
myClust <- makeCluster(8); # Specify number of cores

# Fit the one-class model (ng = 1). All trajectories are polynomials of degree 3 (cubic). Threshold link function (for ordinal data)
c1d3 <- lcmm(CGI ~ poly(Session, degree = 3, raw = TRUE), ng = 1, 
            link = "thresholds",
            subject = "ID", 
            data = cgi,
            maxiter = 10000,
            verbose = TRUE)

# Fit the two-class model (ng = 2). Uses grid search with 100 starting values. Initialises using one-class solution
c2d3 <- gridsearch(
  rep = 100,
  maxiter = 10000,
  minit = c1d3,
  cl = myClust,
  lcmm(CGI ~ poly(Session, degree = 3, raw = TRUE),
       ng = 2, 
       link = "thresholds",
       subject = "ID", 
       data = cgi, 
       verbose = TRUE,
       mixture = ~ poly(Session, degree = 3, raw = TRUE),
       maxiter = 10000,
       B = c1d3))

# Fit the three-class model (ng = 3)
c3d3 <- gridsearch(
  rep = 100,
  maxiter = 10000,
  minit = c1d3,
  cl = myClust,
  lcmm(CGI ~ poly(Session, degree = 3, raw = TRUE),
       ng = 3, 
       link = "thresholds",
       subject = "ID", 
       data = cgi, 
       verbose = TRUE,
       mixture = ~ poly(Session, degree = 3, raw = TRUE),
       maxiter = 10000,
       B = c1d3))

# Fit the four-class model (ng = 4)
c4d3 <- gridsearch(
  rep = 100,
  maxiter = 10000,
  minit = c1d3,
  cl = myClust,
  lcmm(CGI ~ poly(Session, degree = 3, raw = TRUE),
       ng = 4, 
       link = "thresholds",
       subject = "ID", 
       data = cgi, 
       verbose = TRUE,
       mixture = ~ poly(Session, degree = 3, raw = TRUE),
       maxiter = 10000,
       B = c1d3))

# Fit the five-class model (ng = 5)
c5d3 <- gridsearch(
  rep = 100,
  maxiter = 10000,
  minit = c1d3,
  cl = myClust,
  lcmm(CGI ~ poly(Session, degree = 3, raw = TRUE),
       ng = 5, 
       link = "thresholds",
       subject = "ID", 
       data = cgi, 
       verbose = TRUE,
       mixture = ~ poly(Session, degree = 3, raw = TRUE),
       maxiter = 10000,
       B = c1d3))

# Fit the six-class model (ng = 6)
c6d3 <- gridsearch(
  rep = 100,
  maxiter = 10000,
  minit = c1d3,
  cl = myClust,
  lcmm(CGI ~ poly(Session, degree = 3, raw = TRUE),
       ng = 6, 
       link = "thresholds",
       subject = "ID", 
       data = cgi, 
       verbose = TRUE,
       mixture = ~ poly(Session, degree = 3, raw = TRUE),
       maxiter = 10000,
       B = c1d3))

# Fit the seven-class model (ng = 7)
c7d3 <- gridsearch(
  rep = 100,
  maxiter = 1000,
  minit = c1d3,
  cl = myClust,
  lcmm(CGI ~ poly(Session, degree = 3, raw = TRUE),
       ng = 7, 
       link = "thresholds",
       subject = "ID", 
       data = cgi, 
       verbose = TRUE,
       mixture = ~ poly(Session, degree = 3, raw = TRUE),
       maxiter = 1000,
       B = c1d3))

# Fit the eight-class model (ng = 8)
c8d3 <- gridsearch(
  rep = 100,
  maxiter = 1000,
  minit = c1d3,
  cl = myClust,
  lcmm(CGI ~ poly(Session, degree = 3, raw = TRUE),
       ng = 8, 
       link = "thresholds",
       subject = "ID", 
       data = cgi, 
       verbose = TRUE,
       mixture = ~ poly(Session, degree = 3, raw = TRUE),
       maxiter = 1000,
       B = c1d3))
