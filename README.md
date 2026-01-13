# Week 4 - Docker Compose (Multi-Service Stack)

## Overview
This project demonstrates Docker Compose by running a small multi-service system consisting of an application container and a PostgreSQL database.

The focus is on real-world container orchestration concepts:
- Service networking via DNS
- Startup vs Readiness
- Persistent storage with volumes
- Externalised configuration using environment files

## Services

### app
- Runs a simple Bash script
- Receives configuration via environment variables
- Depends on the database being healthy before starting

### db
- PostgreSQL database
- Uses a named volume for data persistence
- Exposes a healthcheck to signal readiness

## Key Concepts Demonstrated
- **Docker Compose** for multi-container orchestration
- **Service discovery** using service names as DNS hostnames
- **Startup vs readiness** using healthchecks
- **Volumes** for persistent database storage
- **.env files** to separate configuration from code

## Requirements
- Docker Desktop (Linux containers)

## Usage

Start the stack:
```bash
docker compose up
```
Stop the stack:
```bash
docker compose down
```
Reset database data:
```bash
docker compose down -v
docker compose up
```

## Configuration
Configuration is stored in a .env file:
```env
POSTGRES_USER=exampleuser
POSTGRES_PASSWORD=examplepass
POSTGRES_DB=exampledb
DB_HOST=db
```

## What This Maps To In Production
- Docker Compose services -> Kubernetes Deployments
- Service names -> Kubernetes Services (DNS)
- Healthchecks -> readiness probes
- Volumes -> persistent volumes

## CI/CD Pipeline
This repository uses **GitHub Actions** to run Continuous Integration on every push and pull request.

### Pipeline Stages

1. **Lint / Validation**
- Validates the Docker Compose configuration using `docker compose config`
- Fails fast on YAML or schema errors

2. **Build**
- Builds the Docker image using `docker build`
- Runs only if validation succeeds

### Why This Matters
- Prevents broken configuration from being merged
- Ensures Docker images are reproducible
- Mirrors real-world CI pipelines used in production teams

### Trigger
The pipeline runs automatically on:
- Pushes to `main`
- Pull requests

## Improvements
- Replace Bash app with a real web service
- Add port mapping for external access

## Author
**Timothy Lowe**
Aspiring DevOps / Cloud Engineer
