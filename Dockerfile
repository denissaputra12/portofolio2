FROM oven/bun:1 AS app
WORKDIR /app

COPY index.html /usr/share/nginx/html/
COPY denisdenisan.jpeg /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf
RUN bun install --no-cache --registry=https://registry.npmjs.org

COPY . .

RUN bun run build

CMD ["bun", "start"]