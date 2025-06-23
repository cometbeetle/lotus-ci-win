FROM mcr.microsoft.com/windows/servercore:ltsc2019

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Install Microsoft Visual Studio 2019 Redistributable (used by JAX).
ADD https://aka.ms/vs/17/release/vc_redist.x64.exe vcredist_x64.exe
RUN Start-Process -FilePath C:\vcredist_x64.exe -ArgumentList "/install", "/passive", "/norestart", "'/log a.txt'" -PassThru | Wait-Process

# Install Windows Server Media Foundation.
RUN Install-WindowsFeature Server-Media-Foundation

# Install Git.
ADD https://github.com/git-for-windows/git/releases/download/v2.50.0.windows.1/MinGit-2.50.0-64-bit.zip MinGit.zip
RUN Expand-Archive C:\MinGit.zip -DestinationPath C:\MinGit
RUN cmd /c "setx PATH \"%PATH%;C:\MinGit\cmd\" /M"

# Install uv.
RUN irm https://astral.sh/uv/install.ps1 | iex
RUN cmd /c "setx PATH \"%PATH%;C:\Users\ContainerAdministrator\.local\bin\" /M"

# Install instant client.
ADD https://download.oracle.com/otn_software/nt/instantclient/2380000/instantclient-basic-windows.x64-23.8.0.25.04.zip instantclient-basic-windows.x64-23.8.0.25.04.zip
RUN Expand-Archive C:\instantclient-basic-windows.x64-23.8.0.25.04.zip -DestinationPath C:\InstantClient
RUN cmd /c "setx PATH \"%PATH%;C:\InstantClient\instantclient_23_8\" /M"