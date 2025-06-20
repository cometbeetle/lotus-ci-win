# lotus-ci-win

A Windows-based Docker image used for the `lotus` GitLab CI pipeline testing phase. 

The image includes:

* [Python 3.12](https://hub.docker.com/_/python)
* [uv](https://github.com/astral-sh/uv) (package resolver)
* [Oracle Instant Client](https://www.oracle.com/database/technologies/instant-client/winx64-64-downloads.html) (version 23.8)


### Image Creation Schedule

* Images will be automatically created every Saturday, at 3:00 AM ET, in order to remain up-to-date with any dependencies.
* Version numbers correspond with the date the image was created.  
