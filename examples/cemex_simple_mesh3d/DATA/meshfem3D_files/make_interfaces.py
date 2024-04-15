#Create The Interfaces files
#the Model is build from bottom up
#the interface is the top of the volume
nx = 72 #96
ny = 72 #96

layers = {"interface1.dat":-3, "interface2.dat":0}
for k in layers:
	with open(k,"w") as fd:
		elv = layers[k]
		for x in range(nx):
			for y in range(ny):
				fd.write("%0.1f\n" %(elv))
