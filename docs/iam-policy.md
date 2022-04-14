TinyStacks uses the following IAM policy to authorize access to your AWS account. 

```yaml
Parameters:
  TinyStacksToken:
    Description: DO NOT CHANGE OR SHARE THIS. This is a temporary TinyStacks token unique to your user
    Type: String
  TinyStacksUserId:
    Description: DO NOT CHANGE OR SHARE THIS. This is your unique user id, it's necessary for deleting this role
    Type: String
Resources:
  IdentityAndSecretManagementPolicy:
    Type: "AWS::IAM::ManagedPolicy"
    Properties:
      ManagedPolicyName: 
        !Sub "${AWS::StackName}-secret-and-identity-management-policy"
      PolicyDocument:
        Version: 2012-10-17
        Statement:
        - Effect: Allow
          Action:
            - "iam:List*"
            - "iam:Get*"
            - "iam:*Tag*"
            - "iam:Untag*"
            - "iam:CreateInstanceProfile"
            - "iam:DeleteInstanceProfile"
            - "iam:AddRoleToInstanceProfile"
            - "iam:RemoveRoleFromInstanceProfile"
            - "iam:CreatePolicy*"
            - "iam:DeletePolicy*"
            - "iam:CreateRole"
            - "iam:UpdateRole"
            - "iam:PassRole"
            - "iam:DeleteRole"
            - "iam:PutRolePolicy"
            - "iam:DeleteRolePolicy"
            - "iam:AttachRolePolicy"
            - "iam:UpdateAssumeRolePolicy"
            - "iam:DetachRolePolicy"
            - "iam:CreateServiceLinkedRole"
            - "iam:DeleteServiceLinkedRole"
            - "iam:GetServiceLinkedRoleDeletionStatus"
            - "kms:*Tag*"
            - "kms:Decrypt"
            - "secretsmanager:*Tag*"
            - "secretsmanager:CreateSecret"
            - "secretsmanager:GetSecretValue"
            - "secretsmanager:PutSecretValue"
            - "secretsmanager:DeleteSecret"
            - "secretsmanager:GetRandomPassword"
            - "ssm:PutParameter"
            - "ssm:GetParameters"
            - "ssm:DeleteParameter"
            - "ssm:*Tag*"
          Resource: "*"
  Role:
    Type: "AWS::IAM::Role"
    Properties:
      AssumeRolePolicyDocument:
        Version: 2012-10-17
        Statement:
          - Effect: Allow
            Principal:
              AWS: arn:aws:iam::849087520365:role/tinystacks-service-role
            Action:
              - sts:AssumeRole
      ManagedPolicyArns:
        - !Ref IdentityAndSecretManagementPolicy
      Policies:
        - PolicyName: AllowAssumingCdkRoles
          PolicyDocument:
            Version: 2012-10-17
            Statement:
              - Effect: Allow
                Action:
                  - "sts:AssumeRole"
                Resource:
                  - !Sub "arn:aws:iam::${AWS::AccountId}:role/cdk*"
        - PolicyName: CdkBucketPolicy
          PolicyDocument:
            Version: 2012-10-17
            Statement:
              - Effect: Allow
                Action:
                  - "s3:*"
                Resource:
                  - "arn:aws:s3:::cdk*"
        - PolicyName: CdkSsmParameterPolicy
          PolicyDocument:
            Version: 2012-10-17
            Statement:
              - Effect: Allow
                Action:
                  - "ssm:GetParameter"
                Resource:
                  - "arn:aws:ssm::*:parameter/cdk-bootstrap/*"
  ScalingPolicy:
    Type: "AWS::IAM::ManagedPolicy"
    Properties:
      ManagedPolicyName: 
        !Sub "${AWS::StackName}-scaling-policy"
      PolicyDocument:
        Version: 2012-10-17
        Statement:
        - Effect: Allow
          Action:
            - "autoscaling:Describe*"
            - "autoscaling:*Tag*"
            - "autoscaling:CreateScalingPlan"
            - "autoscaling:GetScalingPlanResourceForecastData"
            - "autoscaling:UpdateScalingPlan"
            - "autoscaling:DeleteScalingPlan"
            - "autoscaling:CreateLaunchConfiguration"
            - "autoscaling:DeleteLaunchConfiguration"
            - "autoscaling:CreateAutoScalingGroup"
            - "autoscaling:DeleteAutoScalingGroup"
            - "autoscaling:TerminateInstanceInAutoScalingGroup"
            - "autoscaling:UpdateAutoScalingGroup"
            - "autoscaling:PutScalingPolicy"
            - "autoscaling:DeletePolicy"
            - "autoscaling:ExecutePolicy"
            - "autoscaling:DeleteLifecycleHook"
            - "autoscaling:PutLifecycleHook"
            - "autoscaling:BatchDeleteScheduledAction"
            - "autoscaling:DeleteScheduledAction"
            - "application-autoscaling:Describe*"
            - "application-autoscaling:*Tag*"
            - "application-autoscaling:RegisterScalableTarget"
            - "application-autoscaling:DeregisterScalableTarget"
            - "application-autoscaling:PutScalingPolicy"
            - "application-autoscaling:DeleteScalingPolicy"
            - "application-autoscaling:DeleteScheduledAction"
            - "application-autoscaling:PutScheduledAction"
          Resource: "*"
      Roles:
        - !Ref Role
  ComputePolicy:
    Type: "AWS::IAM::ManagedPolicy"
    Properties:
      ManagedPolicyName: 
        !Sub "${AWS::StackName}-compute-policy"
      PolicyDocument:
        Version: 2012-10-17
        Statement:
        - Effect: Allow
          Action:
            - "ec2:Describe*"
            - "ec2:*Tag*"
            - "ec2:CreateImage"
            - "ec2:CopyImage"
            - "ec2:ExportImage"
            - "ec2:ImportImage"
            - "ec2:ImportImage"
            - "ec2:RegisterImage"
            - "ec2:DeregisterImage"
            - "ec2:StartInstances"
            - "ec2:RunInstances"
            - "ec2:RebootInstances"
            - "ec2:TerminateInstances"
            - "ec2:StopInstances"
            - "ec2:CreateInternetGateway"
            - "ec2:AttachInternetGateway"
            - "ec2:DetachInternetGateway"
            - "ec2:DeleteInternetGateway"
            - "ec2:CreateNatGateway"
            - "ec2:DeleteNatGateway"
            - "ec2:CreateRoute"
            - "ec2:RepalceRoute"
            - "ec2:DeleteRoute"
            - "ec2:CreateRouteTable"
            - "ec2:AssociateRouteTable"
            - "ec2:ReplaceRoute*"
            - "ec2:DisassociateRouteTable"
            - "ec2:DeleteRouteTable"
            - "ec2:CreateSecurityGroup"
            - "ec2:DeleteSecurityGroup"
            - "ec2:AuthorizeSecurityGroupIngress"
            - "ec2:RevokeSecurityGroupIngress"
            - "ec2:AuthorizeSecurityGroupEgress"
            - "ec2:RevokeSecurityGroupEgress"
            - "ec2:AssociateSubnetCidrBlock"
            - "ec2:CreateDefaultSubnet"
            - "ec2:CreateSubnet"
            - "ec2:CreateSubnetCidrReservation"
            - "ec2:DeleteSubnet"
            - "ec2:DeleteSubnetCidrReservation"
            - "ec2:DisassociateSubnetCidrBlock"
            - "ec2:GetSubnetCidrReservations"
            - "ec2:ModifySubnetAttribute"
            - "ec2:CreateVpc"
            - "ec2:DeleteVpc"
            - "ec2:ModifyVpcAttribute"
            - "ec2:AcceptTransitGatewayVpcAttachment"
            - "ec2:CreateTransitGatewayVpcAttachment"
            - "ec2:DeleteTransitGatewayVpcAttachment"
            - "ec2:ModifyTransitGatewayVpcAttachment"
            - "ec2:RejectTransitGatewayVpcAttachment"
            - "ec2:AcceptVpcPeeringConnection"
            - "ec2:CreateVpcPeeringConnection"
            - "ec2:DeleteVpcPeeringConnection"
            - "ec2:ModifyVpcPeeringConnectionOptions"
            - "ec2:RejectVpcPeeringConnection"
            - "ec2:AllocateAddress"
            - "ec2:ReleaseAddress"
            - "ec2:AssociateAddress"
            - "ec2:DisassociateAddress"
            - "ec2:ModifyAddressAttribute"
            - "ec2:ResetAddressAttribute"
            - "ec2:AllocateHosts"
            - "ec2:ModifyInstanceAttribute"
            - "ecr:Get*"
            - "ecr:*Tag*"
            - "ecr:CreateRepository"
            - "ecr:DescribeRepositories"
            - "ecr:DeleteRepository"
            - "ecr:PutImageScanningConfiguration"
            - "ecs:List*"
            - "ecs:Describe*"
            - "ecs:*Tag*"
            - "ecs:CreateCluster"
            - "ecs:UpdateCluster"
            - "ecs:DeleteCluster"
            - "ecs:CreateService"
            - "ecs:UpdateService"
            - "ecs:DeleteService"
            - "ecs:CreateTaskDefinition"
            - "ecs:UpdateTaskDefinition"
            - "ecs:DeleteTaskDefinition"
            - "ecs:DeregisterTaskDefinition"
            - "ecs:RegisterTaskDefinition"
            - "ecs:CreateCapacityProvider"
            - "ecs:DeleteCapacityProvider"
            - "ecs:DescribeCapacityProviders"
            - "ecs:PutClusterCapacityProviders"
            - "ecs:UpdateCapacityProvider"

          Resource: "*"
      Roles:
        - !Ref Role
  CiCdPolicy:
    Type: "AWS::IAM::ManagedPolicy"
    Properties:
      ManagedPolicyName: 
        !Sub "${AWS::StackName}-ci-cd-policy"
      PolicyDocument:
        Version: 2012-10-17
        Statement:
        - Effect: Allow
          Action:
            - "codebuild:*Tag*"
            - "codebuild:List*"
            - "codebuild:BatchGet*"
            - "codebuild:CreateProject"
            - "codebuild:UpdateProject"
            - "codebuild:DeleteProject"
            - "codepipeline:List*"
            - "codepipeline:Get*"
            - "codepipeline:*Tag*"
            - "codepipeline:CreatePipeline"
            - "codepipeline:UpdatePipeline"
            - "codepipeline:DeletePipeline"
            - "codepipeline:StartPipelineExecution"
            - "codepipeline:StopPipelineExecution"            
          Resource: "*"
      Roles:
        - !Ref Role
  MonitoringPolicy:
    Type: "AWS::IAM::ManagedPolicy"
    Properties:
      ManagedPolicyName: 
        !Sub "${AWS::StackName}-monitoring-policy"
      PolicyDocument:
        Version: 2012-10-17
        Statement:
        - Effect: Allow
          Action:
            - "cloudtrail:*Tag*"
            - "cloudtrail:Describe*"
            - "cloudtrail:StartLogging"
            - "cloudtrail:PutEventSelectors"
            - "cloudtrail:*Trail"
            - "cloudtrail:ListTrails"
            - "cloudformation:*"
            - "cloudwatch:*Tag*"
            - "cloudwatch:DeleteDashboards"
            - "cloudwatch:Get*"
            - "cloudwatch:ListDashboards"
            - "cloudwatch:PutDashboard"
            - "logs:Get*"
            - "logs:Describe*"
            - "logs:*Tag*"
            - "logs:CreateLogDelivery"
            - "logs:ListLogDeliveries"
            - "logs:UpdateLogDelivery"
            - "logs:DeleteLogDelivery"
            - "logs:CreateLogGroup"
            - "logs:CreateLogStream"
            - "logs:PutResourcePolicy"
            - "logs:PutRetentionPolicy"
            - "logs:*LogEvents"
            - "ce:*"
          Resource: "*"
      Roles:
        - !Ref Role
  EventStreamsPolicy:
    Type: "AWS::IAM::ManagedPolicy"
    Properties:
      ManagedPolicyName: 
        !Sub "${AWS::StackName}-event-streams-policy"
      PolicyDocument:
        Version: 2012-10-17
        Statement:
        - Effect: Allow
          Action:
            - "events:*Tag*"
            - "events:PutTargets"
            - "events:RemoveTargets"
            - "events:PutRule"
            - "events:DescribeRule"
            - "events:DeleteRule"
            - "sns:List*"
            - "sns:Get*"
            - "sns:*Tag*"
            - "sns:ConfirmSubscription"
            - "sns:CreateTopic"
            - "sns:DeleteTopic"
            - "sns:SetTopicAttributes"
            - "sns:ConfirmSubscription"
            - "sns:SetSubscriptionAttributes"
            - "sns:Subscribe"
            - "sns:Unsubscribe"                    
          Resource: "*"
      Roles:
        - !Ref Role
  StoragePolicy:
    Type: "AWS::IAM::ManagedPolicy"
    Properties:
      ManagedPolicyName: 
        !Sub "${AWS::StackName}-storage-policy"
      PolicyDocument:
        Version: 2012-10-17
        Statement:
        - Effect: Allow
          Action:
            - "rds:Describe*"
            - "rds:*Tag*"
            - "rds:CreateDBSubnetGroup"
            - "rds:DeleteDBSubnetGroup"
            - "rds:CreateDBInstance"
            - "rds:ModifyDBInstance"
            - "rds:DeleteDBInstance"
            - "rds:CreateDBInstanceReadReplica"
            - "rds:PromoteReadReplica"
            - "s3:Describe*"
            - "s3:Get*"
            - "s3:List*"
            - "s3:*Tag*"
            - "s3:CreateBucket"
            - "s3:DeleteBucket"
            - "s3:PutBucketPolicy"
            - "s3:DeleteBucketPolicy"
            - "s3:PutEncryptionConfiguration"
            - "s3:PutBucketVersioning"
            - "s3:PutBucketPublicAccessBlock"
            - "s3:PutBucketAcl"
            - "s3:DeleteObject"
            - "s3:DeleteObjectVersion"
            - "s3:ObjectOwnerOverrideToBucketOwner"
            - "s3:PutBucketObjectLockConfiguration"
            - "s3:PutObject"
            - "s3:PutObjectAcl"
            - "s3:PutObjectLegalHold"
            - "s3:PutObjectRetention"
            - "s3:PutObjectVersionAcl"
            - "s3:ReplicateObject"
            - "s3:RestoreObject"                
          Resource: "*"
      Roles:
        - !Ref Role
  NetworkingPolicy:
    Type: "AWS::IAM::ManagedPolicy"
    Properties:
      ManagedPolicyName: 
        !Sub "${AWS::StackName}-networking-policy"
      PolicyDocument:
        Version: 2012-10-17
        Statement:
        - Effect: Allow
          Action:
            - "apigateway:*Tag*"
            - "apigateway:POST"
            - "apigateway:GET"
            - "apigateway:PUT"
            - "apigateway:PATCH"
            - "apigateway:DELETE"
            - "cloudfront:*Tag*"
            - "cloudfront:CreateDistribution"
            - "cloudfront:CreateDistributionWithTags"
            - "cloudfront:GetDistribution"
            - "elasticloadbalancing:Describe*"
            - "elasticloadbalancing:*Tag*"
            - "elasticloadbalancing:CreateListener"
            - "elasticloadbalancing:ModifyListener"
            - "elasticloadbalancing:DeleteListener"
            - "elasticloadbalancing:CreateLoadBalancer"
            - "elasticloadbalancing:DeleteLoadBalancer"
            - "elasticloadbalancing:CreateTargetGroup"
            - "elasticloadbalancing:ModifyTargetGroup"
            - "elasticloadbalancing:DeleteTargetGroup"
            - "elasticloadbalancing:ModifyTargetGroupAttributes"
            - "elasticloadbalancing:ModifyLoadBalancerAttributes"
            - "route53:Get*"
            - "route53:List*"
            - "route53:*Tag*"
            - "route53:AssociateVPCWithHostedZone"
            - "route53:CreateHostedZone"
            - "route53:DeleteHostedZone"
            - "route53:DisableHostedZoneDNSSEC"
            - "route53:DisassociateVPCFromHostedZone"
            - "route53:EnableHostedZoneDNSSEC"
            - "route53:UpdateHostedZoneComment"
            - "servicediscovery:Get*"
            - "servicediscovery:*Tag*"
            - "servicediscovery:CreateService"
            - "servicediscovery:DeleteService"
            - "servicediscovery:CreatePrivateDnsNamespace"
            - "servicediscovery:UpdatePrivateDnsNamespace"
            - "servicediscovery:DeleteNamespace"
            - "servicequotas:Get*"                          
          Resource: "*"
      Roles:
        - !Ref Role
  ServerlessPolicy:
    Type: "AWS::IAM::ManagedPolicy"
    Properties:
      ManagedPolicyName: 
        !Sub "${AWS::StackName}-serverless-policy"
      PolicyDocument:
        Version: 2012-10-17
        Statement:
        - Effect: Allow
          Action:
            - "lambda:List*"
            - "lambda:Get*"
            - "lambda:*Tag*"
            - "lambda:CreateFunction"
            - "lambda:UpdateFunction"
            - "lambda:DeleteFunction"
            - "lambda:AddPermission"
            - "lambda:RemovePermission"
            - "lambda:InvokeFunction"
            - "lambda:DeleteFunctionCodeSigningConfig"
            - "lambda:DeleteFunctionConcurrency"
            - "lambda:DeleteFunctionEventInvokeConfig"
            - "lambda:PutFunctionCodeSigningConfig"
            - "lambda:PutFunctionConcurrency"
            - "lambda:PutFunctionEventInvokeConfig"
            - "lambda:UpdateFunctionCode"
            - "lambda:UpdateFunctionCodeSigningConfig"
            - "lambda:UpdateFunctionConfiguration"
            - "lambda:UpdateFunctionEventInvokeConfig"
            - "lambda:AddLayerVersionPermission"
            - "lambda:DeleteLayerVersion"
            - "lambda:PublishLayerVersion"
            - "lambda:RemoveLayerVersionPermission"            
          Resource: "*"
      Roles:
        - !Ref Role
  CloudTrailBucket:
    Type: AWS::S3::Bucket
    Properties:
      AccessControl: LogDeliveryWrite
      BucketName: !Sub "${TinyStacksUserId}-${AWS::AccountId}"
      Tags:
        - Key: TinyStacks_Owner
          Value: !Sub "TinyStacks_${TinyStacksUserId}"
        - Key: TinyStacks_StackName
          Value: !Ref AWS::StackName
      VersioningConfiguration:
        Status: Enabled
    UpdateReplacePolicy: Delete
    DeletionPolicy: Delete
    DependsOn:
      - IdentityAndSecretManagementPolicy
      - StoragePolicy
  CloudTrailBucketPolicy:
    Type: AWS::S3::BucketPolicy
    Properties:
      Bucket: !Ref CloudTrailBucket
      PolicyDocument:
        Version: 2012-10-17
        Statement:
          - Action: s3:GetBucketAcl
            Effect: Allow
            Principal:
              Service: cloudtrail.amazonaws.com
            Resource:
              Fn::GetAtt:
                - CloudTrailBucket
                - Arn
          - Action: s3:PutObject
            Condition:
              StringEquals:
                s3:x-amz-acl: bucket-owner-full-control
                aws:SourceArn: 
                  !Sub
                    - "arn:aws:cloudtrail:${AWS::Region}:${AWS::AccountId}:trail/${CloudTrailName}"
                    - CloudTrailName: !Ref CloudTrail
            Effect: Allow
            Principal:
              Service: cloudtrail.amazonaws.com
            Resource:
              Fn::Join:
                - ""
                - - Fn::GetAtt:
                    - CloudTrailBucket
                    - Arn
                  - !Sub "/AWSLogs/${AWS::AccountId}/*"
  CloudTrail:
    Type: AWS::CloudTrail::Trail
    Properties:
      IsLogging: true
      S3BucketName: !Ref CloudTrailBucket
      EnableLogFileValidation: true
      IncludeGlobalServiceEvents: true
      IsMultiRegionTrail: true
      Tags:
        - Key: TinyStacks_Owner
          Value: !Sub "TinyStacks_${TinyStacksUserId}"
        - Key: TinyStacks_StackName
          Value: !Ref AWS::StackName
  RegisterRoleWithTinyStacks:
    Type: "Custom::notifyTS"
    Properties:
      ServiceToken: arn:aws:sns:us-east-1:849087520365:tinystacks-register-role
      RoleArn: !GetAtt Role.Arn
      Region: !Ref "AWS::Region"
      TinyStacksUserToken: !Ref TinyStacksToken
      TinyStacksUserId: !Ref TinyStacksUserId
    DependsOn:
      - IdentityAndSecretManagementPolicy
      - Role
      - ScalingPolicy
      - ComputePolicy
      - CiCdPolicy
      - MonitoringPolicy
      - EventStreamsPolicy
      - StoragePolicy
      - NetworkingPolicy
      - ServerlessPolicy
      - CloudTrailBucket
      - CloudTrailBucketPolicy
      - CloudTrail

```