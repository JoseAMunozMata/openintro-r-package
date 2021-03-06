\name{makeTube}
\alias{makeTube}
\title{Regression tube}
\description{Produce a linear, quadratic, or nonparametric tube for regression data.}
\usage{
makeTube(x, y, Z=2, R=1, col='#00000022', border='#00000000',
  type=c('lin', 'quad', 'robust'), stDev=c('constant', 'linear', 'other'),
  length.out=99, bw='default', plotTube=TRUE, addLine=TRUE, ...)
}
\arguments{
  \item{x}{\code{x} coordinates.}
  \item{y}{\code{y} coordinates.}
  \item{Z}{Number of standard deviations out from the regression line to extend the tube.}
  \item{R}{Control of how far the tube extends to the left and right.}
  \item{col}{Fill color of the tube.}
  \item{border}{Border color of the tube.}
  \item{type}{The type of model fit to the data. Here \code{'robust'} results in a nonparametric estimate.}
  \item{stDev}{Choices are constant variance (\code{'constant'}), the standard deviation of the errors changes linearly (\code{'linear'}), or the standard deviation of the errors should be estimated using nonparametric methods (\code{'other'}).}
  \item{length.out}{The number of observations used to build the regression model. This argument may be increased to increase the smoothing of a quadratic or nonparametric curve.}
  \item{bw}{Bandwidth used if \code{type='robust'} or \code{homosk=FALSE}.}
  \item{plotTube}{Whether the tube should be plotted.}
  \item{addLine}{Whether the linear model should be plotted.}
  \item{\dots}{Additional arguments passed to the \code{lines} function if \code{addLine=TRUE}.}
}
\value{
  \item{X}{\code{x} coordinates for the regression model.}
  \item{Y}{\code{y} coordinates for the regression model.}
  \item{tubeX}{\code{x} coordinates for the boundary of the tube.}
  \item{tubeY}{\code{y} coordinates for the boundary of the tube.}
}
\author{
David M Diez
}
\seealso{
\code{\link{lmPlot}}
}
\examples{
#===> possum example <===#
data(possum)
x <- possum$totalL
y <- possum$headL
plot(x,y)
makeTube(x,y,1)
makeTube(x,y,2)
makeTube(x,y,3)

#===> Grades and TV example <===#
data(gradesTV)
par(mfrow=c(2,2))
plot(gradesTV)
makeTube(gradesTV$TV, gradesTV$Grades, 1.5)
plot(gradesTV)
makeTube(gradesTV$TV, gradesTV$Grades, 1.5, stDev='o')
plot(gradesTV)
makeTube(gradesTV$TV, gradesTV$Grades, 1.5, type='robust')
plot(gradesTV)
makeTube(gradesTV$TV, gradesTV$Grades, 1.5, type='robust', stDev='o')

#===> What can go wrong with a basic least squares model <===#
par(mfrow=c(1,3), mar=c(2.5, 2.5, 1, 2.5))
# 1
x <- runif(100)
y <- 25*x-20*x^2+rnorm(length(x), sd=1.5)
plot(x,y)
makeTube(x,y,type='q')
# 2
x <- c(-0.6, -0.46, -0.091, runif(97))
y <- 25*x + rnorm(length(x))
y[2] <- y[2] + 8
y[1] <- y[1] + 1
plot(x,y,ylim=range(y)+c(-10,5))
makeTube(x,y)
# 3
x <- runif(100)
y <- 5*x + rnorm(length(x), sd=x)
plot(x,y)
makeTube(x, y, stDev='l', bw=0.03)
}
\keyword{Regression}
\keyword{Kernel smoothing}
\keyword{Data tube}
\keyword{Least squares}
