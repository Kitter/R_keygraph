library(RMeCab)
text <-  RMeCabFreq("merosu.txt")
# 読み込み、解析。頻度表を作成。
head(text)
text_temp <- text[text$Info1 =="名詞" & text$Info2 == "一般" |text$Info1 =="動詞" & text$Info2 == "自立" |text$Info1 =="形容詞" & text$Info2 == "自立",]
# 抽出できた。抽出条件もひとまず。これで。
text_freq <- tail(text_temp[order(text_temp$Freq),],n=20)
# トップ20を抽出。tailはどうかと思うから後で変更。
## order関数でなくrank関数の方が良いのでは？それなら、順番が1, 2.5, 2.5, 4, 5, 6, 7.5, 7.5, 9・・・って感じでソートされるので、x<9とか出来る。はず。にょわー☆
text_freq[,1]
# 結果
# [1] "村"               "死ぬ"             "信じる"           "殴る"            
# [5] "市"               "いい"             "出来る"           "妹"              
# [9] "男"               "言う"             "セリヌンティウス" "殺す"            
# [13] "王"               "友"               "人"               "走る"            
# [17] "無い"             "なる"             "する"             "メロス"   
top_text_freq <- text_freq[,1]
# 共起度を計測。修正多し。
# spanだから文単位じゃない、後で直す。眠い。
# ひとまず、ここ以降を重点的に修正！！
# 更にループでもない、付け焼刃。後で直す。文字と数字を一致させてループ回す方法、前期にやったはず。


#######################がんばる！！！！#######################
# 以下をループ仕様に変更
# top_text_freqは文字列ベクトル。top_text_freq[1]は"村"
## 必要そうな情報 top_text_freqの数。
length(top_text_freq)
##	for 1からlength(top_text_freq)までループ
word_n <- 0
kyoukiG <- 0
for (n in 1:length(top_text_freq)) {
	word_n <- as.data.frame(collocate("merosu.txt",node=top_text_freq[n],span=5)[c(T,F,F,T,F)])
	print(top_text_freq[n])
	print(word_n)
##		word_n <- as.data.frame(collocate("merosu.txt",node="top_text_freq[n]",span=5)[c(T,F,F,T,F)])
##		# word_nはテキスト全部とある単語の共起度一覧。スパン5は変わらず。どうにかしないと。ココ。
	word_m <- 0
	#word_mをリセット
	for (m in 1:length(top_text_freq)) {
##		for 1からlength(top_text_freq)
		word_meros <- word_n[word_n$Term==top_text_freq[m],]
##		word_meros <- word_n[word_n$Term=="top_text_freq[m]",]
		if(length(word_meros$Span) == 0){next}
##		ココでT,F判別。共起度あるなら下、無いなら上へってやらんと。長さ判別で0のやつをnextに持っていく発想に2日かかった。もっと精進。
		print(word_meros)
		word_m <- rbind(word_m,word_meros)
		word_m
		print(word_m)
		##ココが共起度0の時なんか変な感じ！！！！
##			word_merosをrbind関数でつなげる。全部！ぐるぐる共起度抽出回し祭りｷﾀ━(ﾟ∀ﾟ)━!
	}
##			ループここまで
	print(word_m)
	word_m$Term0<-top_text_freq[n]
	#Term0を追加
	word_m <- word_m[,c(3,1,2)]
	#Term0 Term Spanの順番に
	print(word_m)
##	# グラフで描写出来るようにデータを整理。
	kyoukiG <- rbind(kyoukiG,word_m)
##		kyoukiG <- rbindでword_mをまた結合祭り。
}
kyoukiG <- kyoukiG[kyoukiG$Span!=0,]
# kyoukiGの条件=Spanが0の部分は除く関数作る。これ、マトリクスに出来ないかな？
kyoukiG
##		ループおしまい。
##
##		これで、ここまで自動化出来たはず。
##		kyoukiG <- kyoukiGを半分にする必要あり・・・？あれ、メロスはメロスもあってメロスとセリヌンティウスとセリヌンティウスとメロスもあるんだから・・・？でも共起度が往復するだけだから大丈夫？うーん、igraphでテストデータ作ってみないことにはわからないかも。ダメだったら修正どうにか書ける必要がある。メロスとメロスなんかのやつは条件設定で抜けるはず？
##		# 共起グラフ用データセット作成！長かった！
##		# グラフ作成 
library(igraph)
graphdata<-graph.data.frame(kyoukiG, directed = F)
plot(graphdata, vertex.label=V(graphdata)$name)
kyoukiG2 <- kyoukiG[kyoukiG$Span>1,]
kyoukiG2
graphdata2<-graph.data.frame(kyoukiG2, directed = F)
plot(graphdata2, vertex.label=V(graphdata2)$name)