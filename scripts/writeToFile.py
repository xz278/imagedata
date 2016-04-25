#! /bin/python
def writeToFile(inText,outText):
	# inText='text222.txt'
	# outText='test333.txt'
	with open(inText,'r') as file1, open(outText,'w') as file2:
		lines=file1.readlines()
		cnt=0
		width=15
		for line in lines:
			cnt+=1
			fields=line.split()
			if cnt==1:
				maxl=0
				for f in fields:
					if len(f)>maxl:
						maxl=len(f)
				width=maxl+1
			scnt=0
			for f in fields:
				scnt+=1
				if cnt==1 and scnt==1:
					toWrite=''.rjust(width)
				else:
					toWrite=f.rjust(width)
				file2.write(toWrite)
			file2.write('\n')
if __name__ == '__main__':
	import sys
	writeToFile(sys.argv[1],sys.argv[2])