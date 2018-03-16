from __future__ import print_function
import re

infile = 'absolute-beginner-py3.lyx'
outfile = 'absolute-beginner-py3-21c.lyx'

with open(infile) as fh:
    text = fh.read()

text = re.sub('\$ python3', '$ python', text)
text = re.sub('\$ pip3', '$ pip', text)

with open(outfile, 'wb') as fh:
    fh.write(text)

print('[%s] has been created. You must convert it to PDF' % outfile)
print("...after doing so, don't forget to add/commit the file(s)")
