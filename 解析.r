# 一番変化が大きいところが話題の転回点。
# じゃあ、わかったとして、それをどうプロットするか。
# 案1最初の案。変化点の大きい所で島を作るー>これにより、変換点の小さな島を見ることが出来る。そのあと、すべてから橋をだす。これにより、単語からの話題の発展を全体から見れる。
# テキストコマンド

find dev/twitter/ | grep -E "dev/twitter//2012-12-26.0[0-4]|dev/twitter//2012-12-25.0[5-9]|dev/twitter//2012-12-25.1[0-9]|dev/twitter//2012-12-25.2[0-3]" | xargs -0 mv temp/
find | grep -E "2012-12-25.0[0-4]|2012-12-25.0[5-9]|2012-12-25.1[0-9]|2012-12-25.2[0-3]" | xargs cat > test.txt

find dev/twitter/ | grep -h -E "dev/twitter//2012-12-25.0[0-4]|dev/twitter//2012-12-25.0[5-9]|dev/twitter//2012-12-25.1[0-9]|dev/twitter//2012-12-25.2[0-3]" > test.txt


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

twitter2txt("02.txt","t01.txt")
twitter2txt("03.txt","t02.txt")
twitter2txt("04.txt","t03.txt")
twitter2txt("05.txt","t04.txt")
twitter2txt("06.txt","t05.txt")
twitter2txt("07.txt","t06.txt")
twitter2txt("08.txt","t07.txt")
twitter2txt("09.txt","t08.txt")
twitter2txt("10.txt","t09.txt")
twitter2txt("11.txt","t10.txt")

Keygraph_split_analyze<-function(t01,t02,t03,t04,t05,t06,t07,t08,t09,t10){
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

}



source("/Users/senyoltw/dev/R_keygraph/R_keygraph_test.R")
twitter2txt("tt201301.txt","out01.txt")
twitter2txt("tt2013-01-02.txt","out0102.txt")
twitter2txt("tt2013-01-03.txt","out0103.txt")
twitter2txt("tt2013-01-04.txt","out0104.txt")
twitter2txt("tt2013-01-05.txt","out0105.txt")
twitter2txt("tt2013-01-06.txt","out0106.txt")
twitter2txt("tt2013-01-07.txt","out0107.txt")
twitter2txt("tt2013-01-08.txt","out0108.txt")
twitter2txt("tt2013-01-09.txt","out0109.txt")
# Twitterを読み込める形式に初回だけこれが必要。


source("/Users/senyoltw/dev/R_keygraph/R_keygraph_test.R")


KALL<-keygraph("outputall.txt",50,50,25,25,10)
K01<-keygraph("output1.txt",50,50,25,25,10)
K02<-keygraph("output2.txt",50,50,25,25,10)
K03<-keygraph("output3.txt",50,50,25,25,10)
K04<-keygraph("output4.txt",50,50,25,25,10)
K05<-keygraph("output5.txt",50,50,25,25,10)
K06<-keygraph("output6.txt",50,50,25,25,10)
K07<-keygraph("output7.txt",50,50,25,25,10)
K08<-keygraph("output8.txt",50,50,25,25,10)
K09<-keygraph("output9.txt",50,50,25,25,10)
K10<-keygraph("output10.txt",50,50,25,25,10)
# KeyGraph解析

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


# keyI01<-K01[[6]]
# keyI0102<-K0102[[6]]
# keyI0103<-K0103[[6]]
# keyI0104<-K0104[[6]]
# keyI0105<-K0105[[6]]
# keyI0106<-K0106[[6]]
# keyI0107<-K0107[[6]]
# keyI0108<-K0108[[6]]
# keyI0109<-K0109[[6]]
# # Keyアイテム10個

# s02<-match(keyI0102$word,keyI01$word)
# s03<-match(keyI0103$word,keyI01$word)
# s04<-match(keyI0104$word,keyI01$word)
# s05<-match(keyI0105$word,keyI01$word)
# s06<-match(keyI0106$word,keyI01$word)
# s07<-match(keyI0107$word,keyI01$word)
# s08<-match(keyI0108$word,keyI01$word)
# s09<-match(keyI0109$word,keyI01$word)

# s02<-s02[!is.na(s02)]
# s03<-s03[!is.na(s03)]
# s04<-s04[!is.na(s04)]
# s05<-s05[!is.na(s05)]
# s06<-s06[!is.na(s06)]
# s07<-s07[!is.na(s07)]
# s08<-s08[!is.na(s08)]
# s09<-s09[!is.na(s09)]
# # Keyアイテムを書けてないkeyI01と比較し、類似があるか抽出、NAと除く

# s02
# s03
# s04
# s05
# s06
# s07
# s08
# s09

