#!/bin/pythons
def filterlabel(inputFile,originLabels):
	"inputFile is the turker reply accuarcy file; originLabels is the sorted labels file"
	trusted=[]
	with open(inputFile,'r') as fIn:
		lines=fIn.read().splitlines()
		for line in lines:
			fields=line.split(',') # split each with ','
			# if fields[0][0]=='#':
			# 	print line
			# 	continue
			acc=float(fields[-1]) # accuarcy for each turker
			if acc<0.6:
				break
			trusted.append(fields[0])

	from ImageFilterClass import FoodImage

	with open(originLabels,'r') as oriLabels, open('new_label.csv','w') as nLabel:
		lines=oriLabels.read().splitlines()
		curImg=None
		for line in lines:
			# print line
			fs=line.split(',')
			if fs[1] not in trusted: continue
			if curImg==None or curImg.name!=fs[0]: 
				if curImg is not None:
					ls=curImg.getMostCommonLabel()
					for lb in ls:
						nLabel.write(curImg.name)
						nLabel.write(',')
						nLabel.write(lb)
						nLabel.write('\n')
				curImg=FoodImage(fs[0])
			lbs=fs[2].split()
			for w in lbs:
				if not w.isalpha(): continue
				if len(w)<2: continue
				# print w.lower()
				curImg.addLabel(w.lower())
		ls=curImg.getMostCommonLabel()
		for lb in ls:
			nLabel.write(curImg.name)
			nLabel.write(',')
			nLabel.write(lb)
			nLabel.write('\n')








if __name__ == '__main__':
	import sys
	filterlabel(sys.argv[1],sys.argv[2])