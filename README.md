# lotus-ci-win

A Windows-based Docker image used for the `lotus` GitLab CI pipeline testing phase. 

The image includes:

* [MinGit](https://github.com/git-for-windows/git/releases) (version 2.50.0)
* [Microsoft Visual Studio 2019 Redistributable](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170)
* [uv](https://github.com/astral-sh/uv) (package resolver)
* [Oracle Instant Client](https://www.oracle.com/database/technologies/instant-client/winx64-64-downloads.html) (version 23.8)


*NOTE: OpenCV will not work properly inside Windows containers, as the "Media Foundation" feature is* 
*[required](https://github.com/opencv/opencv-python?tab=readme-ov-file#frequently-asked-questions)*
*and cannot be easily installed inside containers.*

### Image Creation Schedule

* Images will be automatically created every Saturday, at 3:00 AM ET, in order to remain up-to-date with any dependencies.
* Version numbers correspond with the date the image was created.  
