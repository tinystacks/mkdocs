[Module Reference](../modules.md) / [@tinystacks/ops-aws-utilization-widgets](../modules/tinystacks_ops_aws_utilization_widgets.md) / AwsUtilizationProvider

# Interface: AwsUtilizationProvider

[@tinystacks/ops-aws-utilization-widgets](../modules/tinystacks_ops_aws_utilization_widgets.md).AwsUtilizationProvider

**`Example`**

```yaml
UtilizationProvider:
   type: AwsUtilizationProvider
```

## Hierarchy

- [`Provider`](../modules/tinystacks_ops_model.md#provider)

  ↳ **`AwsUtilizationProvider`**

## Table of contents

### Properties

- [id](tinystacks_ops_aws_utilization_widgets.AwsUtilizationProvider.md#id)
- [regions](tinystacks_ops_aws_utilization_widgets.AwsUtilizationProvider.md#regions)
- [services](tinystacks_ops_aws_utilization_widgets.AwsUtilizationProvider.md#services)
- [type](tinystacks_ops_aws_utilization_widgets.AwsUtilizationProvider.md#type)

## Properties

### id

• **id**: `string`

#### Inherited from

Provider.id

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Provider.d.ts:2

___

### regions

• `Optional` **regions**: `string`[]

#### Defined in

node_modules/@tinystacks/ops-aws-utilization-widgets/dist/ops-types.d.ts:28

___

### services

• `Optional` **services**: [`AwsResourceType`](../modules/tinystacks_ops_aws_utilization_widgets.md#awsresourcetype)[]

#### Defined in

node_modules/@tinystacks/ops-aws-utilization-widgets/dist/ops-types.d.ts:27

___

### type

• **type**: `string`

This describes the type of the provider

#### Inherited from

Provider.type

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Provider.d.ts:6
