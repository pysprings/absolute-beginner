# absolute-beginner
This is the class that PySprings teaches in the Pikes Peak Library District in
Colorado Springs.

# Students
Please download the PDF appropriate for the class you are attending.  If you
are unsure, please ask your instructor.

# Building PDF
There are a couple of options, depending on where and how the class will be
taught.

The *master* document is `absolute-beginner-py3.lyx`.  All changes should be
made there.  The other documents are built from that one.

The master document contains nix-like instructions, e.g. `c9.io`.

## 21C - Windows
The Python version that's installed on the 21C computers does not provide
`python3.exe`.  It only provides `python.exe`, so the slides should change
where appropriate.

Running the build script should convert the master `lyx` document in the
following way:

1.  All mentions of `python3` should be changed to `python`
1.  `virtualenv` is not supported and should be mentioned as such (or perhaps
    the section should be taken out?)
1.  `pip3` is not supported.  It's called `pip`, however, 21C doesn't allow us
    to install those packages

NOTE: `make_21c_windows.py` only handles `python3` and `pip3`.
