FROM jarzamendia/hugo-builder:0.88.1 as builder

COPY . .

RUN hugo;

FROM jarzamendia/caddy:1.0.4

COPY --from=builder /src/public /srv