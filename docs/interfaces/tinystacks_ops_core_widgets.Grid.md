[Module Reference](../modules.md) / [@tinystacks/ops-core-widgets](../modules/tinystacks_ops_core_widgets.md) / Grid

# Interface: Grid

[@tinystacks/ops-core-widgets](../modules/tinystacks_ops_core_widgets.md).Grid

**`Example`**

```yaml
Metrics:
   type: Grid
   displayName: ECS Metrics
   orientation: horizontal
   children:
     - $ref: '#/Console/widgets/CPUMetrics'
     - $ref: '#/Console/widgets/MemoryMetrics'
     - $ref: '#/Console/widgets/Capacity'
     - $ref: '#/Console/widgets/Reservations'
```

## Hierarchy

- [`Widget`](../modules/tinystacks_ops_model.md#widget)

  ↳ **`Grid`**

## Table of contents

### Properties

- [additionalProperties](tinystacks_ops_core_widgets.Grid.md#additionalproperties)
- [childrenIds](tinystacks_ops_core_widgets.Grid.md#childrenids)
- [columns](tinystacks_ops_core_widgets.Grid.md#columns)
- [description](tinystacks_ops_core_widgets.Grid.md#description)
- [displayName](tinystacks_ops_core_widgets.Grid.md#displayname)
- [displayOptions](tinystacks_ops_core_widgets.Grid.md#displayoptions)
- [id](tinystacks_ops_core_widgets.Grid.md#id)
- [providerIds](tinystacks_ops_core_widgets.Grid.md#providerids)
- [type](tinystacks_ops_core_widgets.Grid.md#type)

## Properties

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

### columns

• `Optional` **columns**: `number`

#### Defined in

node_modules/@tinystacks/ops-core-widgets/dist/ops-types.d.ts:91

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

### id

• **id**: `string`

Unique Id for this widget.

#### Inherited from

Widget.id

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:8

___

### providerIds

• `Optional` **providerIds**: `string`[]

#### Inherited from

Widget.providerIds

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:17

___

### type

• **type**: `string`

This describes how this widget should be rendered. The "type" should be equivalent to the Object definition's name of the widget you are trying to render.

#### Inherited from

Widget.type

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:16
