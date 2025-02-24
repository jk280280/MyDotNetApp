# Use the official image as a parent image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80

# Use the SDK image to build the app
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY ["MyDotNetApp/MyDotNetApp.csproj", "MyDotNetApp/"]
RUN dotnet restore "MyDotNetApp/MyDotNetApp.csproj"
COPY . .
WORKDIR "/src/MyDotNetApp"
RUN dotnet build "MyDotNetApp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MyDotNetApp.csproj" -c Release -o /app/publish

# Copy the build app to the base image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MyDotNetApp.dll"]
