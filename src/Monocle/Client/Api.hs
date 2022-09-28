{-# OPTIONS_GHC -fno-warn-missing-export-lists -fno-warn-unused-imports #-}

-- Generated by monocle-codegen. DO NOT EDIT!

-- |
-- Copyright: (c) 2021 Monocle authors
-- SPDX-License-Identifier: AGPL-3.0-only
module Monocle.Client.Api where

import Control.Monad.IO.Class (MonadIO)
import Monocle.Client (MonocleClient, monocleReq)
import Monocle.Protob.Auth
import Monocle.Protob.Config
import Monocle.Protob.Crawler
import Monocle.Protob.Login
import Monocle.Protob.Metric
import Monocle.Protob.Search

loginLoginValidation :: MonadIO m => MonocleClient -> LoginValidationRequest -> m LoginValidationResponse
loginLoginValidation = monocleReq "api/2/login/username/validate"

authGetMagicJwt :: MonadIO m => MonocleClient -> GetMagicJwtRequest -> m GetMagicJwtResponse
authGetMagicJwt = monocleReq "api/2/auth/get"

authWhoAmi :: MonadIO m => MonocleClient -> WhoAmiRequest -> m WhoAmiResponse
authWhoAmi = monocleReq "api/2/auth/whoami"

configGetWorkspaces :: MonadIO m => MonocleClient -> GetWorkspacesRequest -> m GetWorkspacesResponse
configGetWorkspaces = monocleReq "api/2/get_workspaces"

configGetProjects :: MonadIO m => MonocleClient -> GetProjectsRequest -> m GetProjectsResponse
configGetProjects = monocleReq "api/2/get_projects"

configGetGroups :: MonadIO m => MonocleClient -> GetGroupsRequest -> m GetGroupsResponse
configGetGroups = monocleReq "api/2/get_groups"

configGetGroupMembers :: MonadIO m => MonocleClient -> GetGroupMembersRequest -> m GetGroupMembersResponse
configGetGroupMembers = monocleReq "api/2/get_group_members"

configGetAbout :: MonadIO m => MonocleClient -> GetAboutRequest -> m GetAboutResponse
configGetAbout = monocleReq "api/2/about"

searchSuggestions :: MonadIO m => MonocleClient -> SuggestionsRequest -> m SuggestionsResponse
searchSuggestions = monocleReq "api/2/suggestions"

searchFields :: MonadIO m => MonocleClient -> FieldsRequest -> m FieldsResponse
searchFields = monocleReq "api/2/search/fields"

searchCheck :: MonadIO m => MonocleClient -> CheckRequest -> m CheckResponse
searchCheck = monocleReq "api/2/search/check"

searchQuery :: MonadIO m => MonocleClient -> QueryRequest -> m QueryResponse
searchQuery = monocleReq "api/2/search/query"

searchAuthor :: MonadIO m => MonocleClient -> AuthorRequest -> m AuthorResponse
searchAuthor = monocleReq "api/2/search/author"

metricList :: MonadIO m => MonocleClient -> ListRequest -> m ListResponse
metricList = monocleReq "api/2/metric/list"

metricGet :: MonadIO m => MonocleClient -> GetRequest -> m GetResponse
metricGet = monocleReq "api/2/metric/get"

metricInfo :: MonadIO m => MonocleClient -> InfoRequest -> m InfoResponse
metricInfo = monocleReq "api/2/metric/info"

crawlerAddDoc :: MonadIO m => MonocleClient -> AddDocRequest -> m AddDocResponse
crawlerAddDoc = monocleReq "api/2/crawler/add"

crawlerCommit :: MonadIO m => MonocleClient -> CommitRequest -> m CommitResponse
crawlerCommit = monocleReq "api/2/crawler/commit"

crawlerCommitInfo :: MonadIO m => MonocleClient -> CommitInfoRequest -> m CommitInfoResponse
crawlerCommitInfo = monocleReq "api/2/crawler/get_commit_info"
