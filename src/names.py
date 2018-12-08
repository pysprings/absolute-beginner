# [*] Gather data from website
import requests

def has_doubles(s):
	"""
	Return whether double letters are in s.
	"""
	previous_letter = s[0]
	for letter in s[1:]:
		if letter == previous_letter:
			return True
		previous_letter = letter
	return False

response = requests.get("http://bit.ly/2nrTwyA")
names = response.content.decode('utf-8').splitlines()
# [*] Iterate through data
# [*] Organize names by the letter they start with
alphabetical_names = {}
previous_name = 'zzz'
for name in names:
	if name[0] != previous_name[0]:
		alphabetical_names[name[0]] = [name]
	else:
		alphabetical_names[name[0]].append(name)
	previous_name = name
	
# Reduce set of names based on length
for first_letter, names in alphabetical_names.items():
	filtered_names = []
	for name in names:
		if len(name) < 5 and not has_doubles(name):
			filtered_names.append(name)
	alphabetical_names[first_letter] = filtered_names

print(alphabetical_names)

# [] Reduce list based criteria such as length and repeated letters