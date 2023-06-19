[Module Reference](../modules.md) / [@tinystacks/ops-aws-core-widgets](../modules/tinystacks_ops_aws_core_widgets.md) / AwsCredentialsProvider

# Interface: AwsCredentialsProvider

[@tinystacks/ops-aws-core-widgets](../modules/tinystacks_ops_aws_core_widgets.md).AwsCredentialsProvider

**`Example`**

```yaml
AwsProvider:
   type: AwsCredentialsProvider
   credentials:
     roleArn: arn:aws:iam::123456789012:role/OrganizationAccountAccessRole
     sessionName: ops-console
     region: us-east-1
     primaryCredentials:
       profileName: default
```

## Hierarchy

- [`Provider`](../modules/tinystacks_ops_model.md#provider)

  ↳ **`AwsCredentialsProvider`**

## Table of contents

### Properties

- [accountId](tinystacks_ops_aws_core_widgets.AwsCredentialsProvider.md#accountid)
- [cliEnv](tinystacks_ops_aws_core_widgets.AwsCredentialsProvider.md#clienv)
- [credentials](tinystacks_ops_aws_core_widgets.AwsCredentialsProvider.md#credentials)
- [id](tinystacks_ops_aws_core_widgets.AwsCredentialsProvider.md#id)
- [region](tinystacks_ops_aws_core_widgets.AwsCredentialsProvider.md#region)
- [type](tinystacks_ops_aws_core_widgets.AwsCredentialsProvider.md#type)

## Properties

### accountId

• `Optional` **accountId**: `string`

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:34

___

### cliEnv

• `Optional` **cliEnv**: `Object`

#### Index signature

▪ [key: `string`]: `string`

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:36

___

### credentials

• **credentials**: [`AwsCredentials`](../modules/tinystacks_ops_aws_core_widgets.md#awscredentials)

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:33

___

### id

• **id**: `string`

#### Inherited from

Provider.id

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Provider.d.ts:2

___

### region

• `Optional` **region**: `string`

#### Defined in

node_modules/@tinystacks/ops-aws-core-widgets/dist/ops-types.d.ts:35

___

### type

• **type**: `string`

This describes the type of the provider

#### Inherited from

Provider.type

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Provider.d.ts:6
