[Module Reference](../modules.md) / [@tinystacks/ops-core-widgets](../modules/tinystacks_ops_core_widgets.md) / JsonFilter

# Interface: JsonFilter

[@tinystacks/ops-core-widgets](../modules/tinystacks_ops_core_widgets.md).JsonFilter

A widget is an object that is passed in and out of the API. It is used to serialize the complex and resolved widgets into only the information needed by the API and frontend to fetch data and render the widget, respectively. The main difference between this object and YamlWidget is that this object does not carry over resolved references to providers and children.

## Hierarchy

- [`Widget`](../modules/tinystacks_ops_model.md#widget)

  ↳ **`JsonFilter`**

## Table of contents

### Properties

- [additionalProperties](tinystacks_ops_core_widgets.JsonFilter.md#additionalproperties)
- [childrenIds](tinystacks_ops_core_widgets.JsonFilter.md#childrenids)
- [description](tinystacks_ops_core_widgets.JsonFilter.md#description)
- [displayName](tinystacks_ops_core_widgets.JsonFilter.md#displayname)
- [displayOptions](tinystacks_ops_core_widgets.JsonFilter.md#displayoptions)
- [filteredJson](tinystacks_ops_core_widgets.JsonFilter.md#filteredjson)
- [id](tinystacks_ops_core_widgets.JsonFilter.md#id)
- [jsonObject](tinystacks_ops_core_widgets.JsonFilter.md#jsonobject)
- [paths](tinystacks_ops_core_widgets.JsonFilter.md#paths)
- [providerIds](tinystacks_ops_core_widgets.JsonFilter.md#providerids)
- [type](tinystacks_ops_core_widgets.JsonFilter.md#type)

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

### filteredJson

• `Optional` **filteredJson**: { `json`: `any` ; `pathDisplayName`: `string`  }[]

#### Defined in

node_modules/@tinystacks/ops-core-widgets/dist/ops-types.d.ts:101

___

### id

• **id**: `string`

Unique Id for this widget.

#### Inherited from

Widget.id

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:8

___

### jsonObject

• **jsonObject**: `Object`

#### Index signature

▪ [key: `string`]: `any`

#### Defined in

node_modules/@tinystacks/ops-core-widgets/dist/ops-types.d.ts:94

___

### paths

• **paths**: { `path`: `string` ; `pathDisplayName`: `string`  }[]

#### Defined in

node_modules/@tinystacks/ops-core-widgets/dist/ops-types.d.ts:97

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
