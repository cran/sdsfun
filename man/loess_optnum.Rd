% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/loess.R
\name{loess_optnum}
\alias{loess_optnum}
\title{determine optimal spatial data discretization for individual variables}
\usage{
loess_optnum(qvec, discnumvec, increase_rate = 0.05)
}
\arguments{
\item{qvec}{A numeric vector of q statistics.}

\item{discnumvec}{A numeric vector of break numbers corresponding to \code{qvec}.}

\item{increase_rate}{(optional) The critical increase rate of the number of discretization.
Default is \code{0.05}.}
}
\value{
A two element numeric vector.
\describe{
\item{\code{discnum}}{optimal number of spatial data discretization}
\item{\code{increase_rate}}{the critical increase rate of the number of discretization}
}
}
\description{
Function for determining optimal spatial data discretization for individual variables
based on locally estimated scatterplot smoothing (LOESS) model.
}
\note{
When \code{increase_rate} is not satisfied by the calculation, the discrete number corresponding
to the highest \verb{q statistic} is selected as a return.

Note that \code{sdsfun} sorts \code{discnumvec} from smallest to largest and keeps \code{qvec} in
one-to-one correspondence with \code{discnumvec}.
}
\examples{
qv = c(0.26045642,0.64120405,0.43938704,0.95165535,0.46347836,
       0.25385338,0.78778726,0.95938330,0.83247885,0.09285196)
loess_optnum(qv,3:12)

}
