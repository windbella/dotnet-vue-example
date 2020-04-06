FROM node:12.16.1-alpine AS node

RUN mkdir -p /app
ADD . /app

WORKDIR /app/client
RUN yarn install
RUN yarn build

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine AS build

COPY --from=node /app/server /app/server
WORKDIR /app/server
RUN dotnet build ./server.csproj -c Release
RUN dotnet publish ./server.csproj -c Release -o ./publish

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine

COPY --from=build /app/server/publish /app/server
WORKDIR /app/server

EXPOSE 5000

CMD dotnet ./server.dll