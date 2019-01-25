# Plug in the name of the sdk base image you want to use and run this script
$BASE_IMG = "2.2.100-sdk-stretch"
docker build -t dotnet:${BASE_IMG} --build-arg DOTNET_VERSION=${BASE_IMG} .
docker tag dotnet:${BASE_IMG} cbo100/dotnet-build:${BASE_IMG}
docker push cbo100/dotnet-build:${BASE_IMG}
