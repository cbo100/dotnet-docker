# dotnet build images

Simply the base `dotnet:<version>` image with a UID/GID of 1000 added

## Building a new SDK image

1. edit `build.ps1` with the `<version>` you want to use
2. run `build.ps1`
3. Use `cbo100\dotnet-build:<version>` in your Jenkinsfile