FROM mcr.microsoft.com/windows/nanoserver:ltsc2019

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Install git.
RUN Invoke-WebRequest 'https://github.com/git-for-windows/git/releases/download/v2.50.0.windows.1/MinGit-2.50.0-64-bit.zip' -OutFile MinGit.zip
RUN Expand-Archive C:\MinGit.zip -DestinationPath C:\MinGit
RUN cmd /c "setx PATH \"%PATH%;C:\MinGit\cmd\" /M"

# Install uv.
RUN irm https://astral.sh/uv/install.ps1 | iex
RUN cmd /c "setx PATH \"%PATH%;C:\Users\ContainerAdministrator\.local\bin\" /M"

# Install instant client.
RUN Invoke-WebRequest 'https://download.oracle.com/otn_software/nt/instantclient/2380000/instantclient-basic-windows.x64-23.8.0.25.04.zip' -OutFile instantclient-basic-windows.x64-23.8.0.25.04.zip
RUN Expand-Archive C:\instantclient-basic-windows.x64-23.8.0.25.04.zip -DestinationPath C:\InstantClient
RUN cmd /c "setx PATH \"%PATH%;C:\InstantClient\" /M"