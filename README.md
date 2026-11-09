# Shadowrocket Rules

[![Latest Version](https://img.shields.io/github/v/release/iftoif/futu-ftnn-rules?label=latest)](https://github.com/iftoif/futu-ftnn-rules/releases/latest)
[![GitHub Release](https://img.shields.io/github/actions/workflow/status/iftoif/futu-ftnn-rules/release.yml?label=release)](https://github.com/iftoif/futu-ftnn-rules/actions/workflows/release.yml)
[![Downloads](https://img.shields.io/github/downloads/iftoif/futu-ftnn-rules/total?label=downloads)](https://github.com/iftoif/futu-ftnn-rules/releases)

公开分发本地 Shadowrocket 的 3 个独立模块和 1 个默认配置文件。

## 适用于

- Shadowrocket
- Surge
- Stash
- Loon
- Quantumult X
- Clash / mihomo(官方 Clash Apple 版、Clash Party、Clash Verge Rev 等,经 `rules/*.list` + 模板)

## 独立订阅地址

### 模块 1: Futu FTNN Rules

GitHub Raw:

```text
https://raw.githubusercontent.com/iftoif/futu-ftnn-rules/main/modules/FTNN.module
```

jsDelivr CDN:

```text
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/modules/FTNN.module
```

GitHub Pages:

```text
https://iftoif.github.io/futu-ftnn-rules/modules/FTNN.module
```

### 模块 2: coding

GitHub Raw:

```text
https://raw.githubusercontent.com/iftoif/futu-ftnn-rules/main/modules/coding.module
```

jsDelivr CDN:

```text
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/modules/coding.module
```

GitHub Pages:

```text
https://iftoif.github.io/futu-ftnn-rules/modules/coding.module
```

### 模块 3: 社交媒体

GitHub Raw:

```text
https://raw.githubusercontent.com/iftoif/futu-ftnn-rules/main/modules/social-media.module
```

jsDelivr CDN:

```text
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/modules/social-media.module
```

GitHub Pages:

```text
https://iftoif.github.io/futu-ftnn-rules/modules/social-media.module
```

### 默认配置: default.conf

GitHub Raw:

```text
https://raw.githubusercontent.com/iftoif/futu-ftnn-rules/main/rules/default.conf
```

jsDelivr CDN:

```text
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/rules/default.conf
```

GitHub Pages:

```text
https://iftoif.github.io/futu-ftnn-rules/rules/default.conf
```

## Shadowrocket 导入方式

模块:

```text
Shadowrocket
-> 配置
-> 模块
-> 右上角 +
-> 从 URL 下载
-> 粘贴对应模块订阅地址
-> 保存
-> 启用对应模块
```

默认配置:

```text
Shadowrocket
-> 配置
-> 右上角 +
-> 从 URL 下载
-> 粘贴 default.conf 订阅地址
-> 保存
-> 设为默认配置
```

## Clash / mihomo

规则以 classical text 规则集(`rules/*.list`)分发,规则行内自带策略名(`PROXY` / `US` / `DIRECT`);vless xhttp 节点需 mihomo 内核 ≥ v1.19.23(推荐 ≥ v1.19.33)。

两点已知差异(有意为之):

1. **classical 规则集会忽略行内策略名**,以 `RULE-SET` 行声明的目标为准——所以模板已把 FTNN 模块的 5 条 DIRECT IP 段以内联规则补回,provider 使用方的行为与模块一致。
2. coding 模块中的 2 条 `IP-ASN` 规则未收入 `.list`(mihomo 需运行时下载 ASN 数据库,避免移动端国内网络首跑失败;相关服务均有域名规则覆盖)。

```text
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/rules/ftnn.list
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/rules/claude-anthropic.list
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/rules/coding.list
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/rules/social-media.list
```

完整配置模板(含 rule-providers / 策略组引用示例,填入自己的节点即可用):

```text
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/rules/clash-template.yaml
```

## 版本管理

使用 Semantic Versioning:

- `v1.0.0`: 首个稳定版本
- `v1.0.1`: 规则修复
- `v1.1.0`: 新增独立模块或默认配置

## 创建仓库步骤

```bash
git clone https://github.com/iftoif/futu-ftnn-rules.git
cd futu-ftnn-rules
```

如果还没有远程仓库:

```bash
mkdir futu-ftnn-rules
cd futu-ftnn-rules
git init
git branch -M main
git remote add origin https://github.com/iftoif/futu-ftnn-rules.git
```

## 上传步骤

```bash
git add .
git commit -m "chore: publish shadowrocket modules and default config"
git push -u origin main
```

## 发布步骤

```bash
git tag v1.1.0
git push origin v1.1.0
```

推送 tag 后会自动创建 GitHub Release，并上传:

- `modules/FTNN.module`
- `modules/coding.module`
- `modules/social-media.module`
- `rules/default.conf`
- `rules/ftnn.list`
- `rules/claude-anthropic.list`
- `rules/coding.list`
- `rules/social-media.list`
- `rules/clash-template.yaml`
- `sha256.txt`
- `md5.txt`
- `CHANGELOG.md`

## 如何获得 Raw URL

进入 GitHub 仓库对应文件:

- `modules/FTNN.module`
- `modules/coding.module`
- `modules/social-media.module`
- `rules/default.conf`

点击 `Raw`，复制浏览器地址。

## 如何获得 jsDelivr URL

主分支:

```text
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/modules/FTNN.module
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/modules/coding.module
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/modules/social-media.module
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/rules/default.conf
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/rules/ftnn.list
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/rules/claude-anthropic.list
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/rules/coding.list
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/rules/social-media.list
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@main/rules/clash-template.yaml
```

指定版本:

```text
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@v1.1.0/modules/FTNN.module
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@v1.1.0/modules/coding.module
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@v1.1.0/modules/social-media.module
https://cdn.jsdelivr.net/gh/iftoif/futu-ftnn-rules@v1.1.0/rules/default.conf
```

## 本地校验

```bash
./scripts/validate.sh
```

## 规则请求

提交 Rule Request Issue，并附带:

- App 名称
- 域名
- IP
- 抓包时间
- 期望策略

