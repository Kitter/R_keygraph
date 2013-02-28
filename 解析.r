#あと,KeyGraphのアルゴリズム,一番古い論文と一番新しい教科書で違うってなんだろなぁ.一番古いのでやったけど,一番新しいで書きなおすべきかも.でも安定性のアルゴリズム的には変化ないのでこのままいく.

# キーワードの分散ってそれぞれから抽出して差分、統計、グラフ化？
# キーワードの安定性、アナロジー、KeyGraphを使う理由
# KeyGraphは頻度の低いキーワードも抽出する。しかし、それは信頼性がない？
# 喘息がひどい
# KeyGraphのプログラムの方も少し修正。バグじゃないけど、コメント増やしたりプログラムのだめな部分なおしたり。
# メールが怖い。就職活動終わってから豆腐メンタル。
# 解析用

# 端末で
cat "2012-12-21 "0[5-9]*>t1a
cat "2012-12-21 "1[0-9]*>t2a
cat "2012-12-21 "2[0-3]*>t3a
cat "2012-12-22 "0[0-4]*>t4a
cat "2012-12-22 "0[5-9]*>t1b
cat "2012-12-22 "1[0-9]*>t2b
cat "2012-12-22 "2[0-3]*>t3b
cat "2012-12-23 "0[0-4]*>t4b
cat "2012-12-23 "0[5-9]*>t1c
cat "2012-12-23 "1[0-9]*>t2c
cat "2012-12-23 "2[0-3]*>t3c
cat "2012-12-24 "0[0-4]*>t4c
cat "2012-12-24 "0[5-9]*>t1d
cat "2012-12-24 "1[0-9]*>t2d
cat "2012-12-24 "2[0-3]*>t3d
cat "2012-12-25 "0[0-4]*>t4d
cat "2012-12-25 "0[5-9]*>t1e
cat "2012-12-25 "1[0-9]*>t2e
cat "2012-12-25 "2[0-3]*>t3e
cat "2012-12-26 "0[0-4]*>t4e
cat "2012-12-26 "0[5-9]*>t1f
cat "2012-12-26 "1[0-9]*>t2f
cat "2012-12-26 "2[0-3]*>t3f
cat "2012-12-27 "0[0-4]*>t4f
cat "2012-12-27 "0[5-9]*>t1g
cat "2012-12-27 "1[0-9]*>t2g
cat "2012-12-27 "2[0-3]*>t3g
cat "2012-12-28 "0[0-4]*>t4g
cat "2012-12-28 "0[5-9]*>t1h
cat "2012-12-28 "1[0-9]*>t2h
cat "2012-12-28 "2[0-3]*>t3h
cat "2012-12-29 "0[0-4]*>t4h
cat "2012-12-29 "0[5-9]*>t1i
cat "2012-12-29 "1[0-9]*>t2i
cat "2012-12-29 "2[0-3]*>t3i
cat "2012-12-30 "0[0-4]*>t4i
cat "2012-12-30 "0[5-9]*>t1j
cat "2012-12-30 "1[0-9]*>t2j
cat "2012-12-30 "2[0-3]*>t3j
cat "2012-12-31 "0[0-4]*>t4j
cat "2012-12-31 "0[5-9]*>t1k
cat "2012-12-31 "1[0-9]*>t2k
cat "2012-12-31 "2[0-3]*>t3k
cat "2013-01-01 "0[0-4]*>t4k
cat "2013-01-01 "0[5-9]*>t1l
cat "2013-01-01 "1[0-9]*>t2l
cat "2013-01-01 "2[0-3]*>t3l
cat "2013-01-02 "0[0-4]*>t4l
cat "2013-01-02 "0[5-9]*>t1m
cat "2013-01-02 "1[0-9]*>t2m
cat "2013-01-02 "2[0-3]*>t3m
cat "2013-01-03 "0[0-4]*>t4m
cat "2013-01-03 "0[5-9]*>t1n
cat "2013-01-03 "1[0-9]*>t2n
cat "2013-01-03 "2[0-3]*>t3n
cat "2013-01-04 "0[0-4]*>t4n
cat "2013-01-04 "0[5-9]*>t1o
cat "2013-01-04 "1[0-9]*>t2o
cat "2013-01-04 "2[0-3]*>t3o
cat "2013-01-05 "0[0-4]*>t4o
cat "2013-01-05 "0[5-9]*>t1p
cat "2013-01-05 "1[0-9]*>t2p
cat "2013-01-05 "2[0-3]*>t3p
cat "2013-01-06 "0[0-4]*>t4p
cat "2013-01-06 "0[5-9]*>t1q
cat "2013-01-06 "1[0-9]*>t2q
cat "2013-01-06 "2[0-3]*>t3q
cat "2013-01-07 "0[0-4]*>t4q
cat "2013-01-07 "0[5-9]*>t1r
cat "2013-01-07 "1[0-9]*>t2r
cat "2013-01-07 "2[0-3]*>t3r
cat "2013-01-08 "0[0-4]*>t4r
cat "2013-01-08 "0[5-9]*>t1s
cat "2013-01-08 "1[0-9]*>t2s
cat "2013-01-08 "2[0-3]*>t3s
cat "2013-01-09 "0[0-4]*>t4s
cat "2013-01-09 "0[5-9]*>t1t
cat "2013-01-09 "1[0-9]*>t2t
cat "2013-01-09 "2[0-3]*>t3t
cat "2013-01-10 "0[0-4]*>t4t
cat "2013-01-10 "0[5-9]*>t1u
cat "2013-01-10 "1[0-9]*>t2u
cat "2013-01-10 "2[0-3]*>t3u
cat "2013-01-11 "0[0-4]*>t4u
cat "2013-01-11 "0[5-9]*>t1v
cat "2013-01-11 "1[0-9]*>t2v
cat "2013-01-11 "2[0-3]*>t3v
cat "2013-01-12 "0[0-4]*>t4v
cat "2013-01-12 "0[5-9]*>t1w
cat "2013-01-12 "1[0-9]*>t2w
cat "2013-01-12 "2[0-3]*>t3w
cat "2013-01-13 "0[0-4]*>t4w

cat t[1234][ab] >01.txt
cat t[1234][cd] >02.txt
cat t[1234][ef] >03.txt
cat t[1234][gh] >04.txt
cat t[1234][ij] >05.txt
cat t[1234][kl] >06.txt
cat t[1234][mn] >07.txt
cat t[1234][op] >08.txt
cat t[1234][qr] >09.txt
cat t[1234][st] >10.txt
cat t[1234][uv] >11.txt
# ここまで


# 再作業
# cat "2013-01-18 "*>01.txt
# cat "2013-01-19 "*>02.txt
# cat "2013-01-20 "*>03.txt
# cat "2013-01-21 "*>04.txt
# cat "2013-01-22 "*>05.txt
# cat "2013-01-23 "*>06.txt
# cat "2013-01-24 "*>07.txt
# cat "2013-01-25 "*>08.txt
# cat "2013-01-28 "*>09.txt
# cat "2013-01-29 "*>10.txt


#ここからR
source("/Users/senyoltw/dev/R_keygraph/R_keygraph_test.R")
twitter2txt("01.txt","t01.txt")
twitter2txt("02.txt","t02.txt")
twitter2txt("03.txt","t03.txt")
twitter2txt("04.txt","t04.txt")
twitter2txt("05.txt","t05.txt")
twitter2txt("06.txt","t06.txt")
twitter2txt("07.txt","t07.txt")
twitter2txt("08.txt","t08.txt")
twitter2txt("09.txt","t09.txt")
twitter2txt("10.txt","t10.txt")

textdata1<-"t01.txt"
textdata2<-"t02.txt"
textdata3<-"t03.txt"
textdata4<-"t04.txt"
textdata5<-"t05.txt"
textdata6<-"t06.txt"
textdata7<-"t07.txt"
textdata8<-"t08.txt"
textdata9<-"t09.txt"
textdata10<-"t10.txt"

data1<-readLines(textdata1)
data2<-readLines(textdata2)
data3<-readLines(textdata3)
data4<-readLines(textdata4)
data5<-readLines(textdata5)
data6<-readLines(textdata6)
data7<-readLines(textdata7)
data8<-readLines(textdata8)
data9<-readLines(textdata9)
data10<-readLines(textdata10)

# ちょこっと
# out1<-c(data2,data3)
# out2<-c(data1,data3)
# out3<-c(data1,data2)
# outall<-c(data1,data2,data3)
# write.table(out1,"output1a.txt",append=F, quote=F, col.names=F,row.names=F)
# write.table(out2,"output2a.txt",append=F, quote=F, col.names=F,row.names=F)
# write.table(out3,"output3a.txt",append=F, quote=F, col.names=F,row.names=F)
# write.table(outall,"outputalla.txt",append=F, quote=F, col.names=F,row.names=F)

# CV用 k=10
out1<-c(data2,data3,data4,data5,data6,data7,data8,data9,data10)
out2<-c(data1,data3,data4,data5,data6,data7,data8,data9,data10)
out3<-c(data1,data2,data4,data5,data6,data7,data8,data9,data10)
out4<-c(data1,data2,data3,data5,data6,data7,data8,data9,data10)
out5<-c(data1,data2,data3,data4,data6,data7,data8,data9,data10)
out6<-c(data1,data2,data3,data4,data5,data7,data8,data9,data10)
out7<-c(data1,data2,data3,data4,data5,data6,data8,data9,data10)
out8<-c(data1,data2,data3,data4,data5,data6,data7,data9,data10)
out9<-c(data1,data2,data3,data4,data5,data6,data7,data8,data10)
out10<-c(data1,data2,data3,data4,data5,data6,data7,data8,data9)
outall<-c(data1,data2,data3,data4,data5,data6,data7,data8,data9,data10)

write.table(out1,"output1.txt",append=F, quote=F, col.names=F,row.names=F)
write.table(out2,"output2.txt",append=F, quote=F, col.names=F,row.names=F)
write.table(out3,"output3.txt",append=F, quote=F, col.names=F,row.names=F)
write.table(out4,"output4.txt",append=F, quote=F, col.names=F,row.names=F)
write.table(out5,"output5.txt",append=F, quote=F, col.names=F,row.names=F)
write.table(out6,"output6.txt",append=F, quote=F, col.names=F,row.names=F)
write.table(out7,"output7.txt",append=F, quote=F, col.names=F,row.names=F)
write.table(out8,"output8.txt",append=F, quote=F, col.names=F,row.names=F)
write.table(out9,"output9.txt",append=F, quote=F, col.names=F,row.names=F)
write.table(out10,"output10.txt",append=F, quote=F, col.names=F,row.names=F)
write.table(outall,"outputall.txt",append=F, quote=F, col.names=F,row.names=F)
###ここまでの処理は1回でいい。




source("/Users/senyoltw/dev/R_keygraph/R_keygraph_test.R")

KALL<-keygraph("outputall.txt",50,50,50,50,10)
K01<-keygraph("output1.txt",50,50,50,50,10)
K02<-keygraph("output2.txt",50,50,50,50,10)
K03<-keygraph("output3.txt",50,50,50,50,10)
K04<-keygraph("output4.txt",50,50,50,50,10)
K05<-keygraph("output5.txt",50,50,50,50,10)
K06<-keygraph("output6.txt",50,50,50,50,10)
K07<-keygraph("output7.txt",50,50,50,50,10)
K08<-keygraph("output8.txt",50,50,50,50,10)
K09<-keygraph("output9.txt",50,50,50,50,10)
K10<-keygraph("output10.txt",50,50,50,50,10)
# KeyGraph解析
# 交叉検証法・・・キーワードの分散・・・

keygraphall<-KALL[[7]]
keygraph01<-K01[[7]]
keygraph02<-K02[[7]]
keygraph03<-K03[[7]]
keygraph04<-K04[[7]]
keygraph05<-K05[[7]]
keygraph06<-K06[[7]]
keygraph07<-K07[[7]]
keygraph08<-K08[[7]]
keygraph09<-K09[[7]]
keygraph10<-K10[[7]]
# KeyGraph notグラフ描写用

rk1<-rating_g(keygraph01,keygraphall)
rk2<-rating_g(keygraph02,keygraphall)
rk3<-rating_g(keygraph03,keygraphall)
rk4<-rating_g(keygraph04,keygraphall)
rk5<-rating_g(keygraph05,keygraphall)
rk6<-rating_g(keygraph06,keygraphall)
rk7<-rating_g(keygraph07,keygraphall)
rk8<-rating_g(keygraph08,keygraphall)
rk9<-rating_g(keygraph09,keygraphall)
rk10<-rating_g(keygraph10,keygraphall)

out1<-as.data.frame(rk1)
out2<-as.data.frame(rk2)
out3<-as.data.frame(rk3)
out4<-as.data.frame(rk4)
out5<-as.data.frame(rk5)
out6<-as.data.frame(rk6)
out7<-as.data.frame(rk7)
out8<-as.data.frame(rk8)
out9<-as.data.frame(rk9)
out10<-as.data.frame(rk10)


graph<-rbind(out1,out2,out3,out4,out5,out6,out7,out8,out9,out10)
rownames(graph)<-c("out1","out2","out3","out4","out5","out6","out7","out8","out9","out10")
cor(graph[1],graph[2])
colnames(graph)<-c("Huffman","correlation ")
plot(graph)


uniall<-union(KALL[[1]]$Term0,KALL[[1]]$Term)

uni01<-union(K01[[1]]$Term0,K01[[1]]$Term)
uni02<-union(K02[[1]]$Term0,K02[[1]]$Term)
uni03<-union(K03[[1]]$Term0,K03[[1]]$Term)
uni04<-union(K04[[1]]$Term0,K04[[1]]$Term)
uni05<-union(K05[[1]]$Term0,K05[[1]]$Term)
uni06<-union(K06[[1]]$Term0,K06[[1]]$Term)
uni07<-union(K07[[1]]$Term0,K07[[1]]$Term)
uni08<-union(K08[[1]]$Term0,K08[[1]]$Term)
uni09<-union(K09[[1]]$Term0,K09[[1]]$Term)
uni10<-union(K10[[1]]$Term0,K10[[1]]$Term)

uni<-c(uni01,uni02,uni03,uni04,uni05,uni06,uni07,uni08,uni09,uni10)
uni_count<-unique(uni)
uni_num<-numeric(length(uni_count))
for (n in 1:length(uni_count)) { 
	uni_num[n]<-sum(uni_count[n]==uni)
}
uni_data<-data.frame(name=uni_count,num=uni_num/10,stringsAsFactors=FALSE)
keygraphplot_kai(KALL,uni_data)


# 差分比較
uni01_diff<-setdiff(union(K01[[1]]$Term0,K01[[1]]$Term),uniall)
uni02_diff<-setdiff(union(K02[[1]]$Term0,K02[[1]]$Term),uniall)
uni03_diff<-setdiff(union(K03[[1]]$Term0,K03[[1]]$Term),uniall)
uni04_diff<-setdiff(union(K04[[1]]$Term0,K04[[1]]$Term),uniall)
uni05_diff<-setdiff(union(K05[[1]]$Term0,K05[[1]]$Term),uniall)
uni06_diff<-setdiff(union(K06[[1]]$Term0,K06[[1]]$Term),uniall)
uni07_diff<-setdiff(union(K07[[1]]$Term0,K07[[1]]$Term),uniall)
uni08_diff<-setdiff(union(K08[[1]]$Term0,K08[[1]]$Term),uniall)
uni09_diff<-setdiff(union(K09[[1]]$Term0,K09[[1]]$Term),uniall)
uni10_diff<-setdiff(union(K10[[1]]$Term0,K10[[1]]$Term),uniall)

uni_diff<-c(uni01_diff,uni02_diff,uni03_diff,uni04_diff,uni05_diff,uni06_diff,uni07_diff,uni08_diff,uni09_diff,uni10_diff)
uni_count_diff<-unique(uni_diff)
uni_num_diff<-numeric(length(uni_count_diff))
for (n in 1:length(uni_count_diff)) { 
	uni_num_diff[n]<-sum(uni_count_diff[n]==uni_diff)
}
uni_data_diff<-data.frame(name=uni_count_diff,num=uni_num_diff/10,stringsAsFactors=FALSE)


uni_data_01<-data.frame(name=uni01_diff,day01=1,stringsAsFactors=FALSE)
uni_data_02<-data.frame(name=uni02_diff,day02=1,stringsAsFactors=FALSE)
uni_data_03<-data.frame(name=uni03_diff,day03=1,stringsAsFactors=FALSE)
uni_data_04<-data.frame(name=uni04_diff,day04=1,stringsAsFactors=FALSE)
uni_data_05<-data.frame(name=uni05_diff,day05=1,stringsAsFactors=FALSE)
uni_data_06<-data.frame(name=uni06_diff,day06=1,stringsAsFactors=FALSE)
uni_data_07<-data.frame(name=uni07_diff,day07=1,stringsAsFactors=FALSE)
uni_data_08<-data.frame(name=uni08_diff,day08=1,stringsAsFactors=FALSE)
uni_data_09<-data.frame(name=uni09_diff,day09=1,stringsAsFactors=FALSE)
uni_data_10<-data.frame(name=uni10_diff,day10=1,stringsAsFactors=FALSE)

uni_data_merge<-merge(uni_data_01,uni_data_02,all=T)
uni_data_merge<-merge(uni_data_merge,uni_data_03,all=T)
uni_data_merge<-merge(uni_data_merge,uni_data_04,all=T)
uni_data_merge<-merge(uni_data_merge,uni_data_05,all=T)
uni_data_merge<-merge(uni_data_merge,uni_data_06,all=T)
uni_data_merge<-merge(uni_data_merge,uni_data_07,all=T)
uni_data_merge<-merge(uni_data_merge,uni_data_08,all=T)
uni_data_merge<-merge(uni_data_merge,uni_data_09,all=T)
uni_data_merge<-merge(uni_data_merge,uni_data_10,all=T)
# キーワードのばらつき。どうにか。これをグラフでみようとしたけど、うまくみれない。
# 表で。いろいろプログラム書きなおした。
# 吐血した。まずい。


setdiff(uni01,uni02)
setdiff(uni01,uniall)
# 差分比較
# 時間でどれだけキーワードがちがうか


################################################################# ちょこっと
source("/Users/senyoltw/dev/R_keygraph/R_keygraph_test.R")
# ちょこっと
KALL<-keygraph("outputalla.txt",50,50,50,50,5)
K01<-keygraph("output1a.txt",50,50,50,50,5)
K02<-keygraph("output2a.txt",50,50,50,50,5)
K03<-keygraph("output3a.txt",50,50,50,50,5)

keygraphall<-KALL[[7]]
keygraph01<-K01[[7]]
keygraph02<-K02[[7]]
keygraph03<-K03[[7]]

rk1<-rating_g(keygraph01,keygraphall)
rk2<-rating_g(keygraph02,keygraphall)
rk3<-rating_g(keygraph03,keygraphall)

out1<-as.data.frame(rk1)
out2<-as.data.frame(rk2)
out3<-as.data.frame(rk3)

graph<-rbind(out1,out2,out3)
rownames(graph)<-c("out1","out2","out3")
cor(graph[1],graph[2])
colnames(graph)<-c("Huffman","correlation ")
plot(graph)

uni01<-union(K01[[1]]$Term0,K01[[1]]$Term)
uni02<-union(K02[[1]]$Term0,K02[[1]]$Term)
uni03<-union(K03[[1]]$Term0,K03[[1]]$Term)
uni<-c(uni01,uni02,uni03)
uni_count<-unique(uni)
uni_num<-numeric(length(uni_count))
for (n in 1:length(uni_count)) { 
	uni_num[n]<-sum(uni_count[n]==uni)
}
uni_data<-data.frame(name=uni_count,num=round(uni_num/3,1),stringsAsFactors=FALSE)

keygraphplot(KALL)
keygraphplot_kai(KALL,uni_data)

##実験
source("/Users/senyoltw/dev/R_keygraph/R_keygraph_test.R")
keygraph_a<-KALL[[1]]
Key_w_G_hub_a<-KALL[[5]]
Key_w_I_a<-KALL[[6]]
uni_data_a<-uni_data
uni_data_b<-uni_data

uni_data_a[uni_data_a$num<0.5,]$num<-0

for(n in 1:length(uni_data_a[uni_data_a$num==0,]$name)){
	keygraph_a <- keygraph_a[keygraph_a$Term0 != uni_data_a[uni_data_a$num==0,]$name[n],]
	keygraph_a <- keygraph_a[keygraph_a$Term != uni_data_a[uni_data_a$num==0,]$name[n],]
	Key_w_G_hub_a <- Key_w_G_hub_a[Key_w_G_hub_a$word != uni_data_a[uni_data_a$num==0,]$name[n],]
	Key_w_I_a <- Key_w_I_a[Key_w_I_a$word != uni_data_a[uni_data_a$num==0,]$name[n],]

}

uni_data_a[uni_data_a$num==0.5,]$num<-0.1
uni_data_a[uni_data_a$num==0.6,]$num<-0.2
uni_data_a[uni_data_a$num==0.7,]$num<-0.4
uni_data_a[uni_data_a$num==0.8,]$num<-0.6
uni_data_a[uni_data_a$num==0.9,]$num<-0.8
uni_data_a[uni_data_a$num==1.0,]$num<-1

keygraphplot_kaikai(keygraph_a,Key_w_G_hub_a,Key_w_I_a,uni_data_a)

###########論文メモ


> par(family="HiraKakuPro-W3")
> word_probability<-uni_data$num
> hist(word_probability,xlab="出現率")


###########紙芝居KeyGraph解析ここから

source("/Users/senyoltw/dev/R_keygraph/R_keygraph_test.R")
day1<-keygraph("t01.txt",10,10,10,10,3)
day2<-keygraph("t02.txt",10,10,10,10,3)
day3<-keygraph("t03.txt",10,10,10,10,3)
# day4<-keygraph("t04.txt",20,20,20,20,5)
# day5<-keygraph("t05.txt",20,20,20,20,5)
# day6<-keygraph("t06.txt",20,20,20,20,5)
# day7<-keygraph("t07.txt",20,20,20,20,5)
# day8<-keygraph("t08.txt",20,20,20,20,5)
# day9<-keygraph("t09.txt",20,20,20,20,5)
# viewday<-keygraph("t10.txt",20,20,20,20,5)

day<-tougou_kami(day2[[1]],day1[[1]])
day<-tougou_kami(day3[[1]],day)
# day<-tougou_kami(day4[[1]],day)
# day<-tougou_kami(day5[[1]],day)
# day<-tougou_kami(day6[[1]],day)
# day<-tougou_kami(day7[[1]],day)
# day<-tougou_kami(day8[[1]],day)
# day<-tougou_kami(day9[[1]],day)
# day<-tougou_kami(viewday[[1]],day)

# 1日から10にちまでを統合。

g <-graph.data.frame(day, directed = F)

g<-loop_kami(g,day1,0.1)
g<-loop_kami(g,day2,0.4)
g<-loop_kami(g,day3,1.0)
# g<-loop_kami(g,day4,0.4)
# g<-loop_kami(g,day5,0.5)
# g<-loop_kami(g,day6,0.6)
# g<-loop_kami(g,day7,0.7)
# g<-loop_kami(g,day8,0.8)
# g<-loop_kami(g,day9,0.9)
# g<-loop_kami(g,viewday,1)
# 透過度を設定

# グラフプロット関数
E(g)[Span == 3]$width <- 2
# 線の幅
E(g)$lty <- 1
# 実線
E(g)[Span == 3]$lty <- 3
# 点線
V(g)$size <- 5
V(g)$label.cex <- 0.7
V(g)$label.dist <- 0.5
V(g)$label.degree <- pi/2
V(g)$label.color <- "black"
# 色
plot(g,layout=layout.kamada.kawai ,vertex.label=V(g)$name)
# kamada.kawaiでいいよね。力学もでるだし。
