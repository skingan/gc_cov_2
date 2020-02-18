#!/usr/bin/env Rscript
require("argparser")

parser <- arg_parser("box plots of coverage by sequence context")
parser <- add_argument(parser, "--infile", type="character", help="win.gc.cov.txt", default="NULL")
parser <- add_argument(parser, "--prefix", type="character", help="prefix", default="NULL")
args   <- parse_args(parser)

d<-read.table(args$infile, header=F)
colnames(d)<-c("contig","start","end","gc.pct","a.pct","c.pct","g.pct","t.pct","length","cov")

filename<-paste(args$prefix, "pdf", sep=".")
fullpath<-paste("output", filename, sep="/")

plot_field<-function(dataframe,field) {
    d<-dataframe
    f<-which(colnames(d)==field)
    d1<-d[,c(f,10)]
    b1<-d1[which(d1[,1]>=0 & d1[,1]<=0.1),]
    b2<-d1[which(d1[,1]>0.10 & d1[,1]<=0.2),]
    b3<-d1[which(d1[,1]>0.20 & d1[,1]<=0.3),]
    b4<-d1[which(d1[,1]>0.30 & d1[,1]<=0.4),]
    b5<-d1[which(d1[,1]>0.40 & d1[,1]<=0.5),]
    b6<-d1[which(d1[,1]>0.50 & d1[,1]<=0.6),]
    b7<-d1[which(d1[,1]>0.60 & d1[,1]<=0.7),]
    b8<-d1[which(d1[,1]>0.70 & d1[,1]<=0.8),]
    b9<-d1[which(d1[,1]>0.80 & d1[,1]<=0.9),]
    b10<-d1[which(d1[,1]>0.90 & d1[,1]<=1),]
    boxplot(b1$cov, b2$cov, b3$cov, b4$cov, b5$cov, b6$cov, b7$cov, b8$cov, b9$cov, b10$cov,
            outline=F, las=1, fill="grey",
            xlab=field, ylab="coverage",
            names=c("10%","20%","30%","40%","50%","60%","70%","80%","90%","100%")
    )
}
plot_field_title<-function(dataframe,field) {
  d<-dataframe
  f<-which(colnames(d)==field)
  d1<-d[,c(f,10)]
  b1<-d1[which(d1[,1]>=0 & d1[,1]<=0.1),]
  b2<-d1[which(d1[,1]>0.10 & d1[,1]<=0.2),]
  b3<-d1[which(d1[,1]>0.20 & d1[,1]<=0.3),]
  b4<-d1[which(d1[,1]>0.30 & d1[,1]<=0.4),]
  b5<-d1[which(d1[,1]>0.40 & d1[,1]<=0.5),]
  b6<-d1[which(d1[,1]>0.50 & d1[,1]<=0.6),]
  b7<-d1[which(d1[,1]>0.60 & d1[,1]<=0.7),]
  b8<-d1[which(d1[,1]>0.70 & d1[,1]<=0.8),]
  b9<-d1[which(d1[,1]>0.80 & d1[,1]<=0.9),]
  b10<-d1[which(d1[,1]>0.90 & d1[,1]<=1),]
  boxplot(b1$cov, b2$cov, b3$cov, b4$cov, b5$cov, b6$cov, b7$cov, b8$cov, b9$cov, b10$cov,
          outline=F, las=1, fill="grey",
          xlab=field, ylab="coverage", main=args$prefix,
          names=c("10%","20%","30%","40%","50%","60%","70%","80%","90%","100%")
  )
}

pdf(file=fullpath, width=8.5, height=11)
par(mfrow=c(5,1), oma=c(1.75,4,1.5,1), cex=1.1, mar=c(4,4,1,0.5))
plot_field_title(d,"gc.pct")
plot_field(d,"a.pct")
plot_field(d,"c.pct")
plot_field(d,"g.pct")
plot_field(d,"t.pct")
dev.off()


