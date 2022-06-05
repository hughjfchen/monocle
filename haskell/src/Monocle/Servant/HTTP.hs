{-# LANGUAGE DataKinds #-}

-- Generated by monocle-codegen. DO NOT EDIT!

-- |
-- Copyright: (c) 2021 Monocle authors
-- SPDX-License-Identifier: AGPL-3.0-only
module Monocle.Servant.HTTP (MonocleAPI, server) where

import Monocle.Api.Jwt (AuthenticatedUser, OIDCEnv (..), User (..), handleOIDCLogin)
import Monocle.Api.Server (authGetMagicJwt, authWhoAmi, configGetAbout, configGetGroupMembers, configGetGroups, configGetProjects, configGetWorkspaces, crawlerAddDoc, crawlerCommit, crawlerCommitInfo, handleLoggedIn, handleLogin, loginLoginValidation, metricGet, metricList, searchAuthor, searchCheck, searchFields, searchQuery, searchSuggestions)
import Monocle.Env
import Monocle.Protob.Auth (GetMagicJwtRequest, GetMagicJwtResponse, WhoAmiRequest, WhoAmiResponse)
import Monocle.Protob.Config (GetAboutRequest, GetAboutResponse, GetGroupMembersRequest, GetGroupMembersResponse, GetGroupsRequest, GetGroupsResponse, GetProjectsRequest, GetProjectsResponse, GetWorkspacesRequest, GetWorkspacesResponse)
import Monocle.Protob.Crawler (AddDocRequest, AddDocResponse, CommitInfoRequest, CommitInfoResponse, CommitRequest, CommitResponse)
import Monocle.Protob.Login (LoginValidationRequest, LoginValidationResponse)
import Monocle.Protob.Metric (GetRequest, GetResponse, ListRequest, ListResponse)
import Monocle.Protob.Search (AuthorRequest, AuthorResponse, CheckRequest, CheckResponse, FieldsRequest, FieldsResponse, QueryRequest, QueryResponse, SuggestionsRequest, SuggestionsResponse)
import Monocle.Servant.PBJSON (PBJSON)
import Relude
import Servant
import Servant.Auth.Server (Auth, Cookie, JWT)
import Servant.HTML.Blaze (HTML)

type MonocleAPI =
  "login" :> "username" :> "validate" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Login.LoginValidationRequest :> Post '[PBJSON, JSON] Monocle.Protob.Login.LoginValidationResponse
    :<|> "auth" :> "get" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Auth.GetMagicJwtRequest :> Post '[PBJSON, JSON] Monocle.Protob.Auth.GetMagicJwtResponse
    :<|> "auth" :> "whoami" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Auth.WhoAmiRequest :> Post '[PBJSON, JSON] Monocle.Protob.Auth.WhoAmiResponse
    :<|> "get_workspaces" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Config.GetWorkspacesRequest :> Post '[PBJSON, JSON] Monocle.Protob.Config.GetWorkspacesResponse
    :<|> "get_projects" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Config.GetProjectsRequest :> Post '[PBJSON, JSON] Monocle.Protob.Config.GetProjectsResponse
    :<|> "get_groups" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Config.GetGroupsRequest :> Post '[PBJSON, JSON] Monocle.Protob.Config.GetGroupsResponse
    :<|> "get_group_members" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Config.GetGroupMembersRequest :> Post '[PBJSON, JSON] Monocle.Protob.Config.GetGroupMembersResponse
    :<|> "about" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Config.GetAboutRequest :> Post '[PBJSON, JSON] Monocle.Protob.Config.GetAboutResponse
    :<|> "suggestions" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Search.SuggestionsRequest :> Post '[PBJSON, JSON] Monocle.Protob.Search.SuggestionsResponse
    :<|> "search" :> "fields" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Search.FieldsRequest :> Post '[PBJSON, JSON] Monocle.Protob.Search.FieldsResponse
    :<|> "search" :> "check" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Search.CheckRequest :> Post '[PBJSON, JSON] Monocle.Protob.Search.CheckResponse
    :<|> "search" :> "query" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Search.QueryRequest :> Post '[PBJSON, JSON] Monocle.Protob.Search.QueryResponse
    :<|> "search" :> "author" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Search.AuthorRequest :> Post '[PBJSON, JSON] Monocle.Protob.Search.AuthorResponse
    :<|> "metric" :> "list" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Metric.ListRequest :> Post '[PBJSON, JSON] Monocle.Protob.Metric.ListResponse
    :<|> "metric" :> "get" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Metric.GetRequest :> Post '[PBJSON, JSON] Monocle.Protob.Metric.GetResponse
    :<|> "crawler" :> "add" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Crawler.AddDocRequest :> Post '[PBJSON, JSON] Monocle.Protob.Crawler.AddDocResponse
    :<|> "crawler" :> "commit" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Crawler.CommitRequest :> Post '[PBJSON, JSON] Monocle.Protob.Crawler.CommitResponse
    :<|> "crawler" :> "get_commit_info" :> Auth '[JWT, Cookie] AuthenticatedUser :> ReqBody '[JSON] Monocle.Protob.Crawler.CommitInfoRequest :> Post '[PBJSON, JSON] Monocle.Protob.Crawler.CommitInfoResponse
    :<|> "auth" :> "login" :> Get '[JSON] NoContent
    :<|> "auth" :> "cb" :> QueryParam "error" Text :> QueryParam "code" Text :> Get '[HTML] User

server :: Maybe OIDCEnv -> ServerT MonocleAPI AppM
server oidcEnv =
  loginLoginValidation
    :<|> authGetMagicJwt
    :<|> authWhoAmi
    :<|> configGetWorkspaces
    :<|> configGetProjects
    :<|> configGetGroups
    :<|> configGetGroupMembers
    :<|> configGetAbout
    :<|> searchSuggestions
    :<|> searchFields
    :<|> searchCheck
    :<|> searchQuery
    :<|> searchAuthor
    :<|> metricList
    :<|> metricGet
    :<|> crawlerAddDoc
    :<|> crawlerCommit
    :<|> crawlerCommitInfo
    :<|> handleLogin oidcEnv
    :<|> handleLoggedIn oidcEnv handleOIDCLogin
