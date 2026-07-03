# NoAsAServiceTwo SDK

No-as-a-Service API client, generated from the OpenAPI spec.

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## Try it

**TypeScript**
```bash
npm install no-as-a-service-two
```

**Python**
```bash
pip install no-as-a-service-two-sdk
```

**PHP**
```bash
composer require voxgig/no-as-a-service-two-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/no-as-a-service-two-sdk/go
```

**Ruby**
```bash
gem install no-as-a-service-two-sdk
```

**Lua**
```bash
luarocks install no-as-a-service-two-sdk
```

## Quickstart

### TypeScript

```ts
import { NoAsAServiceTwoSDK } from 'no-as-a-service-two'

const client = new NoAsAServiceTwoSDK({
  apikey: process.env.NO-AS-A-SERVICE-TWO_APIKEY,
})

// Load rejectionreason data
const rejectionreason = await client.RejectionReason().load({})
console.log(rejectionreason.data)
```

See the [TypeScript README](ts/README.md) for the full guide.

## Surfaces

| Surface | Path |
| --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | `go-cli/` |
| **MCP server** | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o no-as-a-service-two-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "no-as-a-service-two": {
      "command": "/abs/path/to/no-as-a-service-two-mcp"
    }
  }
}
```

## Entities

The API exposes one entity:

| Entity | Description | API path |
| --- | --- | --- |
| **RejectionReason** |  | `/no` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
import os
from noasaservicetwo_sdk import NoAsAServiceTwoSDK

client = NoAsAServiceTwoSDK({
    "apikey": os.environ.get("NO-AS-A-SERVICE-TWO_APIKEY"),
})


# Load a specific rejectionreason
rejectionreason, err = client.RejectionReason().load({"id": "example_id"})
print(rejectionreason)
```

### PHP

```php
<?php
require_once 'noasaservicetwo_sdk.php';

$client = new NoAsAServiceTwoSDK([
    "apikey" => getenv("NO-AS-A-SERVICE-TWO_APIKEY"),
]);


// Load a specific rejectionreason
[$rejectionreason, $err] = $client->RejectionReason()->load(["id" => "example_id"]);
print_r($rejectionreason);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/no-as-a-service-two-sdk/go"

client := sdk.NewNoAsAServiceTwoSDK(map[string]any{
    "apikey": os.Getenv("NO-AS-A-SERVICE-TWO_APIKEY"),
})

// Load rejectionreason data
rejectionreason, err := client.RejectionReason(nil).Load(map[string]any{}, nil)
fmt.Println(rejectionreason)
```

### Ruby

```ruby
require_relative "NoAsAServiceTwo_sdk"

client = NoAsAServiceTwoSDK.new({
  "apikey" => ENV["NO-AS-A-SERVICE-TWO_APIKEY"],
})


# Load a specific rejectionreason
rejectionreason, err = client.RejectionReason().load({ "id" => "example_id" })
puts rejectionreason
```

### Lua

```lua
local sdk = require("no-as-a-service-two_sdk")

local client = sdk.new({
  apikey = os.getenv("NO-AS-A-SERVICE-TWO_APIKEY"),
})


-- Load a specific rejectionreason
local rejectionreason, err = client:RejectionReason():load({ id = "example_id" })
print(rejectionreason)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = NoAsAServiceTwoSDK.test()
const result = await client.RejectionReason().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = NoAsAServiceTwoSDK.test()
result, err = client.RejectionReason().load({"id": "test01"})
```

### PHP

```php
$client = NoAsAServiceTwoSDK::test();
[$result, $err] = $client->RejectionReason()->load(["id" => "test01"]);
```

### Golang

```go
client := sdk.Test()
result, err := client.RejectionReason(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = NoAsAServiceTwoSDK.test
result, err = client.RejectionReason().load({ "id" => "test01" })
```

### Lua

```lua
local client = sdk.test()
local result, err = client:RejectionReason():load({ id = "test01" })
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

---

Generated from the No-as-a-Service API OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
