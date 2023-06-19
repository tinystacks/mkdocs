[Module Reference](../modules.md) / @tinystacks/ops-model

# Module: @tinystacks/ops-model

## Table of contents

### Namespaces

- [Constant](tinystacks_ops_model.Constant.md)
- [Parameter](tinystacks_ops_model.Parameter.md)

### Type Aliases

- [Config](tinystacks_ops_model.md#config)
- [Console](tinystacks_ops_model.md#console)
- [Constant](tinystacks_ops_model.md#constant)
- [Dashboard](tinystacks_ops_model.md#dashboard)
- [Parameter](tinystacks_ops_model.md#parameter)
- [Ping](tinystacks_ops_model.md#ping)
- [Provider](tinystacks_ops_model.md#provider)
- [TinyStacksError](tinystacks_ops_model.md#tinystackserror)
- [Widget](tinystacks_ops_model.md#widget)
- [YamlConsole](tinystacks_ops_model.md#yamlconsole)
- [YamlDashboard](tinystacks_ops_model.md#yamldashboard)
- [YamlProvider](tinystacks_ops_model.md#yamlprovider)
- [YamlWidget](tinystacks_ops_model.md#yamlwidget)

## Type Aliases

### Config

Ƭ **Config**: `Object`

#### Type declaration

| Name | Type |
| :------ | :------ |
| `Console` | { `constants?`: `Record`<`string`, [`Constant`](tinystacks_ops_model.md#constant)\> ; `dashboards?`: `Record`<`string`, [`YamlDashboard`](tinystacks_ops_model.md#yamldashboard)\> ; `dependencies?`: `Record`<`string`, `string`\> ; `name`: `string` ; `providers?`: `Record`<`string`, [`YamlProvider`](tinystacks_ops_model.md#yamlprovider)\> ; `repository?`: { `branch?`: `string` ; `configFile?`: `string` ; `url?`: `string`  } ; `widgets?`: `Record`<`string`, [`YamlWidget`](tinystacks_ops_model.md#yamlwidget)\>  } |
| `Console.constants?` | `Record`<`string`, [`Constant`](tinystacks_ops_model.md#constant)\> |
| `Console.dashboards?` | `Record`<`string`, [`YamlDashboard`](tinystacks_ops_model.md#yamldashboard)\> |
| `Console.dependencies?` | `Record`<`string`, `string`\> |
| `Console.name` | `string` |
| `Console.providers?` | `Record`<`string`, [`YamlProvider`](tinystacks_ops_model.md#yamlprovider)\> |
| `Console.repository?` | { `branch?`: `string` ; `configFile?`: `string` ; `url?`: `string`  } |
| `Console.repository.branch?` | `string` |
| `Console.repository.configFile?` | `string` |
| `Console.repository.url?` | `string` |
| `Console.widgets?` | `Record`<`string`, [`YamlWidget`](tinystacks_ops_model.md#yamlwidget)\> |

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Config.d.ts:5

___

### Console

Ƭ **Console**: `Object`

A console is a top-level construct that defines all

#### Type declaration

| Name | Type | Description |
| :------ | :------ | :------ |
| `constants?` | `Record`<`string`, [`Constant`](tinystacks_ops_model.md#constant)\> | - |
| `dashboards` | `Record`<`string`, [`Dashboard`](tinystacks_ops_model.md#dashboard)\> | - |
| `dependencies?` | `Record`<`string`, `string`\> | - |
| `name` | `string` | a human-readable name for your console. |
| `providers` | `Record`<`string`, [`Provider`](tinystacks_ops_model.md#provider)\> | - |
| `repository?` | { `branch?`: `string` ; `configFile?`: `string` ; `url?`: `string`  } | - |
| `repository.branch?` | `string` | The name of the branch within the repository to use as the source of truth for this console when hosted. |
| `repository.configFile?` | `string` | The relative file path of the main config file within the repository. |
| `repository.url?` | `string` | The github repository url to use as a source of truth for this console when hosted |
| `widgets` | `Record`<`string`, [`Widget`](tinystacks_ops_model.md#widget)\> | - |

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Console.d.ts:8

___

### Constant

Ƭ **Constant**: `Object`

#### Type declaration

| Name | Type | Description |
| :------ | :------ | :------ |
| `description?` | `string` | description of this constant |
| `type?` | [`type`](../enums/tinystacks_ops_model.Constant.type.md) | the type for this constant |
| `value` | `string` | the value for this constant |

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Constant.d.ts:1

node_modules/@tinystacks/ops-model/dist/models/Constant.d.ts:15

___

### Dashboard

Ƭ **Dashboard**: `Object`

#### Type declaration

| Name | Type | Description |
| :------ | :------ | :------ |
| `description?` | `string` | a description of the dashboard |
| `id` | `string` | - |
| `parameters?` | [`Parameter`](tinystacks_ops_model.md#parameter)[] | runtime parameters that can be assigned a value via a query param in the url |
| `route` | `string` | A URL-safe route where this dashboard can be accessed |
| `widgetIds?` | `string`[] | - |

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Dashboard.d.ts:2

___

### Parameter

Ƭ **Parameter**: `Object`

#### Type declaration

| Name | Type | Description |
| :------ | :------ | :------ |
| `default?` | `string` | the default value for this parameter |
| `name` | `string` | a uri compliant string to name this parameter |
| `type?` | [`type`](../enums/tinystacks_ops_model.Parameter.type.md) | the type for this parameter |

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Parameter.d.ts:1

node_modules/@tinystacks/ops-model/dist/models/Parameter.d.ts:15

___

### Ping

Ƭ **Ping**: `string`

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Ping.d.ts:1

___

### Provider

Ƭ **Provider**: `Object`

#### Type declaration

| Name | Type | Description |
| :------ | :------ | :------ |
| `id` | `string` | - |
| `type` | `string` | This describes the type of the provider |

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Provider.d.ts:1

___

### TinyStacksError

Ƭ **TinyStacksError**: `Object`

#### Type declaration

| Name | Type | Description |
| :------ | :------ | :------ |
| `cause?` | `string` | Used to describe the origin of an error if that original error has meaning to the client. This field should add specificity to 'message'. |
| `context?` | `string` | Used to identify what part of the request caused the error for non-JSON payloads. |
| `fields?` | `Record`<`string`, `string`\> | Used to identify specific fields in a JSON body that caused the error. Typically only used for 4xx type responses. The key should be the json path to the invalid property and the value should be an error message specific to that property. |
| `message` | `string` | A concise message describing the error in more detail than the status code. |
| `name` | `string` | The standard name of a TinyStacksError; always to be set to TinyStacksError. |
| `stack?` | `string` | The stack trace of the error. This is typically not shown to the client, but is important for server-side logging and debugging. |
| `status` | `number` | The standard HTTP status code for the error. Be sure to use the most specific error code possible, falling back to the X00 codes as necessary. See https://developer.mozilla.org/en-US/docs/Web/HTTP/Status for more details. |
| `type` | ``"Unauthorized"`` \| ``"Unauthenticated"`` \| ``"Validation"`` \| ``"NotFound"`` \| ``"Conflict"`` \| ``"InternalServerError"`` \| `string` | A standard error type corresponding to the textual representation of an HTTP status code. See https://www.npmjs.com/package/http-status-codes for status codes not included in our default list. |

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/TinyStacksError.d.ts:1

___

### Widget

Ƭ **Widget**: `Object`

A widget is an object that is passed in and out of the API. It is used to serialize the complex and resolved widgets into only the information needed by the API and frontend to fetch data and render the widget, respectively. The main difference between this object and YamlWidget is that this object does not carry over resolved references to providers and children.

#### Type declaration

| Name | Type | Description |
| :------ | :------ | :------ |
| `additionalProperties?` | `any` | - |
| `childrenIds?` | `string`[] | - |
| `description?` | `string` | - |
| `displayName` | `string` | A human-readable display name, usually used to title a widget |
| `displayOptions?` | { `showDescription?`: `boolean` ; `showDisplayName?`: `boolean`  } | - |
| `displayOptions.showDescription?` | `boolean` | Whether to show the description |
| `displayOptions.showDisplayName?` | `boolean` | Whether to show the display name |
| `id` | `string` | Unique Id for this widget. |
| `providerIds?` | `string`[] | - |
| `type` | `string` | This describes how this widget should be rendered. The "type" should be equivalent to the Object definition's name of the widget you are trying to render. |

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:4

___

### YamlConsole

Ƭ **YamlConsole**: `Object`

A console is a top-level construct that defines all

#### Type declaration

| Name | Type | Description |
| :------ | :------ | :------ |
| `constants?` | `Record`<`string`, [`Constant`](tinystacks_ops_model.md#constant)\> | - |
| `dashboards` | `Record`<`string`, [`YamlDashboard`](tinystacks_ops_model.md#yamldashboard)\> | - |
| `dependencies?` | `Record`<`string`, `string`\> | - |
| `name` | `string` | a human-readable name for your console. |
| `providers` | `Record`<`string`, [`YamlProvider`](tinystacks_ops_model.md#yamlprovider)\> | - |
| `repository?` | { `branch?`: `string` ; `configFile?`: `string` ; `url?`: `string`  } | - |
| `repository.branch?` | `string` | The name of the branch within the repository to use as the source of truth for this console when hosted. |
| `repository.configFile?` | `string` | The relative file path of the main config file within the repository. |
| `repository.url?` | `string` | The github repository url to use as a source of truth for this console when hosted |
| `widgets` | `Record`<`string`, [`YamlWidget`](tinystacks_ops_model.md#yamlwidget)\> | - |

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/YamlConsole.d.ts:8

___

### YamlDashboard

Ƭ **YamlDashboard**: `Object`

#### Type declaration

| Name | Type | Description |
| :------ | :------ | :------ |
| `description?` | `string` | a description of the dashboard |
| `parameters?` | [`Parameter`](tinystacks_ops_model.md#parameter)[] | - |
| `route` | `string` | - |
| `widgets?` | [`YamlWidget`](tinystacks_ops_model.md#yamlwidget)[] | - |

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/YamlDashboard.d.ts:3

___

### YamlProvider

Ƭ **YamlProvider**: `Object`

#### Type declaration

| Name | Type | Description |
| :------ | :------ | :------ |
| `id?` | `string` | - |
| `type` | `string` | This describes how type of the provider |

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/YamlProvider.d.ts:1

___

### YamlWidget

Ƭ **YamlWidget**: { `children?`: [`YamlWidget`](tinystacks_ops_model.md#yamlwidget)[] ; `description?`: `string` ; `displayName`: `string` ; `displayOptions?`: { `showDescription?`: `boolean` ; `showDisplayName?`: `boolean`  } ; `providers?`: [`Provider`](tinystacks_ops_model.md#provider)[] ; `type`: `string`  } & `Record`<`string`, `any`\>

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/YamlWidget.d.ts:2
