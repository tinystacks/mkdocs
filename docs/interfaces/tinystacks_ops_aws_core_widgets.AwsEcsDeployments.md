[Module Reference](../modules.md) / [@tinystacks/ops-aws-core-widgets](../modules/tinystacks_ops_aws_core_widgets.md) / AwsEcsDeployments

# Interface: AwsEcsDeployments

[@tinystacks/ops-aws-core-widgets](../modules/tinystacks_ops_aws_core_widgets.md).AwsEcsDeployments

**`Example`**

```yaml
EcsDeployments:
   type: AwsEcsDeployments
   displayName: Service Deployments
   providers:
     - $ref: '#/Console/providers/AwsProvider'
   region:
     $ref: '#/Console/widgets/EcsInfo'
     path: region
   clusterName:
     $ref: '#/Console/widgets/EcsInfo'
     path: clusterName
   serviceName:
     $ref: '#/Console/widgets/EcsInfo'
     path: serviceName
```

## Hierarchy

- [`Widget`](../modules/tinystacks_ops_model.md#widget)

  ↳ **`AwsEcsDeployments`**

## Table of contents

### Properties

- [additionalProperties](tinystacks_ops_aws_core_widgets.AwsEcsDeployments.md#additionalproperties)
- [childrenIds](tinystacks_ops_aws_core_widgets.AwsEcsDeployments.md#childrenids)
- [clusterName](tinystacks_ops_aws_core_widgets.AwsEcsDeployments.md#clustername)
- [description](tinystacks_ops_aws_core_widgets.AwsEcsDeployments.md#description)
- [displayName](tinystacks_ops_aws_core_widgets.AwsEcsDeployments.md#displayname)
- [displayOptions](tinystacks_ops_aws_core_widgets.AwsEcsDeployments.md#displayoptions)
- [id](tinystacks_ops_aws_core_widgets.AwsEcsDeployments.md#id)
- [providerIds](tinystacks_ops_aws_core_widgets.AwsEcsDeployments.md#providerids)
- [region](tinystacks_ops_aws_core_widgets.AwsEcsDeployments.md#region)
- [serviceName](tinystacks_ops_aws_core_widgets.AwsEcsDeployments.md#servicename)
- [type](tinystacks_ops_aws_core_widgets.AwsEcsDeployments.md#type)

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

### clusterName

• **clusterName**: `string`

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:145

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

### region

• **region**: `string`

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:144

___

### serviceName

• **serviceName**: `string`

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:146

___

### type

• **type**: `string`

This describes how this widget should be rendered. The "type" should be equivalent to the Object definition's name of the widget you are trying to render.

#### Inherited from

Widget.type

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:16
