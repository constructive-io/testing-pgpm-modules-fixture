# pgpm modules

PostgreSQL modules using the `pgpm` workflow for safe, testable, reversible SQL changes.

## Overview

**pgpm** is a modern CLI for modular PostgreSQL development—a focused command-line tool for PostgreSQL database migrations and package management. It provides the core functionality for managing database schemas, migrations, and module dependencies.

This repository contains a curated collection of PostgreSQL modules built using the `pgpm` workflow. Each module follows the Sqitch-inspired deploy/verify/revert pattern, extending it to a multi-package npm workspace where SQL changes are organized as triplets, enabling safe database migrations with proper rollback capabilities.

### Key Features

- 📦 **Postgres Module System** — Reusable, composable database packages with dependency management, per-module plans, and versioned releases
- 🔄 **Deterministic Migration Engine** — Version-controlled, plan-driven deployments with rollback support and idempotent execution enforced by dependency and validation safeguards
- 📊 **Recursive Module Resolution** — Recursively resolves database package dependencies (just like npm) from plan files or SQL headers, producing a reproducible cross-module migration graph
- 🏷️ **Tag-Aware Versioning** — Deploy to @tags, resolve tags to changes, and reference tags across modules for coordinated releases
- 🐘 **Portable Postgres Development** — Rely on standard SQL migrations for a workflow that runs anywhere Postgres does

## Installation

```bash
# Install dependencies
pnpm install

# Install pgpm CLI globally
npm install -g pgpm
```

## Package Structure

### Data Types
- `@pgpm/types` - Core PostgreSQL data types
- `@pgpm/uuid` - UUID utilities and extensions
- `@pgpm/stamps` - Timestamp utilities and audit trails
- `@pgpm/geotypes` - Geographic data types and spatial functions

### Jobs & Background Processing
- `@pgpm/jobs` - Core job system for background tasks
- `@pgpm/database-jobs` - Database-specific job handling

### Meta & Database Introspection
- `@pgpm/db_meta` - Database metadata utilities
- `@pgpm/db_meta_modules` - Module metadata handling
- `@pgpm/db_meta_test` - Testing utilities for metadata

### Security & Authentication
- `@pgpm/default-roles` - Default PostgreSQL role definitions
- `@pgpm/defaults` - Security defaults and configurations
- `@pgpm/jwt-claims` - JWT claim handling and validation
- `@pgpm/totp` - Time-based One-Time Password authentication
- `@pgpm/encrypted-secrets` - Encrypted secrets management
- `@pgpm/encrypted-secrets-table` - Table-based encrypted secrets

### Utilities
- `@pgpm/utils` - General utility functions
- `@pgpm/verify` - Verification utilities (used by other modules)
- `@pgpm/inflection` - String inflection utilities
- `@pgpm/base32` - Base32 encoding/decoding
- `@pgpm/faker` - Fake data generation for testing

### Metrics & Analytics
- `@pgpm/measurements` - Performance tracking and analytics
- `@pgpm/achievements` - Achievement system for user progress

## pgpm Workflow

Each package follows the deploy/verify/revert pattern:

- **Deploy**: `deploy/**/*.sql` - Applies database changes
- **Verify**: `verify/**/*.sql` - Proves changes work correctly
- **Revert**: `revert/**/*.sql` - Safely removes changes

### Basic Commands

```bash
# Deploy changes
pgpm deploy

# Verify deployment
pgpm verify

# Revert changes
pgpm revert

# Package a module
pgpm package
```

## Development

```bash
# Install dependencies
pnpm install

# Build all packages
pnpm -r build

# Test all packages
pnpm -r test

# Clean build artifacts
pnpm -r clean

# Lint code
pnpm eslint .
```

## Publishing

```bash
# Publish to npm
pnpm lerna publish
```

## Dependencies

Packages use workspace protocol for internal dependencies:
```json
{
  "dependencies": {
    "@pgpm/verify": "workspace:*"
  }
}
```

For more details on the pgpm workflow, see [AGENTS.md](./AGENTS.md).
