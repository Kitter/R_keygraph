####################################研究用KeyGraph。いろいろ改造してるかも・・・。解析の関数とかも追加してる。##############################################

library(RMeCab)
library(igraph)
library(rjson)

twitter2txt<-function(textdata="twitter.txt",outputtxt="output.txt"){
library(rjson)
# Twitter読み込み
tweetdata<-fromJSON(paste("[",paste(readLines(textdata), collapse=","),"]"))
#fromJSOM形式で読めるように加工
output<-sapply(tweetdata, function(x){x$text})
#行列に

# RTは削除？
write.table(output,outputtxt,append=F, quote=F, col.names=F,row.names=F)
#書き出し
}

rating_g<-function(ga,gb){
# グラフ評価用。ハフマン距離と相関係数.
g01 <-tougou(ga,gb)
g02 <-tougou(gb,ga)
g01 <-graph.data.frame(g01, directed = F)
g02 <-graph.data.frame(g02, directed = F)
g01 <-get.adjacency(g01,attr="Span")
g02 <-get.adjacency(g02,attr="Span")
hahu <-sum(abs(g01-g02))
sou<-cor(
g01[-seq(1,length(g01),by = nrow(g01)+1)],
g02[-seq(1,length(g02),by = nrow(g02)+1)])
x<-list(hahu,sou)
name<-c("ハフマン距離","相関係数")
names(x)<-name
return(x)
}


keygraphplot_kai<-function(KG,uni_data){

keygraph<-KG[[1]]
Key_w_G_hub<-KG[[5]]
Key_w_I<-KG[[6]]
# グラフプロット関数
g <-graph.data.frame(keygraph, directed = F)
# E(g)$color <- "black"
E(g)[Span == 3]$width <- 2
# 線の幅
E(g)$lty <- 1
# 実線
E(g)[Span == 3]$lty <- 3
# E(g)[Span == 3]$color <- "red"
# 点線
V(g)$size <- 5
V(g)$label.cex <- 0.7
V(g)$label.color <- "black"
V(g)$label.dist <- 0.5
V(g)$label.degree <- pi/2
for(n in 1:length(uni_data$num)){
	V(g)[name == uni_data$name[n]]$color <- rgb(0, 0, 1, alpha=uni_data$num[n])
	V(g)[name == uni_data$name[n]]$frame.color <- rgb(0, 0, 0, alpha=uni_data$num[n])
}
for(n in 1:length(Key_w_G_hub$word)){
	V(g)[name == Key_w_G_hub$word[n]]$color <- rgb(0, 0, 0, alpha=uni_data$num[uni_data$name==Key_w_G_hub$word[n]])
}
for(n in 1:length(Key_w_I$word)){
	V(g)[name == Key_w_I$word[n]]$color <- rgb(1, 0, 0, alpha=uni_data$num[uni_data$name==Key_w_I$word[n]])
}
for(n in 1:length(uni_data$num)){
	V(g)[name == uni_data$name[n]]$name <- paste(uni_data$name[[n]],uni_data$num[[n]])
}
# 色
plot(g,layout=layout.kamada.kawai ,vertex.label=V(g)$name)
# kamada.kawaiでいいよね。力学もでるだし。
}

keygraphplot_kaikai<-function(keygraph,Key_w_G_hub,Key_w_I,uni_data){
#aa<-round(10/length(unique(uni_data$num)),1)
# グラフプロット関数
g <-graph.data.frame(keygraph, directed = F)
# E(g)$color <- "black"
E(g)[Span == 3]$width <- 2
# 線の幅
E(g)$lty <- 1
# 実線
E(g)[Span == 3]$lty <- 3
# E(g)[Span == 3]$color <- "red"
# 点線
V(g)$size <- 5
V(g)$label.cex <- 0.7
V(g)$label.color <- "black"
V(g)$label.dist <- 0.5
V(g)$label.degree <- pi/2
for(n in 1:length(uni_data$num)){
	V(g)[name == uni_data$name[n]]$color <- rgb(0, 0, 1, alpha=uni_data$num[n])
	V(g)[name == uni_data$name[n]]$frame.color <- rgb(0, 0, 0, alpha=uni_data$num[n])
}
for(n in 1:length(Key_w_G_hub$word)){
	V(g)[name == Key_w_G_hub$word[n]]$color <- rgb(0, 0, 0, alpha=uni_data$num[uni_data$name==Key_w_G_hub$word[n]])
}
for(n in 1:length(Key_w_I$word)){
	V(g)[name == Key_w_I$word[n]]$color <- rgb(1, 0, 0, alpha=uni_data$num[uni_data$name==Key_w_I$word[n]])
}
# for(n in 1:length(uni_data$num)){
# 	V(g)[name == uni_data$name[n]]$name <- paste(uni_data$name[[n]],uni_data$num[[n]])
# }
# 色
plot(g,layout=layout.kamada.kawai ,vertex.label=V(g)$name)
# kamada.kawaiでいいよね。力学もでるだし。
}

tougou_kami<-function(yuusen,haijo){
# 紙芝居用
# 行列Aと行列Bの統合。もう片方との重複を削除。さいごに統合。
for (n in 1:length(yuusen$Span)) { 
	haijo <- haijo[haijo$Term0 != yuusen[[1]][n]|haijo$Term != yuusen[[2]][n],]
	haijo <- haijo[haijo$Term != yuusen[[1]][n]|haijo$Term0 != yuusen[[2]][n],]
}

tougou <- merge(haijo,yuusen,all=T)
return(tougou)
}

loop_kami<-function(day,keygraph,touka){
# 紙芝居用
g<-day
# グラフ
KG<-keygraph
# KeyGraphデータ

keygraph<-KG[[1]]
Key_w_G_hub<-KG[[5]]
Key_w_I<-KG[[6]]
word<-union(KG[[1]]$Term0,KG[[1]]$Term)

# for(n in 1:length(day1[[1]]$Term0)){
# 	E(g)[Span == touka]$color <- rgb(0, 0, 0, alpha=touka)
# }
for(n in 1:length(word)){
	V(g)[name == word[n]]$color <- rgb(0, 0, 1, alpha=touka)
}
for(n in 1:length(Key_w_G_hub$word)){
	V(g)[name == Key_w_G_hub$word[n]]$color <- rgb(0, 0, 0, alpha=touka)
}
for(n in 1:length(Key_w_I$word)){
	V(g)[name == Key_w_I$word[n]]$color <- rgb(1, 0, 0, alpha=touka)
}
# for(n in 1:length(word)){
# 	V(g)[name == word[n]]$label.color <- rgb(0, 0, 0, alpha=touka)
# }
return(g)
}



keygraphplot<-function(KG){

keygraph<-KG[[1]]
Key_w_G_hub<-KG[[5]]
Key_w_I<-KG[[6]]
# グラフプロット関数
g <-graph.data.frame(keygraph, directed = F)
# E(g)$color <- "black"
E(g)[Span == 3]$width <- 2
# 線の幅
E(g)$lty <- 1
# 実線
E(g)[Span == 3]$lty <- 3
# E(g)[Span == 3]$color <- "red"
# 点線
V(g)$size <- 5
V(g)$label.cex <- 0.7
V(g)$label.color <- "black"
V(g)$label.dist <- 0.5
V(g)$label.degree <- pi/2
V(g)$color <- "skyblue"
for(n in 1:length(Key_w_G_hub$word)){
	V(g)[name == Key_w_G_hub$word[n]]$color <- "grey"
}
for(n in 1:length(Key_w_I$word)){
	V(g)[name == Key_w_I$word[n]]$color <- "red"
}
# 色
plot(g,layout=layout.kamada.kawai ,vertex.label=V(g)$name)
}

tougou<-function(yuusen,haijo){
# 行列Aと行列Bの統合。片方を0にし、もう片方との重複を削除。さいごに統合。

haijo$Span <- 0

for (n in 1:length(yuusen$Span)) { 
	haijo <- haijo[haijo$Term0 != yuusen[[1]][n]|haijo$Term != yuusen[[2]][n],]
	haijo <- haijo[haijo$Term != yuusen[[1]][n]|haijo$Term0 != yuusen[[2]][n],]
}

tougou <- merge(haijo,yuusen,all=T)
return(tougou)
}


keygraph<-function(textdata="output.txt",M1=20,M2=20,M3=10,M4=10,M5=5) {

# textdata <- "output.txt"
# # テキストデータ。ルート指定しないなら、Rのパス上に置く必要ある。文字コードUTF-8の改行コードLF。  
# M1 <- 20
# # 上位M1以内の単語
# M2 <- 20
# # 共起度の実線
# M3 <- 20
# # 橋の数
# M4 <- 20
# # キーアイテム集合
# M5 <- 5
# # キーアイテム
# KeyGraphのアルゴリズム、テキストマイニングにとっかしてるの修正したほうがいいのでは。例えば地震や共起度のある行列だったら言葉でなくても大丈夫。もしやるならテキストデータを毎回解析用に変換する。

# データ洗浄
text <-  RMeCabFreq(textdata)
# 読み込み、解析。頻度表を作成。
text_temp <- text[text$Info1 =="名詞" & text$Info2 == "一般" |text$Info1 =="動詞" & text$Info2 == "自立" |text$Info1 =="形容詞" & text$Info2 == "自立",]
# 抽出できた。抽出条件もひとまず。これで。キーワードの分散ってどうなんだろ	
text_temp <- text_temp[
	text_temp$Term!="する"
	&text_temp$Term!="いる"
	&text_temp$Term!="いう"
	&text_temp$Term!="できる"
	&text_temp$Term!="なる"
	&text_temp$Term!="ない"
	&text_temp$Term!="言う"
	&text_temp$Term!="ある"
	&text_temp$Term!="いい"
	&text_temp$Term!="やる"
	&text_temp$Term!="思う"
	&text_temp$Term!="人"
	&text_temp$Term!="ば"
	&text_temp$Term!="ー"
	&text_temp$Term!="てる"
	&text_temp$Term!="て"
	&text_temp$Term!="は"
	&text_temp$Term!="くる"
	&text_temp$Term!="出"
	&text_temp$Term!="お"
	&text_temp$Term!="な"
	&text_temp$Term!="おく"
	&text_temp$Term!="うち"
	&text_temp$Term!="食べる"
	&text_temp$Term!="行ける"
	&text_temp$Term!="いく"
	&text_temp$Term!="入る"
	&text_temp$Term!="出る"
	&text_temp$Term!="いしょ"
	&text_temp$Term!="すごい"
	&text_temp$Term!="http"
	&text_temp$Term!="人人"
	&text_temp$Term!="gu"
	&text_temp$Term!="lt"
	&text_temp$Term!="at"
	&text_temp$Term!="www"
	&text_temp$Term!="聞く"
	&text_temp$Term!="来る"
	&text_temp$Term!="臭い"
	&text_temp$Term!="見る"
	&text_temp$Term!="わかる"
	&text_temp$Term!="感じ"
	&text_temp$Term!="行く"
	&text_temp$Term!="帰る"
	&text_temp$Term!="寝る"
	&text_temp$Term!="持つ"
	&text_temp$Term!="出す"
	&text_temp$Term!="使う"
	&text_temp$Term!="起きる"
	&text_temp$Term!="笑"
	&text_temp$Term!="帰れる"
	&text_temp$Term!="考える"
	&text_temp$Term!="自分"
	&text_temp$Term!="あと"
	&text_temp$Term!="ﾟ"
	&text_temp$Term!="Д"
	&text_temp$Term!="д"
	&text_temp$Term!="ﾉ"
	&text_temp$Term!="ッ"
	&text_temp$Term!="pen"
	&text_temp$Term!="bot"
	&text_temp$Term!="gt"
	&text_temp$Term!="ふ"
	&text_temp$Term!="ぁぼ"
	&text_temp$Term!="西"
	&text_temp$Term!="棟"
	&text_temp$Term!="都"
	&text_temp$Term!="ます"
	&text_temp$Term!="まま"
	&text_temp$Term!="そう"
	&text_temp$Term!="でる"
	&text_temp$Term!="みる"
	&text_temp$Term!="せる"
	&text_temp$Term!="たい"
	&text_temp$Term!="わ"
	&text_temp$Term!="たい"
	&text_temp$Term!="ね"
	&text_temp$Term!="ちゃん"
	&text_temp$Term!="さん"
	&text_temp$Term!="まま"
	&text_temp$Term!="とく"
	&text_temp$Term!="すぎる"
	&text_temp$Term!="店"
	&text_temp$Term!="子"
	&text_temp$Term!="方"
	&text_temp$Term!="先"
	&text_temp$Term!="中"
	&text_temp$Term!="後"
	&text_temp$Term!="い"
	&text_temp$Term!="ち"
	&text_temp$Term!="ど"
	&text_temp$Term!="あや"
	&text_temp$Term!="実"
	&text_temp$Term!="wwwwwwwwwwwwwwwwwwwwwwwww"
	&text_temp$Term!="anime"
	&text_temp$Term!="（株）"
	&text_temp$Term!="所"
	&text_temp$Term!="部"
	&text_temp$Term!="株"
	&text_temp$Term!="か"
	&text_temp$Term!="年"
	&text_temp$Term!="姿"
	&text_temp$Term!="日"
	&text_temp$Term!="気"
	&text_temp$Term!="よう"
	&text_temp$Term!="つける"
	&text_temp$Term!="うい"
	&text_temp$Term!="へ"
	&text_temp$Term!="おお"
	&text_temp$Term!="分"
	&text_temp$Term!="よい"
	&text_temp$Term!="ちゃう"
	&text_temp$Term!="今日"
	&text_temp$Term!="明日"
	&text_temp$Term!="ta"
	&text_temp$Term!="in"
	&text_temp$Term!="on"
	&text_temp$Term!="www"
	&text_temp$Term!="ーー"
	&text_temp$Term!="ゆ"
	&text_temp$Term!="女"
	&text_temp$Term!="男"


,]
# 抽出ブラックリスト。するとか、なるとか。いるとか。ひとまず。メール怖い。

# 共起グラフの作成
text_freq <- subset(text_temp,text_temp$Freq>=tail(sort(text_temp$Freq),n=M1)[1])
# tail(text_temp[order(text_temp$Freq),],n=20)から変更。これで上位定数位より上を抽出可能に。
# これがM1
text_w <- unique(text_temp[,1])
# 橋の形成で使用。uniqueは重複する単語が出るため。寒いでも形容詞と名詞でふたつでる。等。
text_freq[,1]
top_text_freq <- text_freq[,1]
top_freq <- text_freq[,4]
# top_text_freqは文字列ベクトル。top_text_freq[1]は文字。
# for 1からlength(top_text_freq)までループ1
word_n <- 0
kyoukiG <- 0
for (n in 1:length(top_text_freq)) {
	word_n <- as.data.frame(collocate(textdata,node=top_text_freq[n],span=5)[c(T,F,F,T,F)])
	# print(top_text_freq[n])
	# たとえばだけど、spanを1から「。」がBefore Afterで2個出てくるまでループさせるとか・・・。
	# word_nはテキスト全部とある単語の共起度一覧。スパン5は変わらず。どうにかしないと。ココ。
	# # Jaccard 係数= AandB/AorBにするには以下のコメントを外す。もう一つ、橋のとこにもあるので外すときは、そちらも。
	# word_n$Span<-word_n$Span/(word_n$Span + top_freq[n])
	# 導入すべきかせざるべきか。なんかKey(w)のときおかしくなる。この話、どこにも書いてなくて困る
	word_m <- 0
	# word_mをリセット
	for (m in 1:length(top_text_freq)) {
		# for 1からlength(top_text_freq)までループ2
		word_meros <- word_n[word_n$Term==top_text_freq[m],]
		# top_text_freq[m]を抽出word_meros関数を別の名前に
		if(top_text_freq[n] == top_text_freq[m]){next}
		if(length(word_meros$Span) == 0){next}
		# ココでT,F判別。nとmが同じなら次のループへ。また、共起度あるなら下、次のループへ。長さ判別で0のやつをnextに持っていく。
		word_m <- rbind(word_m,word_meros)
		# word_merosをrbind関数でつなげる。
	}
	# ループ2ここまで
	if(length(word_m) == 1){next}
	# word_mに共起度が存在しない場合、次のループへ。
	word_m$Term0<-top_text_freq[n]
	# Term0を追加
	word_m <- word_m[,c(3,1,2)]
	# Term0 Term Spanの順番に
	# グラフで描写出来るようにデータを整理。
	kyoukiG <- rbind(kyoukiG,word_m)
	# kyoukiG <- rbindでword_mをまた結合。
}
# ループ1ここまで

kyoukiGX <- 0
top_text_freq
# union(kyoukiG$Term0,kyoukiG$Term)
# こっちの方がいい？外部関数化するときに考えておく。
for (n in 1:length(top_text_freq)) { 
	kyoukiGX <- rbind(kyoukiG[kyoukiG$Term0 == top_text_freq[n],],kyoukiGX)
	# Term0でtop_text_freq[n]のものを抜き出す。それをkyoukiGXに入れる。
	if(length(kyoukiGX)==1){kyoukiGX <- 0}
	# もし、抜き出したのが0件だった場合、次の時にkyoukiGXがエラー起こすのでkyoukiGXを0にリセット。
	kyoukiG <- kyoukiG[kyoukiG$Term0 == top_text_freq[n] | kyoukiG$Term != top_text_freq[n] ,]
	# kyoukiGからTerm0がtop_text_freq[n]のものと、Termがtop_text_freq[n]のものを抜き出す。
}
kyoukiG <- kyoukiGX[kyoukiGX$Span>0,]
# 重複を抜く。AとB、BとAは同一ってことでどちらか削除

kyoukiG <- subset(kyoukiG,kyoukiG$Span>=tail(sort(kyoukiG$Span),n=M2)[1])
# tail(kyoukiG[order(kyoukiG$Span),],n=20)
# これがM2。
kyoukiG


graphdata_K<-graph.data.frame(kyoukiG, directed = F)

E(graphdata_K)$width <- 2
# 線の幅
E(graphdata_K)$lty <- 1
# 実線
V(graphdata_K)$size <- 5
V(graphdata_K)$label.cex <- 0.7
V(graphdata_K)$label.color <- "black"
V(graphdata_K)$label.dist <- 0.5
V(graphdata_K)$label.degree <- pi/2
V(graphdata_K)$color <- "skyblue"
plot(graphdata_K, vertex.label=V(graphdata_K)$name)
# 共起グラフをプロットしてみる。



# 単連結削除	
for (n in 1:length(kyoukiG$Span)) { 
	# ループ開始
	kyoukiGX <- kyoukiG[kyoukiG$Term0 != kyoukiG[n,1] | kyoukiG$Term != kyoukiG[n,2],]
	# まず、2つの線を外してみる
	if(length(kyoukiGX[kyoukiGX$Term0 == kyoukiG[n,1]|kyoukiGX$Term == kyoukiG[n,1],]$Span)==0){
		kyoukiG[kyoukiG$Term0 == kyoukiG[n,1]&kyoukiG$Term == kyoukiG[n,2],]$Span <- 0
		next
	}
	if(length(kyoukiGX[kyoukiGX$Term0 == kyoukiG[n,2]|kyoukiGX$Term == kyoukiG[n,2],]$Span)==0){
		kyoukiG[kyoukiG$Term0 == kyoukiG[n,1]&kyoukiG$Term == kyoukiG[n,2],]$Span <- 0
		next
	}
	# 消した文章あるかどうか。つまり、もし、どちらかが0ならそこの組み合わせの共起度を0にして、次へ。
	graphdata<-graph.data.frame(kyoukiGX, directed = F)
	# 変換。データ処理。
	# plot(graphdata, vertex.label=V(graphdata)$name)
	# ↑これ見てると面白い。
	if(length(get.all.shortest.paths(graphdata,kyoukiG[n,1],to = kyoukiG[n,2])[[1]])==0){
		kyoukiG[kyoukiG$Term0 == kyoukiG[n,1]&kyoukiG$Term == kyoukiG[n,2],]$Span <- 0
		next
	}
	# 1:存在する 0:存在しない	
	# 道はあるかどうかなかったらそこの組み合わせの共起度を0にしてつぎへ。
}
kyoukiGX <- kyoukiG[kyoukiG$Span>0,]
kyoukiGX
# 島


#graphdata_T<-graph.data.frame(kyoukiGX, directed = F)
# E(g)$color <- "black"
# E(graphdata_T)$width <- 2
# 線の幅
# E(graphdata_T)$lty <- 1
# 実線
# V(graphdata_T)$size <- 5
# V(graphdata_T)$label.cex <- 0.7
# V(graphdata_T)$label.color <- "black"
# V(graphdata_T)$label.dist <- 0.5
# V(graphdata_T)$label.degree <- pi/2
# V(graphdata_T)$color <- "skyblue"
# plot(graphdata_T, vertex.label=V(graphdata_T)$name)
## 単連結削除した共起グラフをプロットしてみる。	


island_g <- union(kyoukiGX$Term0,kyoukiGX$Term)
island_g
# これが各島g

# 橋の形成。
# 島gとすべての単語wに対する共起度を測定。
word_n <- 0
kyoukiGW <- 0
for (n in 1:length(island_g)) {
	word_n <- as.data.frame(collocate(textdata,node=island_g[n],span=5)[c(T,F,F,T,F)])
	# word_nはテキスト全部とある単語(島)の共起度一覧。スパン5は変わらず。どうにかしないと。ココ。
	# これは普通の共起度
	# Jaccard 係数= AandB/AorBにするには以下のコメントを外す。未完成。island_gでの共起度がすでにJaccard 係数になってるため。島での共起度をどこからか持っていく。
	# word_n$Span<-word_n$Span/(word_n$Span + top_freq[n])
	# 導入すべきかせざるべきか。
	word_m <- 0
	# word_mをリセット
	for (m in 1:length(text_w)) {
		# for 1からlength(text_w)までループ2
		word_meros <- word_n[word_n$Term==text_w[m],]
		# text_w[m]を抽出word_meros関数を別の名前に
		if(island_g[n] == text_w[m]){next}
		if(length(word_meros$Span) == 0){next}
		# ココでT,F判別。nとmが同じなら次のループへ。また、共起度あるなら下、次のループへ。長さ判別で0のやつをnextに持っていく。
		word_m <- rbind(word_m,word_meros)
		# word_merosをrbind関数でつなげる。
	}
	# ループ2ここまで
	if(length(word_m) == 1){next}
	# word_mに共起度が存在しない場合、次のループへ。
	word_m$Term0<-island_g[n]
	# Term0を追加
	word_m <- word_m[,c(3,1,2)]
	# Term0 Term Spanの順番に
	# グラフで描写出来るようにデータを整理。
	kyoukiGW <- rbind(kyoukiGW,word_m)
	# kyoukiGW <- rbindでword_mをまた結合
}
# ループ1ここまで

kyoukiGWX <- 0
union(kyoukiGW$Term0,kyoukiGW$Term)
island_g
for (n in 1:length(island_g)) { 
	kyoukiGWX <- rbind(kyoukiGW[kyoukiGW$Term0 == island_g[n],],kyoukiGWX)
	if(length(kyoukiGWX)==1){kyoukiGWX <- 0}
	kyoukiGW <- kyoukiGW[kyoukiGW$Term != island_g[n] | kyoukiGW$Term0 == island_g[n],]
}
kyoukiGW <- kyoukiGWX[kyoukiGWX$Span>0,]
# 重複を削除。

kyoukiGW <- subset(kyoukiGW,kyoukiGW$Span>=tail(sort(kyoukiGW$Span),n=M3)[1])
# tail(kyoukiGW[order(kyoukiGW$Span),],n=10)
# これがM3の橋。
kyoukiGW

#graphdata_T<-graph.data.frame(kyoukiGW, directed = F)
# E(g)$color <- "black"
# E(graphdata_T)$width <- 2
# 線の幅
# E(graphdata_T)$lty <- 1
# 実線
# V(graphdata_T)$size <- 5
# V(graphdata_T)$label.cex <- 0.7
# V(graphdata_T)$label.color <- "black"
# V(graphdata_T)$label.dist <- 0.5
# V(graphdata_T)$label.degree <- pi/2
# V(graphdata_T)$color <- "skyblue"
# plot(graphdata_T, vertex.label=V(graphdata_T)$name)
## 橋をプロットしてみる。	


# Key(w)作り。
# 橋を介して w と結ばれる全ての島 g との共起度の和を Key(w) とする。
# 1をオーバーしたとき、強制的に1にしてもいいみたい
# Jaccard 係数を導入した場合、0から100の確率にはならないけど、どうだろう。その論文ってあるの？
item_w <- union(kyoukiGW$Term0,kyoukiGW$Term)
item_w
# これとすべての島island_gとの共起度を測定
# n<-1
Key_w <- data.frame(word="word",pro=0)
# データフレームを事前に作成
for (n in 1:length(item_w)) { 
	item_wX <- 0
	pro_w <- 1
	item_wX <- rbind(kyoukiGW[kyoukiGW$Term0 == item_w[n],] , kyoukiGW[kyoukiGW$Term == item_w[n],])
	for(m in 1:length(island_g)) { 
		# 各島
		if(island_g[m] == item_w[n]){next}
		if(length(item_wX[item_wX$Term0 == island_g[m],]$Span)==1){
			probability_w <- 1 - item_wX[item_wX$Term0 == island_g[m],]$Span/text_temp[text_temp$Term == island_g[m],]$Freq
			pro_w <- pro_w*probability_w
		}

		if(length(item_wX[item_wX$Term == island_g[m],]$Span)==1){
			probability_w <- 1 - item_wX[item_wX$Term == island_g[m],]$Span/text_temp[text_temp$Term == island_g[m],]$Freq
			pro_w <- pro_w*probability_w
		}
	}
	pro_w <- 1- pro_w
	key_wX <- data.frame(word=item_w[n],pro=pro_w)
	Key_w <- rbind(Key_w,key_wX)
}
Key_w <- Key_w[Key_w$pro>0,]
Key_w

Key_w_G <- subset(Key_w,Key_w$pro>=tail(sort(Key_w$pro),n=M4)[1])
# キーアイテム集合

Key_w_G_hub <- Key_w_G
for (n in 1:length(island_g)) { 
	# ハブの抽出
	Key_w_G_hub <- Key_w_G_hub[Key_w_G_hub$word != island_g[n],]
}
# ハブ

Key_w_I <- subset(Key_w,Key_w$pro>=tail(sort(Key_w$pro),n=M5)[1])
# キーアイテム	


# プロット
KG_sima <-kyoukiGX # 島 太い
KG_hashi <-kyoukiGW # 橋 細い
Key_w_G # キーアイテム集合
Key_w_G_hub # ハブ 灰色
Key_w_I # キーアイテム 赤色

kyoukiGX_RAW<-kyoukiGX
kyoukiGW_RAW<-kyoukiGW

kyoukiGX$Span <- 5
kyoukiGW$Span <- 3
# グラフプロットのために共起度統一

for (n in 1:length(kyoukiGW$Span)) { 
	kyoukiGX <- kyoukiGX[kyoukiGX$Term0 != kyoukiGW[[1]][n]|kyoukiGX$Term != kyoukiGW[[2]][n],]
	kyoukiGX <- kyoukiGX[kyoukiGX$Term != kyoukiGW[[1]][n]|kyoukiGX$Term0 != kyoukiGW[[2]][n],]
}
# 橋優先

for (n in 1:length(kyoukiGW_RAW$Span)) { 
	kyoukiGX_RAW <- kyoukiGX_RAW[kyoukiGX_RAW$Term0 != kyoukiGW_RAW[[1]][n]|kyoukiGX_RAW$Term != kyoukiGW_RAW[[2]][n],]
	kyoukiGX_RAW <- kyoukiGX_RAW[kyoukiGX_RAW$Term != kyoukiGW_RAW[[1]][n]|kyoukiGX_RAW$Term0 != kyoukiGW_RAW[[2]][n],]
}
# 橋優先

keygraph <- merge(kyoukiGX,kyoukiGW,all=T)
keygraph_RAW <- merge(kyoukiGX_RAW,kyoukiGW_RAW,all=T)




# ここからグラフプロット
g <-graph.data.frame(keygraph, directed = F)
# E(g)$color <- "black"
E(g)[Span == 5]$width <- 3
E(g)[Span == 3]$width <- 2
# 線の幅
E(g)$lty <- 1
# 実線
E(g)[Span == 3]$lty <- 3
# E(g)[Span == 3]$color <- "red"
# 点線
V(g)$size <- 5
V(g)$label.cex <- 0.7
V(g)$label.color <- "black"
V(g)$label.dist <- 0.5
V(g)$label.degree <- pi/2
V(g)$color <- "skyblue"
for(n in 1:length(Key_w_G_hub$word)){
	V(g)[name == Key_w_G_hub$word[n]]$color <- "grey"
}
for(n in 1:length(Key_w_I$word)){
	V(g)[name == Key_w_I$word[n]]$color <- "red"
}
# 色
plot(g,layout=layout.kamada.kawai ,vertex.label=V(g)$name)

return(list(keygraph,KG_sima,KG_hashi,Key_w_G,Key_w_G_hub,Key_w_I,keygraph_RAW,text_freq))
}