# Omnichannel Customer Experience Platform

An AI-powered system that unifies customer interactions across multiple communication channels (voice, WhatsApp, email, web chat, social platforms).

## Architecture

This is a TypeScript monorepo using npm workspaces with a microservices architecture:

- **packages/core-types**: Shared TypeScript interfaces and enums
- **packages/kafka-utils**: Kafka connection utilities
- **services/**: Individual microservices (to be implemented)

## Prerequisites

- Node.js >= 18.0.0
- npm >= 9.0.0
- Docker and Docker Compose (for local development)
- Kubernetes (for production deployment)

## Getting Started

### Install Dependencies

```bash
npm install
```

### Run Tests

```bash
# Run all tests
npm test

# Run unit tests only
npm run test:unit

# Run property-based tests only
npm run test:property
```

### Linting and Formatting

```bash
# Lint code
npm run lint

# Format code
npm run format

# Check formatting
npm run format:check
```

### Build

```bash
npm run build
```

### Local Development with Docker

Start the infrastructure services (Kafka, PostgreSQL, MongoDB, Redis):

```bash
docker-compose up -d
```

Stop services:

```bash
docker-compose down
```

## Project Structure

```
.
├── packages/
│   ├── core-types/       # Shared TypeScript types
│   └── kafka-utils/      # Kafka utilities
├── services/             # Microservices (to be implemented)
├── k8s/                  # Kubernetes configurations
├── docker-compose.yml    # Local development infrastructure
├── Dockerfile            # Container image definition
└── package.json          # Root package configuration
```

## Technology Stack

- **Language**: TypeScript
- **Message Queue**: Apache Kafka
- **Databases**: PostgreSQL, MongoDB
- **Cache**: Redis
- **Testing**: Jest (unit tests), fast-check (property-based tests)
- **Container Orchestration**: Kubernetes

## Testing Strategy

The platform uses a dual testing approach:

1. **Unit Tests**: Test specific examples and edge cases
2. **Property-Based Tests**: Verify universal properties across all inputs (minimum 100 iterations)

## License

Proprietary
