[Module Reference](../modules.md) / [@tinystacks/ops-aws-core-widgets](../modules/tinystacks_ops_aws_core_widgets.md) / AwsIamJson

# Interface: AwsIamJson

[@tinystacks/ops-aws-core-widgets](../modules/tinystacks_ops_aws_core_widgets.md).AwsIamJson

A widget is an object that is passed in and out of the API. It is used to serialize the complex and resolved widgets into only the information needed by the API and frontend to fetch data and render the widget, respectively. The main difference between this object and YamlWidget is that this object does not carry over resolved references to providers and children.

## Hierarchy

- [`Widget`](../modules/tinystacks_ops_model.md#widget)

  ↳ **`AwsIamJson`**

## Table of contents

### Properties

- [additionalProperties](tinystacks_ops_aws_core_widgets.AwsIamJson.md#additionalproperties)
- [childrenIds](tinystacks_ops_aws_core_widgets.AwsIamJson.md#childrenids)
- [description](tinystacks_ops_aws_core_widgets.AwsIamJson.md#description)
- [displayName](tinystacks_ops_aws_core_widgets.AwsIamJson.md#displayname)
- [displayOptions](tinystacks_ops_aws_core_widgets.AwsIamJson.md#displayoptions)
- [id](tinystacks_ops_aws_core_widgets.AwsIamJson.md#id)
- [policyArn](tinystacks_ops_aws_core_widgets.AwsIamJson.md#policyarn)
- [providerIds](tinystacks_ops_aws_core_widgets.AwsIamJson.md#providerids)
- [region](tinystacks_ops_aws_core_widgets.AwsIamJson.md#region)
- [roleArn](tinystacks_ops_aws_core_widgets.AwsIamJson.md#rolearn)
- [type](tinystacks_ops_aws_core_widgets.AwsIamJson.md#type)

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

### id

• **id**: `string`

Unique Id for this widget.

#### Inherited from

Widget.id

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:8

___

### policyArn

• `Optional` **policyArn**: `string`

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:169

___

### providerIds

• `Optional` **providerIds**: `string`[]

#### Inherited from

Widget.providerIds

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:17

___

### region

• **region**: `string`

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:167

___

### roleArn

• `Optional` **roleArn**: `string`

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:168

___

### type

• **type**: `string`

This describes how this widget should be rendered. The "type" should be equivalent to the Object definition's name of the widget you are trying to render.

#### Inherited from

Widget.type

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:16
