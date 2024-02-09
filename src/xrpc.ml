include Xrpc_base
open Bsky_ml_base.Types
open Lexicon

      module Atproto = struct
module Admin = struct
module GetRepo =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.admin.getRepo"
            type parameters = admin_getRepo_parameters[@@deriving yojson]
            type output = admin_repoViewDetail[@@deriving yojson]
          end)
module UpdateAccountEmail =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.admin.updateAccountEmail"
                type input = admin_updateAccountEmail_input[@@deriving
                                                             yojson]
                type output = unit[@@deriving yojson]
              end)
module GetAccountInfo =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "com.atproto.admin.getAccountInfo"
            type parameters = admin_getAccountInfo_parameters[@@deriving
                                                               yojson]
            type output = admin_accountView[@@deriving yojson]
          end)
module GetSubjectStatus =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "com.atproto.admin.getSubjectStatus"
            type parameters = admin_getSubjectStatus_parameters[@@deriving
                                                                 yojson]
            type output = admin_getSubjectStatus_output[@@deriving yojson]
          end)
module ListCommunicationTemplates =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string
                "com.atproto.admin.listCommunicationTemplates"
            type parameters = unit[@@deriving yojson]
            type output = admin_listCommunicationTemplates_output[@@deriving
                                                                   yojson]
          end)
module CreateCommunicationTemplate =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.admin.createCommunicationTemplate"
                type input = admin_createCommunicationTemplate_input[@@deriving
                                                                    yojson]
                type output = admin_communicationTemplateView[@@deriving
                                                               yojson]
              end)
module QueryModerationStatuses =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string
                "com.atproto.admin.queryModerationStatuses"
            type parameters = admin_queryModerationStatuses_parameters
            [@@deriving yojson]
            type output = admin_queryModerationStatuses_output[@@deriving
                                                                yojson]
          end)
module DeleteCommunicationTemplate =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.admin.deleteCommunicationTemplate"
                type input = admin_deleteCommunicationTemplate_input[@@deriving
                                                                    yojson]
                type output = unit[@@deriving yojson]
              end)
module UpdateAccountHandle =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.admin.updateAccountHandle"
                type input = admin_updateAccountHandle_input[@@deriving
                                                              yojson]
                type output = unit[@@deriving yojson]
              end)
module GetInviteCodes =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "com.atproto.admin.getInviteCodes"
            type parameters = admin_getInviteCodes_parameters[@@deriving
                                                               yojson]
            type output = admin_getInviteCodes_output[@@deriving yojson]
          end)
module UpdateCommunicationTemplate =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.admin.updateCommunicationTemplate"
                type input = admin_updateCommunicationTemplate_input[@@deriving
                                                                    yojson]
                type output = admin_communicationTemplateView[@@deriving
                                                               yojson]
              end)
module EnableAccountInvites =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.admin.enableAccountInvites"
                type input = admin_enableAccountInvites_input[@@deriving
                                                               yojson]
                type output = unit[@@deriving yojson]
              end)
module DisableAccountInvites =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.admin.disableAccountInvites"
                type input = admin_disableAccountInvites_input[@@deriving
                                                                yojson]
                type output = unit[@@deriving yojson]
              end)
module DisableInviteCodes =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.admin.disableInviteCodes"
                type input = admin_disableInviteCodes_input[@@deriving
                                                             yojson]
                type output = unit[@@deriving yojson]
              end)
module UpdateSubjectStatus =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.admin.updateSubjectStatus"
                type input = admin_updateSubjectStatus_input[@@deriving
                                                              yojson]
                type output = admin_updateSubjectStatus_output[@@deriving
                                                                yojson]
              end)
module EmitModerationEvent =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.admin.emitModerationEvent"
                type input = admin_emitModerationEvent_input[@@deriving
                                                              yojson]
                type output = admin_modEventView[@@deriving yojson]
              end)
module GetModerationEvent =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "com.atproto.admin.getModerationEvent"
            type parameters = admin_getModerationEvent_parameters[@@deriving
                                                                   yojson]
            type output = admin_modEventViewDetail[@@deriving yojson]
          end)
module GetRecord =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.admin.getRecord"
            type parameters = admin_getRecord_parameters[@@deriving yojson]
            type output = admin_recordViewDetail[@@deriving yojson]
          end)
module QueryModerationEvents =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "com.atproto.admin.queryModerationEvents"
            type parameters = admin_queryModerationEvents_parameters[@@deriving
                                                                    yojson]
            type output = admin_queryModerationEvents_output[@@deriving
                                                              yojson]
          end)
module SendEmail =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.admin.sendEmail"
                type input = admin_sendEmail_input[@@deriving yojson]
                type output = admin_sendEmail_output[@@deriving yojson]
              end)
module SearchRepos =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.admin.searchRepos"
            type parameters = admin_searchRepos_parameters[@@deriving yojson]
            type output = admin_searchRepos_output[@@deriving yojson]
          end)
module GetAccountInfos =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "com.atproto.admin.getAccountInfos"
            type parameters = admin_getAccountInfos_parameters[@@deriving
                                                                yojson]
            type output = admin_getAccountInfos_output[@@deriving yojson]
          end)
module DeleteAccount =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.admin.deleteAccount"
                type input = admin_deleteAccount_input[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
end
module Identity = struct
module UpdateHandle =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.identity.updateHandle"
                type input = identity_updateHandle_input[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module ResolveHandle =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "com.atproto.identity.resolveHandle"
            type parameters = identity_resolveHandle_parameters[@@deriving
                                                                 yojson]
            type output = identity_resolveHandle_output[@@deriving yojson]
          end)
end
module Label = struct
module QueryLabels =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.label.queryLabels"
            type parameters = label_queryLabels_parameters[@@deriving yojson]
            type output = label_queryLabels_output[@@deriving yojson]
          end)
end
module Moderation = struct
module CreateReport =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.moderation.createReport"
                type input = moderation_createReport_input[@@deriving yojson]
                type output = moderation_createReport_output[@@deriving
                                                              yojson]
              end)
end
module Repo = struct
module CreateRecord =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.repo.createRecord"
                type input = repo_createRecord_input[@@deriving yojson]
                type output = repo_createRecord_output[@@deriving yojson]
              end)
module DeleteRecord =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.repo.deleteRecord"
                type input = repo_deleteRecord_input[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module PutRecord =
  (Procedure)(struct
                let nsid = Nsid.unsafe_of_string "com.atproto.repo.putRecord"
                type input = repo_putRecord_input[@@deriving yojson]
                type output = repo_putRecord_output[@@deriving yojson]
              end)
module UploadBlob =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.repo.uploadBlob"
                type input = unit[@@deriving yojson]
                type output = repo_uploadBlob_output[@@deriving yojson]
              end)
module DescribeRepo =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.repo.describeRepo"
            type parameters = repo_describeRepo_parameters[@@deriving yojson]
            type output = repo_describeRepo_output[@@deriving yojson]
          end)
module GetRecord =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.repo.getRecord"
            type parameters = repo_getRecord_parameters[@@deriving yojson]
            type output = repo_getRecord_output[@@deriving yojson]
          end)
module ApplyWrites =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.repo.applyWrites"
                type input = repo_applyWrites_input[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module ListRecords =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.repo.listRecords"
            type parameters = repo_listRecords_parameters[@@deriving yojson]
            type output = repo_listRecords_output[@@deriving yojson]
          end)
end
module Server = struct
module RequestEmailConfirmation =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.server.requestEmailConfirmation"
                type input = unit[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module ReserveSigningKey =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.server.reserveSigningKey"
                type input = server_reserveSigningKey_input[@@deriving
                                                             yojson]
                type output = server_reserveSigningKey_output[@@deriving
                                                               yojson]
              end)
module GetAccountInviteCodes =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string
                "com.atproto.server.getAccountInviteCodes"
            type parameters = server_getAccountInviteCodes_parameters
            [@@deriving yojson]
            type output = server_getAccountInviteCodes_output[@@deriving
                                                               yojson]
          end)
module CreateSession =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.server.createSession"
                type input = server_createSession_input[@@deriving yojson]
                type output = server_createSession_output[@@deriving yojson]
              end)
module ListAppPasswords =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "com.atproto.server.listAppPasswords"
            type parameters = unit[@@deriving yojson]
            type output = server_listAppPasswords_output[@@deriving yojson]
          end)
module CreateInviteCodes =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.server.createInviteCodes"
                type input = server_createInviteCodes_input[@@deriving
                                                             yojson]
                type output = server_createInviteCodes_output[@@deriving
                                                               yojson]
              end)
module DeleteSession =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.server.deleteSession"
                type input = unit[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module RevokeAppPassword =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.server.revokeAppPassword"
                type input = server_revokeAppPassword_input[@@deriving
                                                             yojson]
                type output = unit[@@deriving yojson]
              end)
module CreateAppPassword =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.server.createAppPassword"
                type input = server_createAppPassword_input[@@deriving
                                                             yojson]
                type output = server_createAppPassword_appPassword[@@deriving
                                                                    yojson]
              end)
module DescribeServer =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "com.atproto.server.describeServer"
            type parameters = unit[@@deriving yojson]
            type output = server_describeServer_output[@@deriving yojson]
          end)
module ConfirmEmail =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.server.confirmEmail"
                type input = server_confirmEmail_input[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module GetSession =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.server.getSession"
            type parameters = unit[@@deriving yojson]
            type output = server_getSession_output[@@deriving yojson]
          end)
module RefreshSession =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.server.refreshSession"
                type input = unit[@@deriving yojson]
                type output = server_refreshSession_output[@@deriving yojson]
              end)
module UpdateEmail =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.server.updateEmail"
                type input = server_updateEmail_input[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module ResetPassword =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.server.resetPassword"
                type input = server_resetPassword_input[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module RequestEmailUpdate =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.server.requestEmailUpdate"
                type input = unit[@@deriving yojson]
                type output = server_requestEmailUpdate_output[@@deriving
                                                                yojson]
              end)
module RequestPasswordReset =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.server.requestPasswordReset"
                type input = server_requestPasswordReset_input[@@deriving
                                                                yojson]
                type output = unit[@@deriving yojson]
              end)
module RequestAccountDelete =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.server.requestAccountDelete"
                type input = unit[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module CreateAccount =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.server.createAccount"
                type input = server_createAccount_input[@@deriving yojson]
                type output = server_createAccount_output[@@deriving yojson]
              end)
module DeleteAccount =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.server.deleteAccount"
                type input = server_deleteAccount_input[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module CreateInviteCode =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.server.createInviteCode"
                type input = server_createInviteCode_input[@@deriving yojson]
                type output = server_createInviteCode_output[@@deriving
                                                              yojson]
              end)
end
module Sync = struct
module GetHead =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.sync.getHead"
            type parameters = sync_getHead_parameters[@@deriving yojson]
            type output = sync_getHead_output[@@deriving yojson]
          end)
module GetBlob =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.sync.getBlob"
            type parameters = sync_getBlob_parameters[@@deriving yojson]
            type output = unit[@@deriving yojson]
          end)
module GetRepo =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.sync.getRepo"
            type parameters = sync_getRepo_parameters[@@deriving yojson]
            type output = unit[@@deriving yojson]
          end)
module NotifyOfUpdate =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.sync.notifyOfUpdate"
                type input = sync_notifyOfUpdate_input[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module RequestCrawl =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.sync.requestCrawl"
                type input = sync_requestCrawl_input[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module ListBlobs =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.sync.listBlobs"
            type parameters = sync_listBlobs_parameters[@@deriving yojson]
            type output = sync_listBlobs_output[@@deriving yojson]
          end)
module GetLatestCommit =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "com.atproto.sync.getLatestCommit"
            type parameters = sync_getLatestCommit_parameters[@@deriving
                                                               yojson]
            type output = sync_getLatestCommit_output[@@deriving yojson]
          end)
module GetRecord =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.sync.getRecord"
            type parameters = sync_getRecord_parameters[@@deriving yojson]
            type output = unit[@@deriving yojson]
          end)
module ListRepos =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.sync.listRepos"
            type parameters = sync_listRepos_parameters[@@deriving yojson]
            type output = sync_listRepos_output[@@deriving yojson]
          end)
module GetBlocks =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.sync.getBlocks"
            type parameters = sync_getBlocks_parameters[@@deriving yojson]
            type output = unit[@@deriving yojson]
          end)
module GetCheckout =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.sync.getCheckout"
            type parameters = sync_getCheckout_parameters[@@deriving yojson]
            type output = unit[@@deriving yojson]
          end)
end
module Temp = struct
module TransferAccount =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.temp.transferAccount"
                type input = temp_transferAccount_input[@@deriving yojson]
                type output = temp_transferAccount_output[@@deriving yojson]
              end)
module PushBlob =
  (Procedure)(struct
                let nsid = Nsid.unsafe_of_string "com.atproto.temp.pushBlob"
                type input = unit[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module CheckSignupQueue =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "com.atproto.temp.checkSignupQueue"
            type parameters = unit[@@deriving yojson]
            type output = temp_checkSignupQueue_output[@@deriving yojson]
          end)
module ImportRepo =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "com.atproto.temp.importRepo"
                type input = unit[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module RequestPhoneVerification =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string
                    "com.atproto.temp.requestPhoneVerification"
                type input = temp_requestPhoneVerification_input[@@deriving
                                                                  yojson]
                type output = unit[@@deriving yojson]
              end)
module FetchLabels =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "com.atproto.temp.fetchLabels"
            type parameters = temp_fetchLabels_parameters[@@deriving yojson]
            type output = temp_fetchLabels_output[@@deriving yojson]
          end)
end
end
module Bsky = struct
module Actor = struct
module SearchActorsTypeahead =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "app.bsky.actor.searchActorsTypeahead"
            type parameters = actor_searchActorsTypeahead_parameters[@@deriving
                                                                    yojson]
            type output = actor_searchActorsTypeahead_output[@@deriving
                                                              yojson]
          end)
module PutPreferences =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "app.bsky.actor.putPreferences"
                type input = actor_putPreferences_input[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module GetProfile =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.actor.getProfile"
            type parameters = actor_getProfile_parameters[@@deriving yojson]
            type output = actor_profileViewDetailed[@@deriving yojson]
          end)
module GetSuggestions =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.actor.getSuggestions"
            type parameters = actor_getSuggestions_parameters[@@deriving
                                                               yojson]
            type output = actor_getSuggestions_output[@@deriving yojson]
          end)
module SearchActors =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.actor.searchActors"
            type parameters = actor_searchActors_parameters[@@deriving
                                                             yojson]
            type output = actor_searchActors_output[@@deriving yojson]
          end)
module GetProfiles =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.actor.getProfiles"
            type parameters = actor_getProfiles_parameters[@@deriving yojson]
            type output = actor_getProfiles_output[@@deriving yojson]
          end)
module GetPreferences =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.actor.getPreferences"
            type parameters = actor_getPreferences_parameters[@@deriving
                                                               yojson]
            type output = actor_getPreferences_output[@@deriving yojson]
          end)
end
module Feed = struct
module GetFeedGenerators =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "app.bsky.feed.getFeedGenerators"
            type parameters = feed_getFeedGenerators_parameters[@@deriving
                                                                 yojson]
            type output = feed_getFeedGenerators_output[@@deriving yojson]
          end)
module GetTimeline =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.feed.getTimeline"
            type parameters = feed_getTimeline_parameters[@@deriving yojson]
            type output = feed_getTimeline_output[@@deriving yojson]
          end)
module GetFeedGenerator =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.feed.getFeedGenerator"
            type parameters = feed_getFeedGenerator_parameters[@@deriving
                                                                yojson]
            type output = feed_getFeedGenerator_output[@@deriving yojson]
          end)
module GetAuthorFeed =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.feed.getAuthorFeed"
            type parameters = feed_getAuthorFeed_parameters[@@deriving
                                                             yojson]
            type output = feed_getAuthorFeed_output[@@deriving yojson]
          end)
module GetLikes =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.feed.getLikes"
            type parameters = feed_getLikes_parameters[@@deriving yojson]
            type output = feed_getLikes_output[@@deriving yojson]
          end)
module GetPostThread =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.feed.getPostThread"
            type parameters = feed_getPostThread_parameters[@@deriving
                                                             yojson]
            type output = feed_getPostThread_output[@@deriving yojson]
          end)
module GetActorLikes =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.feed.getActorLikes"
            type parameters = feed_getActorLikes_parameters[@@deriving
                                                             yojson]
            type output = feed_getActorLikes_output[@@deriving yojson]
          end)
module GetRepostedBy =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.feed.getRepostedBy"
            type parameters = feed_getRepostedBy_parameters[@@deriving
                                                             yojson]
            type output = feed_getRepostedBy_output[@@deriving yojson]
          end)
module DescribeFeedGenerator =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "app.bsky.feed.describeFeedGenerator"
            type parameters = unit[@@deriving yojson]
            type output = feed_describeFeedGenerator_output[@@deriving
                                                             yojson]
          end)
module SearchPosts =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.feed.searchPosts"
            type parameters = feed_searchPosts_parameters[@@deriving yojson]
            type output = feed_searchPosts_output[@@deriving yojson]
          end)
module GetPosts =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.feed.getPosts"
            type parameters = feed_getPosts_parameters[@@deriving yojson]
            type output = feed_getPosts_output[@@deriving yojson]
          end)
module GetFeed =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.feed.getFeed"
            type parameters = feed_getFeed_parameters[@@deriving yojson]
            type output = feed_getFeed_output[@@deriving yojson]
          end)
module GetFeedSkeleton =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.feed.getFeedSkeleton"
            type parameters = feed_getFeedSkeleton_parameters[@@deriving
                                                               yojson]
            type output = feed_getFeedSkeleton_output[@@deriving yojson]
          end)
module GetListFeed =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.feed.getListFeed"
            type parameters = feed_getListFeed_parameters[@@deriving yojson]
            type output = feed_getListFeed_output[@@deriving yojson]
          end)
module GetSuggestedFeeds =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "app.bsky.feed.getSuggestedFeeds"
            type parameters = feed_getSuggestedFeeds_parameters[@@deriving
                                                                 yojson]
            type output = feed_getSuggestedFeeds_output[@@deriving yojson]
          end)
module GetActorFeeds =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.feed.getActorFeeds"
            type parameters = feed_getActorFeeds_parameters[@@deriving
                                                             yojson]
            type output = feed_getActorFeeds_output[@@deriving yojson]
          end)
end
module Graph = struct
module GetSuggestedFollowsByActor =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string
                "app.bsky.graph.getSuggestedFollowsByActor"
            type parameters = graph_getSuggestedFollowsByActor_parameters
            [@@deriving yojson]
            type output = graph_getSuggestedFollowsByActor_output[@@deriving
                                                                   yojson]
          end)
module UnmuteActorList =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "app.bsky.graph.unmuteActorList"
                type input = graph_unmuteActorList_input[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module GetListBlocks =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.graph.getListBlocks"
            type parameters = graph_getListBlocks_parameters[@@deriving
                                                              yojson]
            type output = graph_getListBlocks_output[@@deriving yojson]
          end)
module MuteActorList =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "app.bsky.graph.muteActorList"
                type input = graph_muteActorList_input[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module GetLists =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.graph.getLists"
            type parameters = graph_getLists_parameters[@@deriving yojson]
            type output = graph_getLists_output[@@deriving yojson]
          end)
module GetFollowers =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.graph.getFollowers"
            type parameters = graph_getFollowers_parameters[@@deriving
                                                             yojson]
            type output = graph_getFollowers_output[@@deriving yojson]
          end)
module MuteActor =
  (Procedure)(struct
                let nsid = Nsid.unsafe_of_string "app.bsky.graph.muteActor"
                type input = graph_muteActor_input[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module GetMutes =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.graph.getMutes"
            type parameters = graph_getMutes_parameters[@@deriving yojson]
            type output = graph_getMutes_output[@@deriving yojson]
          end)
module GetListMutes =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.graph.getListMutes"
            type parameters = graph_getListMutes_parameters[@@deriving
                                                             yojson]
            type output = graph_getListMutes_output[@@deriving yojson]
          end)
module GetFollows =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.graph.getFollows"
            type parameters = graph_getFollows_parameters[@@deriving yojson]
            type output = graph_getFollows_output[@@deriving yojson]
          end)
module GetBlocks =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.graph.getBlocks"
            type parameters = graph_getBlocks_parameters[@@deriving yojson]
            type output = graph_getBlocks_output[@@deriving yojson]
          end)
module GetRelationships =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "app.bsky.graph.getRelationships"
            type parameters = graph_getRelationships_parameters[@@deriving
                                                                 yojson]
            type output = graph_getRelationships_output[@@deriving yojson]
          end)
module UnmuteActor =
  (Procedure)(struct
                let nsid = Nsid.unsafe_of_string "app.bsky.graph.unmuteActor"
                type input = graph_unmuteActor_input[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module GetList =
  (Query)(struct
            let nsid = Nsid.unsafe_of_string "app.bsky.graph.getList"
            type parameters = graph_getList_parameters[@@deriving yojson]
            type output = graph_getList_output[@@deriving yojson]
          end)
end
module Notification = struct
module RegisterPush =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "app.bsky.notification.registerPush"
                type input = notification_registerPush_input[@@deriving
                                                              yojson]
                type output = unit[@@deriving yojson]
              end)
module UpdateSeen =
  (Procedure)(struct
                let nsid =
                  Nsid.unsafe_of_string "app.bsky.notification.updateSeen"
                type input = notification_updateSeen_input[@@deriving yojson]
                type output = unit[@@deriving yojson]
              end)
module ListNotifications =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "app.bsky.notification.listNotifications"
            type parameters = notification_listNotifications_parameters
            [@@deriving yojson]
            type output = notification_listNotifications_output[@@deriving
                                                                 yojson]
          end)
module GetUnreadCount =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "app.bsky.notification.getUnreadCount"
            type parameters = notification_getUnreadCount_parameters[@@deriving
                                                                    yojson]
            type output = notification_getUnreadCount_output[@@deriving
                                                              yojson]
          end)
end
module Unspecced = struct
module SearchActorsSkeleton =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "app.bsky.unspecced.searchActorsSkeleton"
            type parameters = unspecced_searchActorsSkeleton_parameters
            [@@deriving yojson]
            type output = unspecced_searchActorsSkeleton_output[@@deriving
                                                                 yojson]
          end)
module SearchPostsSkeleton =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "app.bsky.unspecced.searchPostsSkeleton"
            type parameters = unspecced_searchPostsSkeleton_parameters
            [@@deriving yojson]
            type output = unspecced_searchPostsSkeleton_output[@@deriving
                                                                yojson]
          end)
module GetPopularFeedGenerators =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string
                "app.bsky.unspecced.getPopularFeedGenerators"
            type parameters = unspecced_getPopularFeedGenerators_parameters
            [@@deriving yojson]
            type output = unspecced_getPopularFeedGenerators_output[@@deriving
                                                                    yojson]
          end)
module GetTaggedSuggestions =
  (Query)(struct
            let nsid =
              Nsid.unsafe_of_string "app.bsky.unspecced.getTaggedSuggestions"
            type parameters = unspecced_getTaggedSuggestions_parameters
            [@@deriving yojson]
            type output = unspecced_getTaggedSuggestions_output[@@deriving
                                                                 yojson]
          end)
end
end
