#! /bin/python
def extractTurker(inputFile,outputFile):
	with open(inputFile,'r') as fIn, open(outputFile,'w') as fOut:
		lines=fIn.readlines()
		for line in lines:
			# print line
			l=line.split() # get rid of end of line indicator
			fields=l[0].split(',') # split each with ','
			if fields[0][0]=='#':
				print line
				continue
			acc=float(fields[-1]) # accuarcy for each turker
			if acc<0.6:
				break
			fOut.write(fields[0])
			fOut.write(',')
			# print fields[0],fields[1]
		fOut.write('\n')

if __name__ == '__main__':
	import sys
	extractTurker(sys.argv[1],sys.argv[2])