[Module Reference](../modules.md) / [@tinystacks/ops-aws-core-widgets](../modules/tinystacks_ops_aws_core_widgets.md) / AwsCodePipeline

# Interface: AwsCodePipeline

[@tinystacks/ops-aws-core-widgets](../modules/tinystacks_ops_aws_core_widgets.md).AwsCodePipeline

**`Example`**

```yaml
CodePipeline:
   type: AwsCodePipeline
   displayName: Code Pipeline
   pipelineName: my-code-pipeline-name
   region: $const.region
   providers:
     - $ref: '#/Console/providers/AwsProvider'
```

## Hierarchy

- [`Widget`](../modules/tinystacks_ops_model.md#widget)

  ↳ **`AwsCodePipeline`**

## Table of contents

### Properties

- [additionalProperties](tinystacks_ops_aws_core_widgets.AwsCodePipeline.md#additionalproperties)
- [childrenIds](tinystacks_ops_aws_core_widgets.AwsCodePipeline.md#childrenids)
- [description](tinystacks_ops_aws_core_widgets.AwsCodePipeline.md#description)
- [displayName](tinystacks_ops_aws_core_widgets.AwsCodePipeline.md#displayname)
- [displayOptions](tinystacks_ops_aws_core_widgets.AwsCodePipeline.md#displayoptions)
- [id](tinystacks_ops_aws_core_widgets.AwsCodePipeline.md#id)
- [pipeline](tinystacks_ops_aws_core_widgets.AwsCodePipeline.md#pipeline)
- [pipelineName](tinystacks_ops_aws_core_widgets.AwsCodePipeline.md#pipelinename)
- [providerIds](tinystacks_ops_aws_core_widgets.AwsCodePipeline.md#providerids)
- [region](tinystacks_ops_aws_core_widgets.AwsCodePipeline.md#region)
- [type](tinystacks_ops_aws_core_widgets.AwsCodePipeline.md#type)

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

### pipeline

• `Optional` **pipeline**: [`Pipeline`](tinystacks_ops_aws_core_widgets.Pipeline.md)

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:122

___

### pipelineName

• **pipelineName**: `string`

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:120

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

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:121

___

### type

• **type**: `string`

This describes how this widget should be rendered. The "type" should be equivalent to the Object definition's name of the widget you are trying to render.

#### Inherited from

Widget.type

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:16
