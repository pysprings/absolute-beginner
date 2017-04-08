import re

# Regular Expressions
text = "This is some [[sample text]] with SomeWikiWords and other stuff in it. me@example.com"
regex = re.compile(r'\w+@\w+\.com|org|net')

email_addresses = regex.findall(text)

print(email_addresses)