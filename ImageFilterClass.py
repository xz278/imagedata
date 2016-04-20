#!/bin/python
# classes used to filter image
class FoodImage:
	"""A object of this class stores all its labels and returns the most frequent one"""
	def __init__(self, name):
		self.name = name
		self.labels={};

	def addLabel(self,label):
		if label in self.labels:
			self.labels[label]+=1
		else:
			self.labels[label]=1

	def getMostCommonLabel(self):
		max=0
		for k,v in self.labels.items():
			if v>max: max=v
		ls=[]
		for k,v in self.labels.items():
			if v==max: ls.append(k)
		return ls

