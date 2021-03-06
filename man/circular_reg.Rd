% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/circular.R
\name{circular_reg}
\alias{circular_reg}
\alias{update.circular_reg}
\alias{print.circular_reg}
\title{General Interface for Circular Regression Models}
\usage{
circular_reg(
  mode = "regression",
  pattern = NULL,
  initial = NULL,
  tolerance = NULL
)

\method{update}{circular_reg}(
  object,
  pattern = NULL,
  initial = NULL,
  tolerance = NULL,
  fresh = FALSE,
  ...
)

\method{print}{circular_reg}(x, ...)
}
\arguments{
\item{mode}{A character string that describes the type of model. In this
case, it only supports type of "regression", which is default.}

\item{pattern}{A character string of either "c-c" or "c-l" which show the
relationship between the dependent and independent variables, identifying
if they are circular or not. This changes the additional parameters
available.
\itemize{
\item If \strong{"c-c"} is selected, neither \strong{initial} or \strong{tolerance} are
required
\item If \strong{"c-l"} is selected, both \strong{initial} or \strong{tolerance} are required
}}

\item{initial}{A vector with initial values the length equal to the columns
of the independent variable, plus the intercept. For example, with 3
predictors (and one intercept), the initial value should be \code{x = rep(0, 4)}}

\item{tolerance}{A numerical value, which defaults to 1e-10, can be set at a
lower or higher tolerance which sets the accuracy for algorithm
convergence.}

\item{object}{Circular model specification}

\item{fresh}{A logical for whether the arguments should be modified in place or replaced altogether}

\item{...}{Extensible}

\item{x}{circular model specification}
}
\description{
\code{circular_reg()} is a \emph{parsnip} friendly method for
specification of circular regression model before fitting. When using the
\link[circular:lm.circular]{circular::lm.circular} engine, a formula is not given/needed.
}
\examples{
library(magrittr)
library(circular)
library(parsnip)
f <- az_svg ~ lab_hba1c + cad
df <- geh[c("az_svg", "lab_hba1c", "cad")]
df$az_svg <- circular(df$az_svg, units = "degrees") \%>\% conversion.circular(., units = "radians")
circular_reg(pattern = "c-l", initial = rep(0, 3), tolerance = 1e-3) \%>\%
  set_engine("circular") \%>\%
  fit(f, data = df)
}
