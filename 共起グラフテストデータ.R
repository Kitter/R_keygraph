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
#ループ準備
word_m <- 0
##	for 1からlength(top_text_freq)までループ
n <- 1
word_n <- as.data.frame(collocate("merosu.txt",node=top_text_freq[n],span=5)[c(T,F,F,T,F)])
top_text_freq[n]
word_n
###擬似ループ
m <- 1
word_meros <- word_n[word_n$Term==top_text_freq[m],]
word_meros
top_text_freq[m]
word_m <- rbind(word_m,word_meros)
word_m
m <- 2
word_meros <- word_n[word_n$Term==top_text_freq[m],]
word_meros
top_text_freq[m]
word_m <- rbind(word_m,word_meros)
word_m
m <- 20
word_meros <- word_n[word_n$Term==top_text_freq[m],]
word_meros
top_text_freq[m]
word_m <- rbind(word_m,word_meros)
word_m
###########################以下アレ。#######################
n <- 0
for (n in 1:length(top_text_freq)) {
	word_n <- as.data.frame(collocate("merosu.txt",node=top_text_freq[n],span=5)[c(T,F,F,T,F)])
##		word_n <- as.data.frame(collocate("merosu.txt",node="top_text_freq[n]",span=5)[c(T,F,F,T,F)])
##		# word_nはテキスト全部とある単語の共起度一覧。スパン5は変わらず。どうにかしないと。ココ。
	m <- 0
	for (m in 1:length(top_text_freq)) {
##		for 1からlength(top_text_freq)
		word_meros <- word_n[word_n$Term==top_text_freq[m],]
##			word_meros <- word_n[word_n$Term=="top_text_freq[m]",]
		word_m <- rbind(word_meros)
		##ココが共起度0の時なんか変な感じ！！！！
##			word_merosをrbind関数でつなげる。全部！ぐるぐる共起度抽出回し祭りｷﾀ━(ﾟ∀ﾟ)━!
	}
##			ループここまで
	word_meros$Term0<-top_text_freq[n]
	word_meros <- word_meros[,c(3,1,2)]
##	# グラフで描写出来るようにデータを整理。
	kyoukiG <- rbind(word_meros)
##		kyoukiG <- rbindでword_merosをまた結合祭り。
}
kyoukiG
##		ループおしまい。
##
##		これで、ここまで自動化出来たはず。
##		kyoukiG <- kyoukiGを半分にする必要あり・・・？あれ、メロスはメロスもあってメロスとセリヌンティウスとセリヌンティウスとメロスもあるんだから・・・？でも共起度が往復するだけだから大丈夫？うーん、igraphでテストデータ作ってみないことにはわからないかも。ダメだったら修正どうにか書ける必要がある。メロスとメロスなんかのやつは条件設定で抜けるはず？
##		# 共起グラフ用データセット作成！長かった！
##		# グラフ作成 
##		library(igraph)
##		graphdata<-graph.data.frame(kyoukiG, directed = F)
##		plot(graphdata, vertex.label=V(graphdata)$name)
##		kyoukiG2 <- kyoukiG[kyoukiG$Span>1,]
##		kyoukiG2
##		graphdata2<-graph.data.frame(kyoukiG2, directed = F)
##		plot(graphdata2, vertex.label=V(graphdata2)$name)

# word_merosu <- as.data.frame(collocate("merosu.txt",node="メロス",span=5)[c(T,F,F,T,F)])
# メロスって単語で、走れメロス全体の単語との共起度を抽出。
# word_meros <- word_merosu[word_merosu$Term=="村"|word_merosu$Term=="死ぬ"|word_merosu$Term=="信じる"|word_merosu$Term=="殴る"|word_merosu$Term=="市"|word_merosu$Term=="いい"|word_merosu$Term=="出来る"|word_merosu$Term=="妹"|word_merosu$Term=="男"|word_merosu$Term=="言う"|word_merosu$Term=="セリヌンティウス"|word_merosu$Term=="殺す"|word_merosu$Term=="王"|word_merosu$Term=="友"|word_merosu$Term=="人"|word_merosu$Term=="走る"|word_merosu$Term=="無い"|word_merosu$Term=="なる"|word_merosu$Term=="する"|word_merosu$Term=="メロス",]
# その全部からトップ20のみのあれを抽出
# word<-"メロス"
# word_meros$Term0<-word
# word_meros <- word_meros[,c(3,1,2)]
# 共起度フォーマットに変換
# rbind関数でデータフレームをどんどんムカデみたいにつなげる・・・ムカデ男ってCV:若本だっけ？