{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE NoGeneralisedNewtypeDeriving #-}
{-# OPTIONS_GHC -fno-warn-missing-export-lists #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- | Gene rated by Haskell protocol buffer compiler. DO NOT EDIT!
module Monocle.Protob.Config where

import Control.Applicative ((<$>), (<*>), (<|>))
import Control.Applicative qualified as Hs
import Control.DeepSeq qualified as Hs
import Control.Monad qualified as Hs
import Data.ByteString qualified as Hs
import Data.Coerce qualified as Hs
import Data.Int qualified as Hs (Int16, Int32, Int64)
import Data.List.NonEmpty qualified as Hs (NonEmpty (..))
import Data.Map qualified as Hs (Map, mapKeysMonotonic)
import Data.Proxy qualified as Proxy
import Data.String qualified as Hs (fromString)
import Data.Text.Lazy qualified as Hs (Text)
import Data.Vector qualified as Hs (Vector)
import Data.Word qualified as Hs (Word16, Word32, Word64)
import GHC.Enum qualified as Hs
import GHC.Generics qualified as Hs
import Proto3.Suite.Class qualified as HsProtobuf
import Proto3.Suite.DotProto qualified as HsProtobuf
import Proto3.Suite.JSONPB ((.:), (.=))
import Proto3.Suite.JSONPB qualified as HsJSONPB
import Proto3.Suite.Types qualified as HsProtobuf
import Proto3.Wire qualified as HsProtobuf
import Unsafe.Coerce qualified as Hs
import Prelude qualified as Hs

data ProjectDefinition = ProjectDefinition
  { projectDefinitionName ::
      Hs.Text,
    projectDefinitionRepositoryRegex :: Hs.Text,
    projectDefinitionBranchRegex :: Hs.Text,
    projectDefinitionFileRegex :: Hs.Text
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named ProjectDefinition where
  nameOf _ = (Hs.fromString "ProjectDefinition")

instance HsProtobuf.HasDefault ProjectDefinition

instance HsProtobuf.Message ProjectDefinition where
  encodeMessage
    _
    ProjectDefinition
      { projectDefinitionName = projectDefinitionName,
        projectDefinitionRepositoryRegex =
          projectDefinitionRepositoryRegex,
        projectDefinitionBranchRegex = projectDefinitionBranchRegex,
        projectDefinitionFileRegex = projectDefinitionFileRegex
      } =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                projectDefinitionName
            ),
            ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 2)
                projectDefinitionRepositoryRegex
            ),
            ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 3)
                projectDefinitionBranchRegex
            ),
            ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 4)
                projectDefinitionFileRegex
            )
          ]
      )
  decodeMessage _ =
    (Hs.pure ProjectDefinition)
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 1)
          )
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 2)
          )
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 3)
          )
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 4)
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "name")
          []
          ""
      ),
      ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 2)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "repository_regex")
          []
          ""
      ),
      ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 3)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "branch_regex")
          []
          ""
      ),
      ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 4)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "file_regex")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB ProjectDefinition where
  toJSONPB (ProjectDefinition f1 f2 f3 f4) =
    ( HsJSONPB.object
        [ "name" .= f1,
          "repository_regex" .= f2,
          "branch_regex" .= f3,
          "file_regex" .= f4
        ]
    )
  toEncodingPB (ProjectDefinition f1 f2 f3 f4) =
    ( HsJSONPB.pairs
        [ "name" .= f1,
          "repository_regex" .= f2,
          "branch_regex" .= f3,
          "file_regex" .= f4
        ]
    )

instance HsJSONPB.FromJSONPB ProjectDefinition where
  parseJSONPB =
    ( HsJSONPB.withObject
        "ProjectDefinition"
        ( \obj ->
            (Hs.pure ProjectDefinition) <*> obj .: "name"
              <*> obj .: "repository_regex"
              <*> obj .: "branch_regex"
              <*> obj .: "file_regex"
        )
    )

instance HsJSONPB.ToJSON ProjectDefinition where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON ProjectDefinition where
  parseJSON = HsJSONPB.parseJSONPB

newtype GetProjectsRequest = GetProjectsRequest
  { getProjectsRequestIndex ::
      Hs.Text
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named GetProjectsRequest where
  nameOf _ = (Hs.fromString "GetProjectsRequest")

instance HsProtobuf.HasDefault GetProjectsRequest

instance HsProtobuf.Message GetProjectsRequest where
  encodeMessage
    _
    GetProjectsRequest
      { getProjectsRequestIndex =
          getProjectsRequestIndex
      } =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                getProjectsRequestIndex
            )
          ]
      )
  decodeMessage _ =
    (Hs.pure GetProjectsRequest)
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 1)
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "index")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB GetProjectsRequest where
  toJSONPB (GetProjectsRequest f1) =
    (HsJSONPB.object ["index" .= f1])
  toEncodingPB (GetProjectsRequest f1) =
    (HsJSONPB.pairs ["index" .= f1])

instance HsJSONPB.FromJSONPB GetProjectsRequest where
  parseJSONPB =
    ( HsJSONPB.withObject
        "GetProjectsRequest"
        (\obj -> (Hs.pure GetProjectsRequest) <*> obj .: "index")
    )

instance HsJSONPB.ToJSON GetProjectsRequest where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON GetProjectsRequest where
  parseJSON = HsJSONPB.parseJSONPB

newtype GetProjectsResponse = GetProjectsResponse
  { getProjectsResponseProjects ::
      Hs.Vector Monocle.Protob.Config.ProjectDefinition
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named GetProjectsResponse where
  nameOf _ = (Hs.fromString "GetProjectsResponse")

instance HsProtobuf.HasDefault GetProjectsResponse

instance HsProtobuf.Message GetProjectsResponse where
  encodeMessage
    _
    GetProjectsResponse
      { getProjectsResponseProjects =
          getProjectsResponseProjects
      } =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                ( Hs.coerce @(Hs.Vector Monocle.Protob.Config.ProjectDefinition)
                    @(HsProtobuf.NestedVec Monocle.Protob.Config.ProjectDefinition)
                    getProjectsResponseProjects
                )
            )
          ]
      )
  decodeMessage _ =
    (Hs.pure GetProjectsResponse)
      <*> ( Hs.coerce
              @(_ (HsProtobuf.NestedVec Monocle.Protob.Config.ProjectDefinition))
              @(_ (Hs.Vector Monocle.Protob.Config.ProjectDefinition))
              ( HsProtobuf.at
                  HsProtobuf.decodeMessageField
                  (HsProtobuf.FieldNumber 1)
              )
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          ( HsProtobuf.Repeated
              (HsProtobuf.Named (HsProtobuf.Single "ProjectDefinition"))
          )
          (HsProtobuf.Single "projects")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB GetProjectsResponse where
  toJSONPB (GetProjectsResponse f1) =
    (HsJSONPB.object ["projects" .= f1])
  toEncodingPB (GetProjectsResponse f1) =
    (HsJSONPB.pairs ["projects" .= f1])

instance HsJSONPB.FromJSONPB GetProjectsResponse where
  parseJSONPB =
    ( HsJSONPB.withObject
        "GetProjectsResponse"
        (\obj -> (Hs.pure GetProjectsResponse) <*> obj .: "projects")
    )

instance HsJSONPB.ToJSON GetProjectsResponse where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON GetProjectsResponse where
  parseJSON = HsJSONPB.parseJSONPB

newtype Workspace = Workspace {workspaceName :: Hs.Text}
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named Workspace where
  nameOf _ = (Hs.fromString "Workspace")

instance HsProtobuf.HasDefault Workspace

instance HsProtobuf.Message Workspace where
  encodeMessage _ Workspace {workspaceName = workspaceName} =
    ( Hs.mconcat
        [ ( HsProtobuf.encodeMessageField
              (HsProtobuf.FieldNumber 1)
              workspaceName
          )
        ]
    )
  decodeMessage _ =
    (Hs.pure Workspace)
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 1)
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "name")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB Workspace where
  toJSONPB (Workspace f1) = (HsJSONPB.object ["name" .= f1])
  toEncodingPB (Workspace f1) = (HsJSONPB.pairs ["name" .= f1])

instance HsJSONPB.FromJSONPB Workspace where
  parseJSONPB =
    ( HsJSONPB.withObject
        "Workspace"
        (\obj -> (Hs.pure Workspace) <*> obj .: "name")
    )

instance HsJSONPB.ToJSON Workspace where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON Workspace where
  parseJSON = HsJSONPB.parseJSONPB

newtype GetWorkspacesRequest = GetWorkspacesRequest
  { getWorkspacesRequestVoid ::
      Hs.Text
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named GetWorkspacesRequest where
  nameOf _ = (Hs.fromString "GetWorkspacesRequest")

instance HsProtobuf.HasDefault GetWorkspacesRequest

instance HsProtobuf.Message GetWorkspacesRequest where
  encodeMessage
    _
    GetWorkspacesRequest
      { getWorkspacesRequestVoid =
          getWorkspacesRequestVoid
      } =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                getWorkspacesRequestVoid
            )
          ]
      )
  decodeMessage _ =
    (Hs.pure GetWorkspacesRequest)
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 1)
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "void")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB GetWorkspacesRequest where
  toJSONPB (GetWorkspacesRequest f1) =
    (HsJSONPB.object ["void" .= f1])
  toEncodingPB (GetWorkspacesRequest f1) =
    (HsJSONPB.pairs ["void" .= f1])

instance HsJSONPB.FromJSONPB GetWorkspacesRequest where
  parseJSONPB =
    ( HsJSONPB.withObject
        "GetWorkspacesRequest"
        (\obj -> (Hs.pure GetWorkspacesRequest) <*> obj .: "void")
    )

instance HsJSONPB.ToJSON GetWorkspacesRequest where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON GetWorkspacesRequest where
  parseJSON = HsJSONPB.parseJSONPB

newtype GetWorkspacesResponse = GetWorkspacesResponse
  { getWorkspacesResponseWorkspaces ::
      Hs.Vector Monocle.Protob.Config.Workspace
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named GetWorkspacesResponse where
  nameOf _ = (Hs.fromString "GetWorkspacesResponse")

instance HsProtobuf.HasDefault GetWorkspacesResponse

instance HsProtobuf.Message GetWorkspacesResponse where
  encodeMessage
    _
    GetWorkspacesResponse
      { getWorkspacesResponseWorkspaces =
          getWorkspacesResponseWorkspaces
      } =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                ( Hs.coerce @(Hs.Vector Monocle.Protob.Config.Workspace)
                    @(HsProtobuf.NestedVec Monocle.Protob.Config.Workspace)
                    getWorkspacesResponseWorkspaces
                )
            )
          ]
      )
  decodeMessage _ =
    (Hs.pure GetWorkspacesResponse)
      <*> ( Hs.coerce
              @(_ (HsProtobuf.NestedVec Monocle.Protob.Config.Workspace))
              @(_ (Hs.Vector Monocle.Protob.Config.Workspace))
              ( HsProtobuf.at
                  HsProtobuf.decodeMessageField
                  (HsProtobuf.FieldNumber 1)
              )
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          ( HsProtobuf.Repeated
              (HsProtobuf.Named (HsProtobuf.Single "Workspace"))
          )
          (HsProtobuf.Single "workspaces")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB GetWorkspacesResponse where
  toJSONPB (GetWorkspacesResponse f1) =
    (HsJSONPB.object ["workspaces" .= f1])
  toEncodingPB (GetWorkspacesResponse f1) =
    (HsJSONPB.pairs ["workspaces" .= f1])

instance HsJSONPB.FromJSONPB GetWorkspacesResponse where
  parseJSONPB =
    ( HsJSONPB.withObject
        "GetWorkspacesResponse"
        (\obj -> (Hs.pure GetWorkspacesResponse) <*> obj .: "workspaces")
    )

instance HsJSONPB.ToJSON GetWorkspacesResponse where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON GetWorkspacesResponse where
  parseJSON = HsJSONPB.parseJSONPB

data About = About
  { aboutVersion :: Hs.Text,
    aboutLinks :: Hs.Vector Monocle.Protob.Config.About_AboutLink,
    aboutAuth :: Hs.Maybe AboutAuth
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named About where
  nameOf _ = (Hs.fromString "About")

instance HsProtobuf.HasDefault About

instance HsProtobuf.Message About where
  encodeMessage
    _
    About
      { aboutVersion = aboutVersion,
        aboutLinks = aboutLinks,
        aboutAuth = aboutAuth
      } =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                aboutVersion
            ),
            ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 2)
                ( Hs.coerce @(Hs.Vector Monocle.Protob.Config.About_AboutLink)
                    @(HsProtobuf.NestedVec Monocle.Protob.Config.About_AboutLink)
                    aboutLinks
                )
            ),
            case aboutAuth of
              Hs.Nothing -> Hs.mempty
              Hs.Just x ->
                case x of
                  AboutAuthAuthConfig y ->
                    ( HsProtobuf.encodeMessageField
                        (HsProtobuf.FieldNumber 3)
                        ( Hs.coerce @(Hs.Maybe Monocle.Protob.Config.About_AuthConfig)
                            @(HsProtobuf.Nested Monocle.Protob.Config.About_AuthConfig)
                            (Hs.Just y)
                        )
                    )
          ]
      )
  decodeMessage _ =
    (Hs.pure About)
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 1)
          )
      <*> ( Hs.coerce
              @(_ (HsProtobuf.NestedVec Monocle.Protob.Config.About_AboutLink))
              @(_ (Hs.Vector Monocle.Protob.Config.About_AboutLink))
              ( HsProtobuf.at
                  HsProtobuf.decodeMessageField
                  (HsProtobuf.FieldNumber 2)
              )
          )
      <*> ( HsProtobuf.oneof
              Hs.Nothing
              [ ( (HsProtobuf.FieldNumber 3),
                  (Hs.pure (Hs.fmap AboutAuthAuthConfig))
                    <*> ( Hs.coerce
                            @(_ (HsProtobuf.Nested Monocle.Protob.Config.About_AuthConfig))
                            @(_ (Hs.Maybe Monocle.Protob.Config.About_AuthConfig))
                            HsProtobuf.decodeMessageField
                        )
                )
              ]
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "version")
          []
          ""
      ),
      ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 2)
          ( HsProtobuf.Repeated
              (HsProtobuf.Named (HsProtobuf.Single "AboutLink"))
          )
          (HsProtobuf.Single "links")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB About where
  toJSONPB (About f1 f2 f3) =
    ( HsJSONPB.object
        [ "version" .= f1,
          "links" .= f2,
          ( let encodeAuth =
                  ( case f3 of
                      Hs.Just (AboutAuthAuthConfig f3) ->
                        (HsJSONPB.pair "auth_config" f3)
                      Hs.Nothing -> Hs.mempty
                  )
             in \options ->
                  if HsJSONPB.optEmitNamedOneof options
                    then ("auth" .= (HsJSONPB.objectOrNull [encodeAuth] options)) options
                    else encodeAuth options
          )
        ]
    )
  toEncodingPB (About f1 f2 f3) =
    ( HsJSONPB.pairs
        [ "version" .= f1,
          "links" .= f2,
          ( let encodeAuth =
                  ( case f3 of
                      Hs.Just (AboutAuthAuthConfig f3) ->
                        (HsJSONPB.pair "auth_config" f3)
                      Hs.Nothing -> Hs.mempty
                  )
             in \options ->
                  if HsJSONPB.optEmitNamedOneof options
                    then ("auth" .= (HsJSONPB.pairsOrNull [encodeAuth] options)) options
                    else encodeAuth options
          )
        ]
    )

instance HsJSONPB.FromJSONPB About where
  parseJSONPB =
    ( HsJSONPB.withObject
        "About"
        ( \obj ->
            (Hs.pure About) <*> obj .: "version" <*> obj .: "links"
              <*> ( let parseAuth parseObj =
                          Hs.msum
                            [ Hs.Just Hs.. AboutAuthAuthConfig
                                <$> (HsJSONPB.parseField parseObj "auth_config"),
                              Hs.pure Hs.Nothing
                            ]
                     in ((obj .: "auth") Hs.>>= (HsJSONPB.withObject "auth" parseAuth))
                          <|> (parseAuth obj)
                  )
        )
    )

instance HsJSONPB.ToJSON About where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON About where
  parseJSON = HsJSONPB.parseJSONPB

data About_AboutLink = About_AboutLink
  { about_AboutLinkName ::
      Hs.Text,
    about_AboutLinkUrl :: Hs.Text,
    about_AboutLinkCategory :: Hs.Text
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named About_AboutLink where
  nameOf _ = (Hs.fromString "About_AboutLink")

instance HsProtobuf.HasDefault About_AboutLink

instance HsProtobuf.Message About_AboutLink where
  encodeMessage
    _
    About_AboutLink
      { about_AboutLinkName = about_AboutLinkName,
        about_AboutLinkUrl = about_AboutLinkUrl,
        about_AboutLinkCategory = about_AboutLinkCategory
      } =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                about_AboutLinkName
            ),
            ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 2)
                about_AboutLinkUrl
            ),
            ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 3)
                about_AboutLinkCategory
            )
          ]
      )
  decodeMessage _ =
    (Hs.pure About_AboutLink)
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 1)
          )
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 2)
          )
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 3)
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "name")
          []
          ""
      ),
      ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 2)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "url")
          []
          ""
      ),
      ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 3)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "category")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB About_AboutLink where
  toJSONPB (About_AboutLink f1 f2 f3) =
    (HsJSONPB.object ["name" .= f1, "url" .= f2, "category" .= f3])
  toEncodingPB (About_AboutLink f1 f2 f3) =
    (HsJSONPB.pairs ["name" .= f1, "url" .= f2, "category" .= f3])

instance HsJSONPB.FromJSONPB About_AboutLink where
  parseJSONPB =
    ( HsJSONPB.withObject
        "About_AboutLink"
        ( \obj ->
            (Hs.pure About_AboutLink) <*> obj .: "name" <*> obj .: "url"
              <*> obj .: "category"
        )
    )

instance HsJSONPB.ToJSON About_AboutLink where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON About_AboutLink where
  parseJSON = HsJSONPB.parseJSONPB

data About_AuthConfig = About_AuthConfig
  { about_AuthConfigForceLogin ::
      Hs.Bool,
    about_AuthConfigIssuer :: Hs.Text,
    about_AuthConfigProviderName :: Hs.Text
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named About_AuthConfig where
  nameOf _ = (Hs.fromString "About_AuthConfig")

instance HsProtobuf.HasDefault About_AuthConfig

instance HsProtobuf.Message About_AuthConfig where
  encodeMessage
    _
    About_AuthConfig
      { about_AuthConfigForceLogin =
          about_AuthConfigForceLogin,
        about_AuthConfigIssuer = about_AuthConfigIssuer,
        about_AuthConfigProviderName = about_AuthConfigProviderName
      } =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                about_AuthConfigForceLogin
            ),
            ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 2)
                about_AuthConfigIssuer
            ),
            ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 3)
                about_AuthConfigProviderName
            )
          ]
      )
  decodeMessage _ =
    (Hs.pure About_AuthConfig)
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 1)
          )
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 2)
          )
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 3)
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          (HsProtobuf.Prim HsProtobuf.Bool)
          (HsProtobuf.Single "force_login")
          []
          ""
      ),
      ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 2)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "issuer")
          []
          ""
      ),
      ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 3)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "provider_name")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB About_AuthConfig where
  toJSONPB (About_AuthConfig f1 f2 f3) =
    ( HsJSONPB.object
        ["force_login" .= f1, "issuer" .= f2, "provider_name" .= f3]
    )
  toEncodingPB (About_AuthConfig f1 f2 f3) =
    ( HsJSONPB.pairs
        ["force_login" .= f1, "issuer" .= f2, "provider_name" .= f3]
    )

instance HsJSONPB.FromJSONPB About_AuthConfig where
  parseJSONPB =
    ( HsJSONPB.withObject
        "About_AuthConfig"
        ( \obj ->
            (Hs.pure About_AuthConfig) <*> obj .: "force_login"
              <*> obj .: "issuer"
              <*> obj .: "provider_name"
        )
    )

instance HsJSONPB.ToJSON About_AuthConfig where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON About_AuthConfig where
  parseJSON = HsJSONPB.parseJSONPB

data AboutAuth = AboutAuthAuthConfig Monocle.Protob.Config.About_AuthConfig
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named AboutAuth where
  nameOf _ = (Hs.fromString "AboutAuth")

newtype GetAboutRequest = GetAboutRequest
  { getAboutRequestVoid ::
      Hs.Text
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named GetAboutRequest where
  nameOf _ = (Hs.fromString "GetAboutRequest")

instance HsProtobuf.HasDefault GetAboutRequest

instance HsProtobuf.Message GetAboutRequest where
  encodeMessage
    _
    GetAboutRequest {getAboutRequestVoid = getAboutRequestVoid} =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                getAboutRequestVoid
            )
          ]
      )
  decodeMessage _ =
    (Hs.pure GetAboutRequest)
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 1)
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "void")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB GetAboutRequest where
  toJSONPB (GetAboutRequest f1) = (HsJSONPB.object ["void" .= f1])
  toEncodingPB (GetAboutRequest f1) = (HsJSONPB.pairs ["void" .= f1])

instance HsJSONPB.FromJSONPB GetAboutRequest where
  parseJSONPB =
    ( HsJSONPB.withObject
        "GetAboutRequest"
        (\obj -> (Hs.pure GetAboutRequest) <*> obj .: "void")
    )

instance HsJSONPB.ToJSON GetAboutRequest where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON GetAboutRequest where
  parseJSON = HsJSONPB.parseJSONPB

newtype GetAboutResponse = GetAboutResponse
  { getAboutResponseAbout ::
      Hs.Maybe Monocle.Protob.Config.About
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named GetAboutResponse where
  nameOf _ = (Hs.fromString "GetAboutResponse")

instance HsProtobuf.HasDefault GetAboutResponse

instance HsProtobuf.Message GetAboutResponse where
  encodeMessage
    _
    GetAboutResponse {getAboutResponseAbout = getAboutResponseAbout} =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                ( Hs.coerce @(Hs.Maybe Monocle.Protob.Config.About)
                    @(HsProtobuf.Nested Monocle.Protob.Config.About)
                    getAboutResponseAbout
                )
            )
          ]
      )
  decodeMessage _ =
    (Hs.pure GetAboutResponse)
      <*> ( Hs.coerce @(_ (HsProtobuf.Nested Monocle.Protob.Config.About))
              @(_ (Hs.Maybe Monocle.Protob.Config.About))
              ( HsProtobuf.at
                  HsProtobuf.decodeMessageField
                  (HsProtobuf.FieldNumber 1)
              )
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          (HsProtobuf.Prim (HsProtobuf.Named (HsProtobuf.Single "About")))
          (HsProtobuf.Single "about")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB GetAboutResponse where
  toJSONPB (GetAboutResponse f1) = (HsJSONPB.object ["about" .= f1])
  toEncodingPB (GetAboutResponse f1) =
    (HsJSONPB.pairs ["about" .= f1])

instance HsJSONPB.FromJSONPB GetAboutResponse where
  parseJSONPB =
    ( HsJSONPB.withObject
        "GetAboutResponse"
        (\obj -> (Hs.pure GetAboutResponse) <*> obj .: "about")
    )

instance HsJSONPB.ToJSON GetAboutResponse where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON GetAboutResponse where
  parseJSON = HsJSONPB.parseJSONPB

data GroupDefinition = GroupDefinition
  { groupDefinitionName ::
      Hs.Text,
    groupDefinitionMembers :: Hs.Word32
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named GroupDefinition where
  nameOf _ = (Hs.fromString "GroupDefinition")

instance HsProtobuf.HasDefault GroupDefinition

instance HsProtobuf.Message GroupDefinition where
  encodeMessage
    _
    GroupDefinition
      { groupDefinitionName = groupDefinitionName,
        groupDefinitionMembers = groupDefinitionMembers
      } =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                groupDefinitionName
            ),
            ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 2)
                groupDefinitionMembers
            )
          ]
      )
  decodeMessage _ =
    (Hs.pure GroupDefinition)
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 1)
          )
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 2)
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "name")
          []
          ""
      ),
      ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 2)
          (HsProtobuf.Prim HsProtobuf.UInt32)
          (HsProtobuf.Single "members")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB GroupDefinition where
  toJSONPB (GroupDefinition f1 f2) =
    (HsJSONPB.object ["name" .= f1, "members" .= f2])
  toEncodingPB (GroupDefinition f1 f2) =
    (HsJSONPB.pairs ["name" .= f1, "members" .= f2])

instance HsJSONPB.FromJSONPB GroupDefinition where
  parseJSONPB =
    ( HsJSONPB.withObject
        "GroupDefinition"
        ( \obj ->
            (Hs.pure GroupDefinition) <*> obj .: "name" <*> obj .: "members"
        )
    )

instance HsJSONPB.ToJSON GroupDefinition where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON GroupDefinition where
  parseJSON = HsJSONPB.parseJSONPB

newtype GetGroupsRequest = GetGroupsRequest
  { getGroupsRequestIndex ::
      Hs.Text
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named GetGroupsRequest where
  nameOf _ = (Hs.fromString "GetGroupsRequest")

instance HsProtobuf.HasDefault GetGroupsRequest

instance HsProtobuf.Message GetGroupsRequest where
  encodeMessage
    _
    GetGroupsRequest {getGroupsRequestIndex = getGroupsRequestIndex} =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                getGroupsRequestIndex
            )
          ]
      )
  decodeMessage _ =
    (Hs.pure GetGroupsRequest)
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 1)
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "index")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB GetGroupsRequest where
  toJSONPB (GetGroupsRequest f1) = (HsJSONPB.object ["index" .= f1])
  toEncodingPB (GetGroupsRequest f1) =
    (HsJSONPB.pairs ["index" .= f1])

instance HsJSONPB.FromJSONPB GetGroupsRequest where
  parseJSONPB =
    ( HsJSONPB.withObject
        "GetGroupsRequest"
        (\obj -> (Hs.pure GetGroupsRequest) <*> obj .: "index")
    )

instance HsJSONPB.ToJSON GetGroupsRequest where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON GetGroupsRequest where
  parseJSON = HsJSONPB.parseJSONPB

newtype GetGroupsResponse = GetGroupsResponse
  { getGroupsResponseItems ::
      Hs.Vector Monocle.Protob.Config.GroupDefinition
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named GetGroupsResponse where
  nameOf _ = (Hs.fromString "GetGroupsResponse")

instance HsProtobuf.HasDefault GetGroupsResponse

instance HsProtobuf.Message GetGroupsResponse where
  encodeMessage
    _
    GetGroupsResponse {getGroupsResponseItems = getGroupsResponseItems} =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                ( Hs.coerce @(Hs.Vector Monocle.Protob.Config.GroupDefinition)
                    @(HsProtobuf.NestedVec Monocle.Protob.Config.GroupDefinition)
                    getGroupsResponseItems
                )
            )
          ]
      )
  decodeMessage _ =
    (Hs.pure GetGroupsResponse)
      <*> ( Hs.coerce
              @(_ (HsProtobuf.NestedVec Monocle.Protob.Config.GroupDefinition))
              @(_ (Hs.Vector Monocle.Protob.Config.GroupDefinition))
              ( HsProtobuf.at
                  HsProtobuf.decodeMessageField
                  (HsProtobuf.FieldNumber 1)
              )
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          ( HsProtobuf.Repeated
              (HsProtobuf.Named (HsProtobuf.Single "GroupDefinition"))
          )
          (HsProtobuf.Single "items")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB GetGroupsResponse where
  toJSONPB (GetGroupsResponse f1) = (HsJSONPB.object ["items" .= f1])
  toEncodingPB (GetGroupsResponse f1) =
    (HsJSONPB.pairs ["items" .= f1])

instance HsJSONPB.FromJSONPB GetGroupsResponse where
  parseJSONPB =
    ( HsJSONPB.withObject
        "GetGroupsResponse"
        (\obj -> (Hs.pure GetGroupsResponse) <*> obj .: "items")
    )

instance HsJSONPB.ToJSON GetGroupsResponse where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON GetGroupsResponse where
  parseJSON = HsJSONPB.parseJSONPB

data GetGroupMembersRequest = GetGroupMembersRequest
  { getGroupMembersRequestIndex ::
      Hs.Text,
    getGroupMembersRequestGroup :: Hs.Text
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named GetGroupMembersRequest where
  nameOf _ = (Hs.fromString "GetGroupMembersRequest")

instance HsProtobuf.HasDefault GetGroupMembersRequest

instance HsProtobuf.Message GetGroupMembersRequest where
  encodeMessage
    _
    GetGroupMembersRequest
      { getGroupMembersRequestIndex =
          getGroupMembersRequestIndex,
        getGroupMembersRequestGroup = getGroupMembersRequestGroup
      } =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                getGroupMembersRequestIndex
            ),
            ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 2)
                getGroupMembersRequestGroup
            )
          ]
      )
  decodeMessage _ =
    (Hs.pure GetGroupMembersRequest)
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 1)
          )
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 2)
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "index")
          []
          ""
      ),
      ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 2)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "group")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB GetGroupMembersRequest where
  toJSONPB (GetGroupMembersRequest f1 f2) =
    (HsJSONPB.object ["index" .= f1, "group" .= f2])
  toEncodingPB (GetGroupMembersRequest f1 f2) =
    (HsJSONPB.pairs ["index" .= f1, "group" .= f2])

instance HsJSONPB.FromJSONPB GetGroupMembersRequest where
  parseJSONPB =
    ( HsJSONPB.withObject
        "GetGroupMembersRequest"
        ( \obj ->
            (Hs.pure GetGroupMembersRequest) <*> obj .: "index"
              <*> obj .: "group"
        )
    )

instance HsJSONPB.ToJSON GetGroupMembersRequest where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON GetGroupMembersRequest where
  parseJSON = HsJSONPB.parseJSONPB

newtype GetGroupMembersResponse = GetGroupMembersResponse
  { getGroupMembersResponseMembers ::
      Hs.Vector Hs.Text
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named GetGroupMembersResponse where
  nameOf _ = (Hs.fromString "GetGroupMembersResponse")

instance HsProtobuf.HasDefault GetGroupMembersResponse

instance HsProtobuf.Message GetGroupMembersResponse where
  encodeMessage
    _
    GetGroupMembersResponse
      { getGroupMembersResponseMembers =
          getGroupMembersResponseMembers
      } =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                ( Hs.coerce @(Hs.Vector Hs.Text) @(HsProtobuf.UnpackedVec Hs.Text)
                    getGroupMembersResponseMembers
                )
            )
          ]
      )
  decodeMessage _ =
    (Hs.pure GetGroupMembersResponse)
      <*> ( Hs.coerce @(_ (HsProtobuf.UnpackedVec Hs.Text))
              @(_ (Hs.Vector Hs.Text))
              ( HsProtobuf.at
                  HsProtobuf.decodeMessageField
                  (HsProtobuf.FieldNumber 1)
              )
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          (HsProtobuf.Repeated HsProtobuf.String)
          (HsProtobuf.Single "members")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB GetGroupMembersResponse where
  toJSONPB (GetGroupMembersResponse f1) =
    (HsJSONPB.object ["members" .= f1])
  toEncodingPB (GetGroupMembersResponse f1) =
    (HsJSONPB.pairs ["members" .= f1])

instance HsJSONPB.FromJSONPB GetGroupMembersResponse where
  parseJSONPB =
    ( HsJSONPB.withObject
        "GetGroupMembersResponse"
        (\obj -> (Hs.pure GetGroupMembersResponse) <*> obj .: "members")
    )

instance HsJSONPB.ToJSON GetGroupMembersResponse where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON GetGroupMembersResponse where
  parseJSON = HsJSONPB.parseJSONPB
