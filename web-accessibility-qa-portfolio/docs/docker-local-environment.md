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