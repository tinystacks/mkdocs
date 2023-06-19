[Module Reference](../modules.md) / [@tinystacks/ops-core-widgets](../modules/tinystacks_ops_core_widgets.md) / Github

# Interface: Github

[@tinystacks/ops-core-widgets](../modules/tinystacks_ops_core_widgets.md).Github

**`Example`**

```yaml
Github:
   type: Github
   displayName: Github Action Workflows
   organization: my-org
   repository: my-repo
   providers:
     - $ref: '#/Console/providers/GithubProvider'
```

## Hierarchy

- [`Widget`](../modules/tinystacks_ops_model.md#widget)

  ↳ **`Github`**

## Table of contents

### Properties

- [actions](tinystacks_ops_core_widgets.Github.md#actions)
- [additionalProperties](tinystacks_ops_core_widgets.Github.md#additionalproperties)
- [childrenIds](tinystacks_ops_core_widgets.Github.md#childrenids)
- [description](tinystacks_ops_core_widgets.Github.md#description)
- [displayName](tinystacks_ops_core_widgets.Github.md#displayname)
- [displayOptions](tinystacks_ops_core_widgets.Github.md#displayoptions)
- [host](tinystacks_ops_core_widgets.Github.md#host)
- [id](tinystacks_ops_core_widgets.Github.md#id)
- [organization](tinystacks_ops_core_widgets.Github.md#organization)
- [providerIds](tinystacks_ops_core_widgets.Github.md#providerids)
- [repository](tinystacks_ops_core_widgets.Github.md#repository)
- [type](tinystacks_ops_core_widgets.Github.md#type)

## Properties

### actions

• `Optional` **actions**: [`GithubAction`](tinystacks_ops_core_widgets.GithubAction.md)[]

#### Defined in

node_modules/@tinystacks/ops-core-widgets/dist/ops-types.d.ts:74

___

### additionalProperties

• `Optional` **additionalProperties**: `any`

#### Inherited from

Widget.additionalProperties

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:30

___

### childrenIds

• `Optional` **childrenIds**: `string`[]

#### Inherited from

Widget.childrenIds

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:18

___

### description

• `Optional` **description**: `string`

#### Inherited from

Widget.description

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:19

___

### displayName

• **displayName**: `string`

A human-readable display name, usually used to title a widget

#### Inherited from

Widget.displayName

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:12

___

### displayOptions

• `Optional` **displayOptions**: `Object`

#### Type declaration

| Name | Type | Description |
| :------ | :------ | :------ |
| `showDescription?` | `boolean` | Whether to show the description |
| `showDisplayName?` | `boolean` | Whether to show the display name |

#### Inherited from

Widget.displayOptions

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:20

___

### host

• `Optional` **host**: `string`

#### Defined in

node_modules/@tinystacks/ops-core-widgets/dist/ops-types.d.ts:71

___

### id

• **id**: `string`

Unique Id for this widget.

#### Inherited from

Widget.id

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:8

___

### organization

• **organization**: `string`

#### Defined in

node_modules/@tinystacks/ops-core-widgets/dist/ops-types.d.ts:72

___

### providerIds

• `Optional` **providerIds**: `string`[]

#### Inherited from

Widget.providerIds

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:17

___

### repository

• **repository**: `string`

#### Defined in

node_modules/@tinystacks/ops-core-widgets/dist/ops-types.d.ts:73

___

### type

• **type**: `string`

This describes how this widget should be rendered. The "type" should be equivalent to the Object definition's name of the widget you are trying to render.

#### Inherited from

Widget.type

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:16
