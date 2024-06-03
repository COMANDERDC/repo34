# Używamy oficjalnego obrazu Node.js jako bazowego
FROM node:14-alpine

# Ustawienie katalogu roboczego w kontenerze
WORKDIR /app

# Kopiowanie pliku package.json i package-lock.json
COPY package*.json ./

# Instalowanie zależności
RUN npm install -g npm@latest

# Aktualizacja systemu i instalacja najnowszej wersji OpenSSL
RUN apk update && apk upgrade && apk add openssl

# Kopiowanie reszty plików aplikacji
COPY . .

# Eksponowanie portu, na którym działa aplikacja (przykład: 3000)
EXPOSE 3000

# Domyślna komenda do uruchomienia aplikacji
CMD ["node", "app.js"]
