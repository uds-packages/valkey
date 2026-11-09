# Copyright 2026 Defense Unicorns
# SPDX-License-Identifier: AGPL-3.0-or-later OR LicenseRef-Defense-Unicorns-Commercial

uds {
  bundle_api_version = "uds.dev/v1alpha1"
}

metadata {
  name        = "valkey-test"
  description = "A UDS bundle for deploying standalone and replicated Valkey on a development cluster"
  version     = "dev"
}

package "valkey" {
  source              = "../zarf-package-valkey-${sys.arch}-dev.tar.zst"
  optional_components = ["valkey-redis-uri-output"]
  values_files        = ["values/valkey.yaml"]

  signature_verification {
    verify = false
  }
}

package "valkey-replicated-w-sentinel" {
  source       = "../zarf-package-valkey-${sys.arch}-dev.tar.zst"
  namespace    = "valkey-replicated-w-sentinel"
  depends_on   = [package.valkey]
  values_files = ["values/valkey-replicated-w-sentinel.yaml"]

  signature_verification {
    verify = false
  }
}
