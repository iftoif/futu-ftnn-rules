# Changelog

All notable changes to this project are documented in this file.

## v1.2.0 - 2026-11-08

- Add Clash / mihomo classical rule lists generated from the modules: `rules/ftnn.list`, `rules/claude-anthropic.list`, `rules/coding.list`, `rules/social-media.list` (FTNN deduplicated: 96 → 81 entries; per-line policy names preserved).
- Add `rules/clash-template.yaml` — full Clash/mihomo config template with rule-providers (jsDelivr CDN) and PROXY/US policy groups; FTNN's 5 DIRECT IP entries inlined because classical rule-providers ignore per-line policies.
- Omit 2 `IP-ASN` rules from `coding.list` (runtime ASN database dependency; domain rules cover the services).
- Requires mihomo ≥ v1.19.23 for vless xhttp nodes.

## v1.1.1 - 2026-06-15

- Add explicit Claude/Anthropic network domains to `modules/coding.module`.
- Add Claude Code update, changelog, telemetry, and support-related hosts.

## v1.1.0 - 2026-06-14

- Add local Shadowrocket module `coding`.
- Add local Shadowrocket module `社交媒体`.
- Add local Shadowrocket default configuration `default.conf`.
- Publish every module and rule file as a separate URL.

## v1.0.0 - 2026-06-14

- Initial release of Futu FTNN Rules.
- Add Shadowrocket Module file.
- Add validation workflow.
- Add release workflow with checksums.
- Add GitHub Pages documentation.
