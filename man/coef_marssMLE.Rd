\name{coef.marssMLE}
\alias{coef}
\alias{coef.MARSS}
\alias{coef.marssMLE}
\alias{coef.marss}
\title{ Coefficient function for MARSS MLE objects }
\description{
  The MARSS fitting function, \code{\link{MARSS}}, outputs marssMLE objects.  \code{coef(marssMLE)}, where marssMLE is one's output from a \code{\link{MARSS}} call, will print out the estimated parameters.  The default output is a list with the estimated parameters for each MARSS parameter, however \code{coef} can be altered using the \code{type} argument to output a vector of all the estimated values (\code{type="vector"}) or a list with the full parameter matrix with the estimated and fixed elements (\code{type="matrix"}).
}
\usage{
\method{coef}{marssMLE}(object, ..., type="list", form=NULL, what="par")
}
\arguments{
  \item{object}{ A marssMLE object.  }
  \item{...}{ Other arguments for coef. }
  \item{type}{ What to print.  Default is "list".  If you input type as a vector, coef returns a list of output. See examples.
  \itemize{
    \item{ "list" }{ A list of only the estimated values in each matrix. Each model matrix has it's own list element.}
    \item{ "vector" }{ A vector of all the estimated values in each matrix. }
    \item{ "matrix" }{ A list of the parameter matrices each parameter with fixed values at their fixed values and the estimated values at their estimated values. Time-varying parameters, including d and c in a marxss form model, are returned as an array with time in the 3rd dimension. }
    \item{ parameter name }{ Returns the parameter matrix for that parameter with fixed values at their fixed values and the estimated values at their estimated values. Note, time-varying parameters, including d and c in a marxss form model, are returned as an array with time in the 3rd dimension.}
  } }
  \item{form}{ By default, coef uses the model form specified in the call to \code{\link{MARSS}} to determine how to display the coefficients.  This information is in \code{ attr(marssMLE$model,"form") }, however you can specify a different form.  \code{form="marss"} should always work since this is the base model form in which the model objects are stored (in \code{marssMLE$marss}). This is mainly useful is you want to see your model transformed into marss form as seeing this can be helpful for debugging numerical problems.}
  \item{what}{ By default, coef shows the parameter estimates.  Other options are "par.se", "par.lowCI", "par.upCI", "par.bias", and "start".}
}

\value{
  A list of the estimated parameters for each model matrix.
}
\author{ 
  Eli Holmes, NOAA, Seattle, USA.  

  eli(dot)holmes(at)noaa(dot)gov
}
\examples{ 
  dat = t(harborSeal)
  dat = dat[c(2,11),]
  MLEobj = MARSS(dat)
  
  coef(MLEobj)
  coef(MLEobj,type="vector")
  coef(MLEobj,type="matrix")
  #to retrieve just the Q matrix
  coef(MLEobj,type="matrix")$Q
}