# -*- encoding: utf-8 -*-
import sys
import re
import codecs
import unicodedata


year = re.compile("[0-9]{4}")
alias = re.compile(ur"_\(.*?\)")
alldigit = re.compile(ur"^[0-9]+$")
ng = [chr(i) for i in range(0,32)] 

def isValid(word):
	if len(word) == 1:
		return False
	if re.search(year, word):
		return False
        if alias.search(word):
                return False
        if alldigit.search(word):
                return False
	for ng_ch in ng:
                if ng_ch in word:
                        return False
	if len(word) == 2 and unicodedata.name(word[0])[0:8] == "HIRAGANA" and unicodedata.name(word[1])[0:8] == "HIRAGANA":
		return False
	for c in word:
        	if not (unicodedata.name(c)[0:8] == "HIRAGANA" or
                	unicodedata.name(c)[0:8] == "KATAKANA" or
                	unicodedata.name(c)[0:3] == "CJK" or
                	unicodedata.name(c)[0:5] == "DIGIT" or
                	unicodedata.name(c)[0:5] == "LATIN"):
			return False
	return True

if __name__ == "__main__":
	argvs = sys.argv
	argc = len(argvs)
	if (argc != 3):
		print 'Usage: # python %s Input_FileName Output_FileName' % argvs[0]
		quit()

	fin_name = argvs[1]
	fout_name = argvs[2]

	fin = codecs.open(fin_name, "r", "utf-8")
	fout = codecs.open(fout_name, "w", "utf-8")
	for line in fin:
		word = line[:-1].split('\t')[1]
		# word = line.rstrip() 
		if isValid(word):
			word = word.lower()
			cost = int(max(-32768,(6000-200*len(word)**1.3)))
			fout.write("%s,-1,-1,%d,名詞,一般,*,*,*,*,*,*,*,%s\n" % (word, cost, "hatena_keyword"))
			# fout.write("%s,-1,-1,%d,名詞,一般,*,*,*,*,*,*,*,%s\n" % (word, cost, "Wikipedia"))
	fin.close()
	fout.close()