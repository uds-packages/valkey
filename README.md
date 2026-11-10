# UDS Valkey Package

[![Latest Release](https://img.shields.io/github/v/release/uds-packages/valkey)](https://github.com/uds-packages/valkey/releases)
[![Build Status](https://img.shields.io/github/actions/workflow/status/uds-packages/valkey/release.yaml)](https://github.com/uds-packages/valkey/actions/workflows/release.yaml)

> [!TIP]  
> `uds-package-valkey` is intended to be a single-tenant application for one consumer (i.e. [`uds-package-gitlab`](https://github.com/uds-packages/gitlab)).  If you have more than one consumer, deploy a second Valkey instance using `namespace` overrides in your UDS bundle.

This package is designed for use as part of a [UDS Bundle](https://docs.defenseunicorns.com/core/concepts/configuration--packaging/bundles/) deployed on [UDS Core](https://github.com/defenseunicorns/uds-core).

> Valkey is a high-performance, in-memory data store that offers a flexible and scalable solution for caching, message queuing, and primary database needs. It supports a wide range of data structures and can be deployed as a standalone daemon or in a cluster for high availability.

## Prerequisites

This package requires a Kubernetes Cluster providing a Storage Class that has [UDS Core](https://github.com/defenseunicorns/uds-core) installed into it. You can learn more about configuring this package in the [configuration documentation](./docs/configuration.md)

## Releases

The released packages can be found in [ghcr](https://github.com/uds-packages/valkey/pkgs/container/valkey).

### Verify a Package

Packages are signed using [Zarf's Keyless Signing](https://docs.zarf.dev/ref/package-signing/#using-keyless-signing).

Packages are signed from the following versions onwards:

| Flavor | First Signed Version |
| --- | --- |
| `upstream` | `8.1.3-uds.8` |
| `unicorn` | `8.1.11-uds.2` |

To verify a package, follow the below example:

```bash
uds zarf package verify "oci://ghcr.io/uds-packages/valkey:8.1.3-uds.8-upstream" \
  --certificate-identity "https://github.com/uds-packages/valkey/.github/workflows/release.yaml@refs/heads/main" \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com"
```

For a `unicorn` package, use `oci://ghcr.io/uds-packages/private/valkey:<VERSION>-unicorn`
as the package source.

## UDS Tasks (for local dev and CI)

*For local dev, this requires installing [uds-cli](https://github.com/defenseunicorns/uds-cli?tab=readme-ov-file#install)

After installing uds-cli, for a list of available tasks that can be run in this repository execute the following command:

`uds run --list`

## Contributing

Please see the [CONTRIBUTING.md](./CONTRIBUTING.md)

## Development

When developing this package it is ideal to utilize the json schemas for UDS Bundles, Zarf Packages and Maru Tasks. This involves configuring your IDE to provide schema validation for the respective files used by each application. For guidance on how to set up this schema validation, please refer to the [guide](https://github.com/defenseunicorns/uds-common/blob/main/docs/uds-packages/development/development-ide-configuration.md) in uds-common.
