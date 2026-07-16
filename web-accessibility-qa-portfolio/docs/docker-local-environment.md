# Local OpenCart Environment with Docker

## Purpose

This project uses a local Docker environment to run OpenCart for test automation.

The public OpenCart demo website can be unstable for automated tests because it may be affected by external factors such as Cloudflare protection, network availability, or demo environment changes.

Running OpenCart locally provides a more stable and controlled test environment.

## Services

The Docker Compose setup includes:

- `opencart-db`: MySQL database used by OpenCart
- `opencart-app`: OpenCart application exposed on localhost

## Local URLs

- Storefront: http://localhost:8888/
- Admin panel: http://localhost:8888/admin/

## Custom OpenCart Image

The project builds a custom OpenCart image instead of using the third-party image directly.

The image is based on the following pinned digest:

`ghcr.io/aam-git/docker-opencart@sha256:057094bfa4ea63a2270c18d08b8ba54e504a08c7758a07be369f745f2bc4d57f`

Pinning the image by digest guarantees that the same OpenCart version is used every time the environment is rebuilt.

During the build, the following patch is automatically applied:

`docker/opencart/patches/opencart-4.1.0.3-wishlist-token.patch`

The patch fixes an OpenCart 4.1.0.3 issue where the wishlist AJAX refresh does not preserve the authenticated `customer_token`, causing the user session to become invalid.

Keeping the patch inside the repository makes the environment:

- reproducible;
- version-controlled;
- independent from manual modifications inside Docker containers or volumes.

## Start the environment

```bash
docker compose up -d
```

## Stop the environment

```bash
docker compose down
```

## Reset the environment

Use this command only when a clean installation is needed:

```bash
docker compose down -v
docker compose up -d
```

The `-v` option removes the Docker volumes for this project, including OpenCart files and database data.

## Notes

The database password must be at least 8 characters long because the OpenCart Docker image validates password security requirements during startup.