FROM debian:bookworm
ARG DOTNET_ARCHIVE=https://download.visualstudio.microsoft.com/download/pr/90d85e37-2f7a-43d8-a060-ee9bfa2935d9/30bbf49e665484d29bef4763ceb786db/dotnet-runtime-7.0.17-win-x64.zip
RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y ca-certificates jq curl wget unzip zip python3-pip \
      wine && \
    wget -O /usr/bin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && \
    chmod 0755 /usr/bin/winetricks && \
    rm -rf /var/lib/apt/lists/* && \
    wget -O /tmp/dotnet.zip "$DOTNET_ARCHIVE"  && \
    mkdir /dotnet && \
    unzip -d /dotnet /tmp/dotnet.zip && \
    rm /tmp/dotnet.zip && \
    wine /dotnet/dotnet.exe --info
