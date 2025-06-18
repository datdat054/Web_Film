# ------- BUILDER ---------
FROM node:23-alpine AS basenode

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# ------- BUILDER ---------

# -------- BACKEND RUNNER ----------

FROM node:23-alpine

WORKDIR /app 

COPY --from=basenode /app/. .

EXPOSE 3001

CMD ["node", "server.js"]
