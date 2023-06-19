[Module Reference](../modules.md) / [@tinystacks/ops-core-widgets](../modules/tinystacks_ops_core_widgets.md) / Cli

# Interface: Cli

[@tinystacks/ops-core-widgets](../modules/tinystacks_ops_core_widgets.md).Cli

**`Example`**

```yaml
EcsDiskUtil:
   type: Cli
   displayName: Show Disk Utils
   providers:
     - $ref: '#/Console/providers/AwsProvider'
   environmentVariables:
     AWS_REGION: $param.region
     CLUSTER_NAME: $param.clusterName
     CONTAINER_NAME:
       $ref: '#/Console/widgets/EcsInfo'
       path: images[0].containerId
   command: >
     aws ecs list-tasks --cluster $CLUSTER_NAME | jq '[.taskArns[0]][0]' | xargs -I{} bash -c 'aws ecs execute-command --cluster $CLUSTER_NAME --task {} --container $CONTAINER_NAME --command "df" --interactive';
```

## Hierarchy

- [`Widget`](../modules/tinystacks_ops_model.md#widget)

  ↳ **`Cli`**

## Table of contents

### Properties

- [additionalProperties](tinystacks_ops_core_widgets.Cli.md#additionalproperties)
- [childrenIds](tinystacks_ops_core_widgets.Cli.md#childrenids)
- [command](tinystacks_ops_core_widgets.Cli.md#command)
- [commandResult](tinystacks_ops_core_widgets.Cli.md#commandresult)
- [description](tinystacks_ops_core_widgets.Cli.md#description)
- [displayName](tinystacks_ops_core_widgets.Cli.md#displayname)
- [displayOptions](tinystacks_ops_core_widgets.Cli.md#displayoptions)
- [environmentVariables](tinystacks_ops_core_widgets.Cli.md#environmentvariables)
- [hasRun](tinystacks_ops_core_widgets.Cli.md#hasrun)
- [id](tinystacks_ops_core_widgets.Cli.md#id)
- [providerIds](tinystacks_ops_core_widgets.Cli.md#providerids)
- [runOnStart](tinystacks_ops_core_widgets.Cli.md#runonstart)
- [type](tinystacks_ops_core_widgets.Cli.md#type)

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

### command

• **command**: `string`

#### Defined in

node_modules/@tinystacks/ops-core-widgets/dist/ops-types.d.ts:40

___

### commandResult

• `Optional` **commandResult**: `Object`

#### Type declaration

| Name | Type |
| :------ | :------ |
| `stderr` | `string` |
| `stdout` | `string` |

#### Defined in

node_modules/@tinystacks/ops-core-widgets/dist/ops-types.d.ts:41

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

### environmentVariables

• `Optional` **environmentVariables**: `Object`

#### Index signature

▪ [key: `string`]: `string`

#### Defined in

node_modules/@tinystacks/ops-core-widgets/dist/ops-types.d.ts:47

___

### hasRun

• `Optional` **hasRun**: `boolean`

#### Defined in

node_modules/@tinystacks/ops-core-widgets/dist/ops-types.d.ts:46

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

### runOnStart

• `Optional` **runOnStart**: `boolean`

#### Defined in

node_modules/@tinystacks/ops-core-widgets/dist/ops-types.d.ts:45

___

### type

• **type**: `string`

This describes how this widget should be rendered. The "type" should be equivalent to the Object definition's name of the widget you are trying to render.

#### Inherited from

Widget.type

#### Defined in

node_modules/@tinystacks/ops-model/dist/models/Widget.d.ts:16
