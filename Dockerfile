FROM debian:bookworm
ARG DOTNET_ARCHIVE_X64=https://download.visualstudio.microsoft.com/download/pr/990ff1f7-b5df-4a80-a65e-7cff3a1a263c/f1a2f3cab0d1787618f7d8043e3a6827/dotnet-runtime-7.0.20-win-x64.zip
ARG DOTNET_ARCHIVE_X86=https://download.visualstudio.microsoft.com/download/pr/f479b75e-9ecb-42ea-8371-c94f411eda8d/0cd700d75f1d04e9108bc4213f8a41ec/dotnet-runtime-7.0.20-win-x86.zip
RUN dpkg --add-architecture i386 && apt-get update && apt-get -y upgrade && \
    apt-get install -y ca-certificates jq curl wget unzip zip python3-pip \
      wine cabextract wine32:i386 && \
    wget -O /usr/bin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && \
    chmod 0755 /usr/bin/winetricks && \
    rm -rf /var/lib/apt/lists/* && \
    wget -O /tmp/dotnetx64.zip "$DOTNET_ARCHIVE_X64"  && \
    wget -O /tmp/dotnetx86.zip "$DOTNET_ARCHIVE_X86"  && \
    mkdir -p /dotnet/win64 && \
    mkdir -p /dotnet/win32 && \
    unzip -d /dotnet/win64 /tmp/dotnetx64.zip && \
    unzip -d /dotnet/win32 /tmp/dotnetx86.zip && \
    rm /tmp/dotnetx64.zip /tmp/dotnetx86.zip
