[Module Reference](../modules.md) / [@tinystacks/ops-aws-core-widgets](../modules/tinystacks_ops_aws_core_widgets.md) / AwsCloudWatchLogs

# Interface: AwsCloudWatchLogs

[@tinystacks/ops-aws-core-widgets](../modules/tinystacks_ops_aws_core_widgets.md).AwsCloudWatchLogs

**`Example`**

```yaml
Logs:
   type: AwsCloudWatchLogs
   displayName: Service Logs
   region: us-east-1
   providers:
     - $ref: '#/Console/providers/AwsProvider'
   logGroupName:
     $ref: '#/Console/widgets/EcsInfo'
     path: images[0].cwLogsGroupArn
   timeRange:
     time: 12
     unit: h
```

## Hierarchy

- [`Widget`](../modules/tinystacks_ops_model.md#widget)

  ↳ **`AwsCloudWatchLogs`**

## Table of contents

### Properties

- [additionalProperties](tinystacks_ops_aws_core_widgets.AwsCloudWatchLogs.md#additionalproperties)
- [childrenIds](tinystacks_ops_aws_core_widgets.AwsCloudWatchLogs.md#childrenids)
- [description](tinystacks_ops_aws_core_widgets.AwsCloudWatchLogs.md#description)
- [displayName](tinystacks_ops_aws_core_widgets.AwsCloudWatchLogs.md#displayname)
- [displayOptions](tinystacks_ops_aws_core_widgets.AwsCloudWatchLogs.md#displayoptions)
- [events](tinystacks_ops_aws_core_widgets.AwsCloudWatchLogs.md#events)
- [id](tinystacks_ops_aws_core_widgets.AwsCloudWatchLogs.md#id)
- [logGroupName](tinystacks_ops_aws_core_widgets.AwsCloudWatchLogs.md#loggroupname)
- [logStreamName](tinystacks_ops_aws_core_widgets.AwsCloudWatchLogs.md#logstreamname)
- [providerIds](tinystacks_ops_aws_core_widgets.AwsCloudWatchLogs.md#providerids)
- [region](tinystacks_ops_aws_core_widgets.AwsCloudWatchLogs.md#region)
- [showTimeRangeSelector](tinystacks_ops_aws_core_widgets.AwsCloudWatchLogs.md#showtimerangeselector)
- [timeRange](tinystacks_ops_aws_core_widgets.AwsCloudWatchLogs.md#timerange)
- [type](tinystacks_ops_aws_core_widgets.AwsCloudWatchLogs.md#type)

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

### events

• `Optional` **events**: `OutputLogEvent`[]

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:83

___

### id

• **id**: `string`

Unique Id for this widget.

#### Inherited from

Widget.id

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:8

___

### logGroupName

• **logGroupName**: `string`

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:79

___

### logStreamName

• `Optional` **logStreamName**: `string`

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:80

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

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:78

___

### showTimeRangeSelector

• `Optional` **showTimeRangeSelector**: `boolean`

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:82

___

### timeRange

• **timeRange**: [`TimeRange`](../modules/tinystacks_ops_aws_core_widgets.md#timerange)

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:81

___

### type

• **type**: `string`

This describes how this widget should be rendered. The "type" should be equivalent to the Object definition's name of the widget you are trying to render.

#### Inherited from

Widget.type

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:16
