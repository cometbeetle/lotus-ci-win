FROM python:3.12-windowsservercore-1809

# Install git.
RUN Invoke-WebRequest 'https://github.com/git-for-windows/git/releases/download/v2.50.0.windows.1/MinGit-2.50.0-64-bit.zip' -OutFile MinGit.zip
RUN Expand-Archive C:\MinGit.zip -DestinationPath C:\MinGit
RUN $env:PATH = $env:PATH + ';C:\MinGit\cmd\;C:\MinGit\cmd'
RUN Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH

# Install uv.
RUN pip install uv

# Install instant client.
RUN Invoke-WebRequest 'https://download.oracle.com/otn_software/nt/instantclient/2380000/instantclient-basic-windows.x64-23.8.0.25.04.zip'
RUN Expand-Archive C:\instantclient-basic-windows.x64-23.8.0.25.04.zip -DestinationPath C:\InstantClient
RUN $env:PATH = $env:PATH + ';C:\InstantClient\;C:\InstantClient'
