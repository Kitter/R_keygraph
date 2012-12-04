library(RMeCab)
library(igraph)

# 下準備
textdata <- "error3.txt"
# テキストデータ。ルート指定しないなら、Rのパス上に置く必要ある。文字コードUTF-8の改行コードLF。  
M1 <- 20
# 上位M1以内の単語
M2 <- 20
# 共起度の実線
M3 <- 20
# 橋の数
M4 <- 20
# キーアイテム集合
M5 <- 5
# キーアイテム



# データ洗浄
text <-  RMeCabFreq(textdata)
# 読み込み、解析。頻度表を作成。
text_temp <- text[text$Info1 =="名詞" & text$Info2 == "一般" |text$Info1 =="動詞" & text$Info2 == "自立" |text$Info1 =="形容詞" & text$Info2 == "自立",]
# 抽出できた。抽出条件もひとまず。これで。
text_temp <- text_temp[text_temp$Term!="する"&text_temp$Term!="いる"&text_temp$Term!="いう"&text_temp$Term!="できる"&text_temp$Term!="なる"&text_temp$Term !="ない"&text_temp$Term!="言う"&text_temp$Term!="ある"&text_temp$Term!="いい"&text_temp$Term!="やる"&text_temp$Term!="思う"&text_temp$Term!="人"&text_temp$Term!="ば",]
# 抽出ブラックリスト。するとか、なるとか。いるとか。ひとまず。



# 共起グラフの作成
text_freq <- subset(text_temp,text_temp$Freq>=tail(sort(text_temp$Freq),n=M1)[1])
# tail(text_temp[order(text_temp$Freq),],n=20)から変更。これで上位定数位より上を抽出可能に。
# これがM1
text_w <- text_temp[,1] 
# 橋の形成で使用。
text_freq[,1]
top_text_freq <- text_freq[,1]
# top_text_freqは文字列ベクトル。top_text_freq[1]は文字。
# for 1からlength(top_text_freq)までループ1
word_n <- 0
kyoukiG <- 0
for (n in 1:length(top_text_freq)) {
	word_n <- as.data.frame(collocate(textdata,node=top_text_freq[n],span=5)[c(T,F,F,T,F)])
	# print(top_text_freq[n])
	# たとえばだけど、spanを1から「。」がBefore Afterで2個出てくるまでループさせるとか・・・。
	# word_nはテキスト全部とある単語の共起度一覧。スパン5は変わらず。どうにかしないと。ココ。
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
	# kyoukiG <- rbindでword_mをまた結合祭り。
}
# ループ1ここまで

kyoukiG
kyoukiGX <- 0
for (n in 1:length(top_text_freq)) { 
	print(top_text_freq[n])
	kyoukiGX <- rbind(kyoukiG[kyoukiG$Term0 == top_text_freq[n],],kyoukiGX)
	if(length(kyoukiGX)==1){kyoukiGX <- 0}
	kyoukiG <- kyoukiG[kyoukiG$Term != top_text_freq[n] | kyoukiG$Term0 == top_text_freq[n],]
	print(kyoukiG)
}
kyoukiG <- kyoukiGX[kyoukiGX$Span>0,]
# 重複は抜く。

kyoukiG[order(kyoukiG$Span),]
kyoukiG <- subset(kyoukiG,kyoukiG$Span>=tail(sort(kyoukiG$Span),n=M2)[1])
# tail(kyoukiG[order(kyoukiG$Span),],n=20)
# これがM2。
kyoukiG


#graphdata_K<-graph.data.frame(kyoukiG, directed = F)
# E(g)$color <- "black"
#E(graphdata_K)$width <- 2
# 線の幅
#E(graphdata_K)$lty <- 1
# 実線
#V(graphdata_K)$size <- 5
#V(graphdata_K)$label.cex <- 0.7
#V(graphdata_K)$label.color <- "black"
#V(graphdata_K)$label.dist <- 0.5
#V(graphdata_K)$label.degree <- pi/2
#V(graphdata_K)$color <- "skyblue"
#plot(graphdata_K, vertex.label=V(graphdata_K)$name)
## 共起グラフをプロットしてみる。