# lotus-ci

A Docker image used for the `lotus` GitLab CI pipeline testing phase. 

The image includes:

* [Python 3.12](https://hub.docker.com/_/python)
* [uv](https://github.com/astral-sh/uv) (package resolver)
* [Graphviz](https://packages.debian.org/bookworm/graphviz) (for building the documentation)
* [Oracle Instant Client](https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html) (version 23.5)
* [libaio1 library](https://packages.debian.org/bookworm/libaio1) (dependency of Instant Client)
* [pandoc](https://packages.debian.org/bookworm/pandoc) (dependency of `nbsphinx`)


### Image Creation Schedule

* Images will be automatically created every Saturday, at 3:00 AM ET, in order to remain up-to-date with any dependencies.
* Version numbers correspond with the date the image was created.  
