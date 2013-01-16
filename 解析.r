#5.差分をとるで絶対値？をとってあれする。
# > g01<-tougou(eva1,eva2)
# > g02<-tougou(eva2,eva1)
# > g011 <-graph.data.frame(g01, directed = F)
# > g022 <-graph.data.frame(g02, directed = F)
# > get.adjacency(g011,attr="Span")
#   get.adjacency(g022,attr="Span")
#   sum(abs(g01-g02))
# cor(
# g01[-seq(1,length(g01),by = nrow(g01)+1)],
# g02[-seq(1,length(g02),by = nrow(g02)+1)])
# 一番変化が大きいところが話題の転回点。
# じゃあ、わかったとして、それをどうプロットするか。
# 案1最初の案。変化点の大きい所で島を作るー>これにより、変換点の小さな島を見ることが出来る。そのあと、すべてから橋をだす。これにより、単語からの話題の発展を全体から見れる。

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
# Twitterを読み込める形式に

K01<-keygraph("out01.txt")
K0102<-keygraph("out0102.txt")
K0103<-keygraph("out0103.txt")
K0104<-keygraph("out0104.txt")
K0105<-keygraph("out0105.txt")
K0106<-keygraph("out0106.txt")
K0107<-keygraph("out0107.txt")
K0108<-keygraph("out0108.txt")
K0109<-keygraph("out0109.txt")
# KeyGraph解析

keygraph01<-K01[[7]]
keygraph0102<-K0102[[7]]
keygraph0103<-K0103[[7]]
keygraph0104<-K0104[[7]]
keygraph0105<-K0105[[7]]
keygraph0106<-K0106[[7]]
keygraph0107<-K0107[[7]]
keygraph0108<-K0108[[7]]
keygraph0109<-K0109[[7]]
# KeyGraph notグラフ描写用

rateing_g(keygraph0102,keygraph01)
rateing_g(keygraph0103,keygraph01)
rateing_g(keygraph0104,keygraph01)
rateing_g(keygraph0105,keygraph01)
rateing_g(keygraph0106,keygraph01)
rateing_g(keygraph0107,keygraph01)
rateing_g(keygraph0108,keygraph01)
rateing_g(keygraph0109,keygraph01)

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

