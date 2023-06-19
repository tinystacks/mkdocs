[Module Reference](../modules.md) / [@tinystacks/ops-core-widgets](../modules/tinystacks_ops_core_widgets.md) / GithubCredentialsProvider

# Interface: GithubCredentialsProvider

[@tinystacks/ops-core-widgets](../modules/tinystacks_ops_core_widgets.md).GithubCredentialsProvider

**`Example`**

```yaml
 GithubProvider:
     type: GithubCredentialsProvider
     credentials:
       token: personal-or-app-access-token
```

## Hierarchy

- [`Provider`](../modules/tinystacks_ops_model.md#provider)

  ↳ **`GithubCredentialsProvider`**

## Table of contents

### Properties

- [credentials](tinystacks_ops_core_widgets.GithubCredentialsProvider.md#credentials)
- [host](tinystacks_ops_core_widgets.GithubCredentialsProvider.md#host)
- [id](tinystacks_ops_core_widgets.GithubCredentialsProvider.md#id)
- [type](tinystacks_ops_core_widgets.GithubCredentialsProvider.md#type)

## Properties

### credentials

• **credentials**: [`GithubCredentials`](tinystacks_ops_core_widgets.GithubCredentials.md)

#### Defined in

node_modules/@tinystacks/ops-core-widgets/dist/ops-types.d.ts:15

___

### host

• `Optional` **host**: `string`

The GitHub hostname to target.  Set this for Github Enterprise.

#### Defined in

node_modules/@tinystacks/ops-core-widgets/dist/ops-types.d.ts:19

___

### id

• **id**: `string`

#### Inherited from

Provider.id

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Provider.d.ts:2

___

### type

• **type**: `string`

This describes the type of the provider

#### Inherited from

Provider.type

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Provider.d.ts:6
