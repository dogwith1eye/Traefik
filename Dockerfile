FROM      traefik:v1.7.9-alpine
COPY      traefik.toml /etc/traefik/traefik.toml
ENTRYPOINT ["/traefik"]