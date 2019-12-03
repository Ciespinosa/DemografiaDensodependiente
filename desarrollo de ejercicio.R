##Matriz ejemplo ----

gl<- matrix(c(0, 0.5, 20, 0.3, 0, 
              0, 0, 0.5, 0.9), nr = 3,
            byrow = TRUE)

gl.N<- matrix(c(500, 300, 118), ncol = 1)

gl.N1 <- gl %*% gl.N 
gl.N1

gl.N2 <- gl %*% gl.N1 
gl.N2


years <- 8
N.projections.gl <- matrix(0, nrow = nrow(gl), 
                           ncol = years + 1) 

N.projections.gl[,1] <- gl.N

for(i in 1:years) N.projections.gl[, i + 1] <- 
  gl %*% N.projections.gl[, i]


par(mfcol=c(2,1), mar=c(3,3,1,1))

matplot(0:years, t(N.projections.gl), type="l")

N.totals <- apply(N.projections.gl, 2, sum)
plot(0:years, N.totals, type="b")






##Ejercicio----


gl<- matrix(c(0, 0, 0, 145, 0.55, 0.33, 
              0, 0.47, 0, 0.63, 
              0.16, 0, 0, 0, 0.42,0), nr = 4,
                 byrow = TRUE)

gl.N<- matrix(c(6525, 284, 320, 94), ncol = 1)

gl.N1 <- gl %*% gl.N 
gl.N1

gl.N2 <- gl %*% gl.N1 
gl.N2


years <- 8
N.projections.gl <- matrix(0, nrow = nrow(gl), 
                        ncol = years + 1) 

N.projections.gl[, 1] <- gl.N

for (i in 1:years) N.projections.gl[, i + 1] <- 
  gl %*% N.projections.gl[, i]

matplot(0:years, t(N.projections.gl), type="l")


N.totals <- apply(N.projections.gl
                  , 2, sum)

Rs <- N.totals[-1]/N.totals[-(years + 1)]

plot(0:(years-1), Rs, type="b")
