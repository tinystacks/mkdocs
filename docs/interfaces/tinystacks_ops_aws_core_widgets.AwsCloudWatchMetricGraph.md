[Module Reference](../modules.md) / [@tinystacks/ops-aws-core-widgets](../modules/tinystacks_ops_aws_core_widgets.md) / AwsCloudWatchMetricGraph

# Interface: AwsCloudWatchMetricGraph

[@tinystacks/ops-aws-core-widgets](../modules/tinystacks_ops_aws_core_widgets.md).AwsCloudWatchMetricGraph

**`Example`**

```yaml
CPUMetrics:
   type: AwsCloudWatchMetricGraph
   displayName: CPU Utilization Details
   region:
     $ref: '#/Console/widgets/EcsInfo'
     path: region
   period: 300
   providers:
     - $ref: '#/Console/providers/AwsProvider'
   timeRange:
     time: 1
     unit: h
   metrics:
     - metricNamespace: AWS/ECS
       metricName: CPUUtilization
       metricDisplayName: 'Average'
       statistic: Average
       dimensions:
         - key: ClusterName
           value: $param.clusterName
         - key: ServiceName
           value: $param.serviceName
     - metricNamespace: AWS/ECS
       metricName: CPUUtilization
       metricDisplayName: 'Max'
       statistic: Maximum
       dimensions:
         - key: ClusterName
           value: $param.clusterName
         - key: ServiceName
           value: $param.serviceName
     - metricNamespace: AWS/ECS
       metricName: CPUUtilization
       metricDisplayName: 'Min'
       statistic: Minimum
       dimensions:
         - key: ClusterName
           value: $param.clusterName
         - key: ServiceName
           value: $param.serviceName
```

## Hierarchy

- [`Widget`](../modules/tinystacks_ops_model.md#widget)

  ↳ **`AwsCloudWatchMetricGraph`**

## Table of contents

### Properties

- [additionalProperties](tinystacks_ops_aws_core_widgets.AwsCloudWatchMetricGraph.md#additionalproperties)
- [childrenIds](tinystacks_ops_aws_core_widgets.AwsCloudWatchMetricGraph.md#childrenids)
- [description](tinystacks_ops_aws_core_widgets.AwsCloudWatchMetricGraph.md#description)
- [displayName](tinystacks_ops_aws_core_widgets.AwsCloudWatchMetricGraph.md#displayname)
- [displayOptions](tinystacks_ops_aws_core_widgets.AwsCloudWatchMetricGraph.md#displayoptions)
- [id](tinystacks_ops_aws_core_widgets.AwsCloudWatchMetricGraph.md#id)
- [metrics](tinystacks_ops_aws_core_widgets.AwsCloudWatchMetricGraph.md#metrics)
- [providerIds](tinystacks_ops_aws_core_widgets.AwsCloudWatchMetricGraph.md#providerids)
- [region](tinystacks_ops_aws_core_widgets.AwsCloudWatchMetricGraph.md#region)
- [timeRange](tinystacks_ops_aws_core_widgets.AwsCloudWatchMetricGraph.md#timerange)
- [type](tinystacks_ops_aws_core_widgets.AwsCloudWatchMetricGraph.md#type)

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

### metrics

• **metrics**: [`Metric`](tinystacks_ops_aws_core_widgets.Metric.md)[]

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:242

___

### providerIds

• `Optional` **providerIds**: `string`[]

#### Inherited from

Widget.providerIds

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:17

___

### region

• `Optional` **region**: `string`

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:240

___

### timeRange

• `Optional` **timeRange**: [`TimeRange`](../modules/tinystacks_ops_aws_core_widgets.md#timerange)

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:241

___

### type

• **type**: `string`

This describes how this widget should be rendered. The "type" should be equivalent to the Object definition's name of the widget you are trying to render.

#### Inherited from

Widget.type

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:16
