# --Input data--
f = open("name_age.txt")

data = []
for line in f:
	name, age = line.split()
	data.append({'name':name, 'age': int(age)})
	
print(data)

# --Turn into list of dictionaries--
# Maximum:
max_age = 0
for row in data:
	if row['age'] > max_age:
		max_name = row['name']
		max_age = row['age']
		
print("Maximum age of", max_name, "is", max_age)
max_age, max_name = max((row['age'], row['name']) for row in data)
print("The maximum age is ", max_name, "for", max_age)

# Get summary statistics like min, max, median mean.