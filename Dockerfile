FROM oven/bun:1 AS app
WORKDIR /app

COPY package.json bun.lock ./
RUN bun install --no-cache --registry=https://registry.npmjs.org

COPY . .

RUN bun run build

CMD ["bun", "start"]