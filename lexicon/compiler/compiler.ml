(* open Blueskaml.Types *)
open Blueskaml_base.Utils
open Blueskaml_lexicon

let files = {|
_lexicons/app/bsky/embed/record.json
_lexicons/app/bsky/embed/images.json
_lexicons/app/bsky/embed/recordWithMedia.json
_lexicons/app/bsky/embed/external.json
_lexicons/app/bsky/notification/updateSeen.json
_lexicons/app/bsky/notification/listNotifications.json
_lexicons/app/bsky/notification/getUnreadCount.json
_lexicons/app/bsky/unspecced/getPopular.json
_lexicons/app/bsky/unspecced/getPopularFeedGenerators.json
_lexicons/app/bsky/unspecced/getTimelineSkeleton.json
_lexicons/app/bsky/graph/block.json
_lexicons/app/bsky/graph/follow.json
_lexicons/app/bsky/graph/defs.json
_lexicons/app/bsky/graph/unmuteActorList.json
_lexicons/app/bsky/graph/muteActorList.json
_lexicons/app/bsky/graph/getLists.json
_lexicons/app/bsky/graph/getFollowers.json
_lexicons/app/bsky/graph/muteActor.json
_lexicons/app/bsky/graph/getMutes.json
_lexicons/app/bsky/graph/listitem.json
_lexicons/app/bsky/graph/list.json
_lexicons/app/bsky/graph/getListMutes.json
_lexicons/app/bsky/graph/getFollows.json
_lexicons/app/bsky/graph/getBlocks.json
_lexicons/app/bsky/graph/unmuteActor.json
_lexicons/app/bsky/graph/getList.json
_lexicons/app/bsky/feed/generator.json
_lexicons/app/bsky/feed/defs.json
_lexicons/app/bsky/feed/getFeedGenerators.json
_lexicons/app/bsky/feed/getTimeline.json
_lexicons/app/bsky/feed/getFeedGenerator.json
_lexicons/app/bsky/feed/getAuthorFeed.json
_lexicons/app/bsky/feed/getLikes.json
_lexicons/app/bsky/feed/getPostThread.json
_lexicons/app/bsky/feed/like.json
_lexicons/app/bsky/feed/getRepostedBy.json
_lexicons/app/bsky/feed/repost.json
_lexicons/app/bsky/feed/describeFeedGenerator.json
_lexicons/app/bsky/feed/getPosts.json
_lexicons/app/bsky/feed/getFeed.json
_lexicons/app/bsky/feed/getFeedSkeleton.json
_lexicons/app/bsky/feed/getActorFeeds.json
_lexicons/app/bsky/feed/post.json
_lexicons/app/bsky/richtext/facet.json
_lexicons/app/bsky/actor/searchActorsTypeahead.json
_lexicons/app/bsky/actor/defs.json
_lexicons/app/bsky/actor/putPreferences.json
_lexicons/app/bsky/actor/getProfile.json
_lexicons/app/bsky/actor/getSuggestions.json
_lexicons/app/bsky/actor/searchActors.json
_lexicons/app/bsky/actor/getProfiles.json
_lexicons/app/bsky/actor/getPreferences.json
_lexicons/app/bsky/actor/profile.json
_lexicons/com/atproto/identity/updateHandle.json
_lexicons/com/atproto/identity/resolveHandle.json
_lexicons/com/atproto/admin/getRepo.json
_lexicons/com/atproto/admin/getModerationReports.json
_lexicons/com/atproto/admin/takeModerationAction.json
_lexicons/com/atproto/admin/updateAccountEmail.json
_lexicons/com/atproto/admin/defs.json
_lexicons/com/atproto/admin/rebaseRepo.json
_lexicons/com/atproto/admin/getModerationAction.json
_lexicons/com/atproto/admin/updateAccountHandle.json
_lexicons/com/atproto/admin/getInviteCodes.json
_lexicons/com/atproto/admin/enableAccountInvites.json
_lexicons/com/atproto/admin/getModerationReport.json
_lexicons/com/atproto/admin/disableAccountInvites.json
_lexicons/com/atproto/admin/disableInviteCodes.json
_lexicons/com/atproto/admin/reverseModerationAction.json
_lexicons/com/atproto/admin/getRecord.json
_lexicons/com/atproto/admin/resolveModerationReports.json
_lexicons/com/atproto/admin/searchRepos.json
_lexicons/com/atproto/admin/getModerationActions.json
_lexicons/com/atproto/label/subscribeLabels.json
_lexicons/com/atproto/label/defs.json
_lexicons/com/atproto/label/queryLabels.json
_lexicons/com/atproto/server/defs.json
_lexicons/com/atproto/server/getAccountInviteCodes.json
_lexicons/com/atproto/server/createSession.json
_lexicons/com/atproto/server/listAppPasswords.json
_lexicons/com/atproto/server/createInviteCodes.json
_lexicons/com/atproto/server/deleteSession.json
_lexicons/com/atproto/server/revokeAppPassword.json
_lexicons/com/atproto/server/createAppPassword.json
_lexicons/com/atproto/server/describeServer.json
_lexicons/com/atproto/server/getSession.json
_lexicons/com/atproto/server/refreshSession.json
_lexicons/com/atproto/server/resetPassword.json
_lexicons/com/atproto/server/requestPasswordReset.json
_lexicons/com/atproto/server/requestAccountDelete.json
_lexicons/com/atproto/server/createAccount.json
_lexicons/com/atproto/server/deleteAccount.json
_lexicons/com/atproto/server/createInviteCode.json
_lexicons/com/atproto/sync/getHead.json
_lexicons/com/atproto/sync/getBlob.json
_lexicons/com/atproto/sync/getRepo.json
_lexicons/com/atproto/sync/notifyOfUpdate.json
_lexicons/com/atproto/sync/requestCrawl.json
_lexicons/com/atproto/sync/listBlobs.json
_lexicons/com/atproto/sync/subscribeRepos.json
_lexicons/com/atproto/sync/getRecord.json
_lexicons/com/atproto/sync/listRepos.json
_lexicons/com/atproto/sync/getCommitPath.json
_lexicons/com/atproto/sync/getBlocks.json
_lexicons/com/atproto/sync/getCheckout.json
_lexicons/com/atproto/repo/strongRef.json
_lexicons/com/atproto/repo/createRecord.json
_lexicons/com/atproto/repo/deleteRecord.json
_lexicons/com/atproto/repo/putRecord.json
_lexicons/com/atproto/repo/rebaseRepo.json
_lexicons/com/atproto/repo/uploadBlob.json
_lexicons/com/atproto/repo/describeRepo.json
_lexicons/com/atproto/repo/getRecord.json
_lexicons/com/atproto/repo/applyWrites.json
_lexicons/com/atproto/repo/listRecords.json
_lexicons/com/atproto/moderation/defs.json
_lexicons/com/atproto/moderation/createReport.json
|}


let files =
  List.filter (function "" -> false | _ -> true)
  @@ String.split_on_char '\n' files

let lexicons = Compile.load_lexicons files

let pdefs = List.concat_map Compile.defs_of_lexicon lexicons

let typedecls = Compile.typedecls_of_defs pdefs

let sccs = Types2.build_graph typedecls

let () =
  let oc = open_out "../../src/lexicon.ml" in
  let ppf = Format.formatter_of_out_channel oc in
  Compile.pp_typedefs ppf sccs;
  Compile.pp_converters ppf sccs;
  close_out oc

let xrpcs = Compile.xrpcs_of_defs pdefs

let () =
  let oc = open_out "../../src/xrpc.ml" in
  let ppf = Format.formatter_of_out_channel oc in
  Compile.pp_xrpcs ppf xrpcs;
  close_out oc
