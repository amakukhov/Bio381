# R Notes with Lauren Ash
# April D. Makukhov
# February 15, 2017

### rep command
rep(1:4, 2)

# Output: [1] 1 2 3 4 1 2 3 4

rep(1:4, each = 2)
# Output: [1] 1 1 2 2 3 3 4 4

rep(1:4, c(2,1,2,1))
# Output: [1] 1 1 2 3 3 4

### seq command
seq(from=1, to=5, by=0.5)
# Output: [1] 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0

c(seq(1,5,by=0.5), rep(1:5))
# Output: [1] 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0 1.0 2.0 3.0 4.0 5.0

dogs<-c("chow","pug","lab")

# want second in the list
dogs[2]

# print everything except for 3
dogs[-3]


