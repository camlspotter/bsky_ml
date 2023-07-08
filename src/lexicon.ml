type unknown = Yojson.Safe.t

type blob = bytes

type cid_link = string

type 'a nullable = 'a option

(*
  path: app.bsky.actor.defs#adultContentPref;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.defs",
            "names": [ "adultContentPref" ]
          },
          "description": null,
          "fields": [
            {
              "key": "enabled",
              "ocaml_key": "enabled",
              "optional": false,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": false, "const": null }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type actor_adultContentPref = {enabled : bool}

(*
  path: app.bsky.actor.defs#contentLabelPref;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.defs",
            "names": [ "contentLabelPref" ]
          },
          "description": null,
          "fields": [
            {
              "key": "label",
              "ocaml_key": "label",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "visibility",
              "ocaml_key": "visibility",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": [ "show", "warn", "hide" ],
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type actor_contentLabelPref = {label : string; visibility : string}

(*
  path: at-uri;
  ty: [
        "Alias",
        {
          "path": { "nsid": "at-uri", "names": [] },
          "ty": [
            "Format",
            {
              "format": "at-uri",
              "description": null,
              "knownValues": null,
              "minLength": null,
              "maxLength": null,
              "maxGraphemes": null,
              "default": null
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type at_uri = string

(*
  path: app.bsky.actor.defs#savedFeedsPref;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.defs",
            "names": [ "savedFeedsPref" ]
          },
          "description": null,
          "fields": [
            {
              "key": "pinned",
              "ocaml_key": "pinned",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.actor.defs",
                    "names": [ "savedFeedsPref", "pinned" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Format",
                    {
                      "format": "at-uri",
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "saved",
              "ocaml_key": "saved",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.actor.defs",
                    "names": [ "savedFeedsPref", "saved" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Format",
                    {
                      "format": "at-uri",
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type actor_savedFeedsPref = {pinned : at_uri list; saved : at_uri list}

(*
  path: app.bsky.actor.defs#preferences/item;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "app.bsky.actor.defs",
            "names": [ "preferences", "item" ]
          },
          "constrs": [
            {
              "ocaml_name": "AdultContentPref",
              "path": {
                "nsid": "app.bsky.actor.defs",
                "names": [ "adultContentPref" ]
              }
            },
            {
              "ocaml_name": "ContentLabelPref",
              "path": {
                "nsid": "app.bsky.actor.defs",
                "names": [ "contentLabelPref" ]
              }
            },
            {
              "ocaml_name": "SavedFeedsPref",
              "path": {
                "nsid": "app.bsky.actor.defs",
                "names": [ "savedFeedsPref" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            {
              "nsid": "app.bsky.actor.defs",
              "names": [ "adultContentPref" ]
            },
            {
              "nsid": "app.bsky.actor.defs",
              "names": [ "contentLabelPref" ]
            },
            { "nsid": "app.bsky.actor.defs", "names": [ "savedFeedsPref" ] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#adultContentPref;
        app.bsky.actor.defs#contentLabelPref;
        app.bsky.actor.defs#savedFeedsPref;
*)
type actor_preferences_item =
  | AdultContentPref of actor_adultContentPref
  | ContentLabelPref of actor_contentLabelPref
  | SavedFeedsPref of actor_savedFeedsPref

(*
  path: app.bsky.actor.defs#preferences;
  ty: [
        "Alias",
        {
          "path": {
            "nsid": "app.bsky.actor.defs",
            "names": [ "preferences" ]
          },
          "ty": [
            "Array",
            {
              "path": {
                "nsid": "app.bsky.actor.defs",
                "names": [ "preferences" ]
              },
              "description": null,
              "maxLength": null,
              "items": [
                "Ref",
                {
                  "nsid": "app.bsky.actor.defs",
                  "names": [ "preferences", "item" ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "app.bsky.actor.defs",
              "names": [ "preferences", "item" ]
            }
          ]
        }
      ];
  deps: app.bsky.actor.defs#preferences/item;
*)
type actor_preferences = actor_preferences_item list

(*
  path: handle;
  ty: [
        "Alias",
        {
          "path": { "nsid": "handle", "names": [] },
          "ty": [
            "Format",
            {
              "format": "handle",
              "description": null,
              "knownValues": null,
              "minLength": null,
              "maxLength": null,
              "maxGraphemes": null,
              "default": null
            }
          ],
          "deps": [ { "nsid": "handle", "names": [] } ]
        }
      ];
  deps: handle;
*)
type handle = string

(*
  path: did;
  ty: [
        "Alias",
        {
          "path": { "nsid": "did", "names": [] },
          "ty": [
            "Format",
            {
              "format": "did",
              "description": null,
              "knownValues": null,
              "minLength": null,
              "maxLength": null,
              "maxGraphemes": null,
              "default": null
            }
          ],
          "deps": [ { "nsid": "did", "names": [] } ]
        }
      ];
  deps: did;
*)
type did = string

(*
  path: datetime;
  ty: [
        "Alias",
        {
          "path": { "nsid": "datetime", "names": [] },
          "ty": [
            "Format",
            {
              "format": "datetime",
              "description": null,
              "knownValues": null,
              "minLength": null,
              "maxLength": null,
              "maxGraphemes": null,
              "default": null
            }
          ],
          "deps": [ { "nsid": "datetime", "names": [] } ]
        }
      ];
  deps: datetime;
*)
type datetime = string

(*
  path: uri;
  ty: [
        "Alias",
        {
          "path": { "nsid": "uri", "names": [] },
          "ty": [
            "Format",
            {
              "format": "uri",
              "description": null,
              "knownValues": null,
              "minLength": null,
              "maxLength": null,
              "maxGraphemes": null,
              "default": null
            }
          ],
          "deps": [ { "nsid": "uri", "names": [] } ]
        }
      ];
  deps: uri;
*)
type uri = string

(*
  path: cid;
  ty: [
        "Alias",
        {
          "path": { "nsid": "cid", "names": [] },
          "ty": [
            "Format",
            {
              "format": "cid",
              "description": null,
              "knownValues": null,
              "minLength": null,
              "maxLength": null,
              "maxGraphemes": null,
              "default": null
            }
          ],
          "deps": [ { "nsid": "cid", "names": [] } ]
        }
      ];
  deps: cid;
*)
type cid = string

(*
  path: com.atproto.label.defs#label;
  ty: [
        "Object",
        {
          "path": { "nsid": "com.atproto.label.defs", "names": [ "label" ] },
          "description": "Metadata tag on an atproto resource (eg, repo or record)",
          "fields": [
            {
              "key": "src",
              "ocaml_key": "src",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": "DID of the actor who created this label",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "uri",
                  "description": "AT URI of the record, repository (account), or other resource which this label applies to",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "optionally, CID specifying the specific version of 'uri' resource this label applies to",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "val",
              "ocaml_key": "val_",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": "the short string name of the value or type of this label",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 128,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "neg",
              "ocaml_key": "neg",
              "optional": true,
              "nullable": false,
              "ty": [
                "Boolean",
                {
                  "description": "if true, this is a negation label, overwriting a previous label",
                  "default": null,
                  "const": null
                }
              ]
            },
            {
              "key": "cts",
              "ocaml_key": "cts",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": "timestamp when this label was created",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "cid", "names": [] },
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] },
            { "nsid": "uri", "names": [] }
          ]
        }
      ];
  deps: cid; datetime; did; uri;
*)
type label_label = {
  src : did;
  uri : uri;
  cid : cid option;
  val_ : string;
  neg : bool option;
  cts : datetime;
}
[@@ocaml.doc "Metadata tag on an atproto resource (eg, repo or record)"]

(*
  path: app.bsky.graph.defs#listViewerState;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.defs",
            "names": [ "listViewerState" ]
          },
          "description": null,
          "fields": [
            {
              "key": "muted",
              "ocaml_key": "muted",
              "optional": true,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": null, "const": null }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type graph_listViewerState = {muted : bool option}

(*
  path: app.bsky.graph.defs#listPurpose;
  ty: [
        "Alias",
        {
          "path": {
            "nsid": "app.bsky.graph.defs",
            "names": [ "listPurpose" ]
          },
          "ty": [
            "String",
            {
              "description": null,
              "knownValues": [ "app.bsky.graph.defs#modlist" ],
              "minLength": null,
              "maxLength": null,
              "maxGraphemes": null,
              "default": null
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type graph_listPurpose = string

(*
  path: app.bsky.graph.defs#listViewBasic;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.defs",
            "names": [ "listViewBasic" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "name",
              "ocaml_key": "name",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": 1,
                  "maxLength": 64,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "purpose",
              "ocaml_key": "purpose",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.graph.defs", "names": [ "listPurpose" ] }
              ]
            },
            {
              "key": "avatar",
              "ocaml_key": "avatar",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "viewer",
              "ocaml_key": "viewer",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.graph.defs",
                  "names": [ "listViewerState" ]
                }
              ]
            },
            {
              "key": "indexedAt",
              "ocaml_key": "indexedAt",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.graph.defs", "names": [ "listPurpose" ] },
            { "nsid": "app.bsky.graph.defs", "names": [ "listViewerState" ] },
            { "nsid": "at-uri", "names": [] },
            { "nsid": "cid", "names": [] },
            { "nsid": "datetime", "names": [] }
          ]
        }
      ];
  deps: app.bsky.graph.defs#listPurpose; app.bsky.graph.defs#listViewerState;
        at-uri; cid; datetime;
*)
type graph_listViewBasic = {
  uri : at_uri;
  cid : cid;
  name : string;
  purpose : graph_listPurpose;
  avatar : string option;
  viewer : graph_listViewerState option;
  indexedAt : datetime option;
}

(*
  path: app.bsky.actor.defs#viewerState;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.defs",
            "names": [ "viewerState" ]
          },
          "description": null,
          "fields": [
            {
              "key": "muted",
              "ocaml_key": "muted",
              "optional": true,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": null, "const": null }
              ]
            },
            {
              "key": "mutedByList",
              "ocaml_key": "mutedByList",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.graph.defs",
                  "names": [ "listViewBasic" ]
                }
              ]
            },
            {
              "key": "blockedBy",
              "ocaml_key": "blockedBy",
              "optional": true,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": null, "const": null }
              ]
            },
            {
              "key": "blocking",
              "ocaml_key": "blocking",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "following",
              "ocaml_key": "following",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "followedBy",
              "ocaml_key": "followedBy",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.graph.defs", "names": [ "listViewBasic" ] },
            { "nsid": "at-uri", "names": [] }
          ]
        }
      ];
  deps: app.bsky.graph.defs#listViewBasic; at-uri;
*)
type actor_viewerState = {
  muted : bool option;
  mutedByList : graph_listViewBasic option;
  blockedBy : bool option;
  blocking : at_uri option;
  following : at_uri option;
  followedBy : at_uri option;
}

(*
  path: app.bsky.actor.defs#profileView;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.defs",
            "names": [ "profileView" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "handle",
              "ocaml_key": "handle",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "handle",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "displayName",
              "ocaml_key": "displayName",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 640,
                  "maxGraphemes": 64,
                  "default": null
                }
              ]
            },
            {
              "key": "description",
              "ocaml_key": "description",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 2560,
                  "maxGraphemes": 256,
                  "default": null
                }
              ]
            },
            {
              "key": "avatar",
              "ocaml_key": "avatar",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "indexedAt",
              "ocaml_key": "indexedAt",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "viewer",
              "ocaml_key": "viewer",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.actor.defs", "names": [ "viewerState" ] }
              ]
            },
            {
              "key": "labels",
              "ocaml_key": "labels",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.actor.defs",
                    "names": [ "profileView", "labels" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.label.defs",
                      "names": [ "label" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "viewerState" ] },
            { "nsid": "com.atproto.label.defs", "names": [ "label" ] },
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] },
            { "nsid": "handle", "names": [] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#viewerState; com.atproto.label.defs#label;
        datetime; did; handle;
*)
type actor_profileView = {
  did : did;
  handle : handle;
  displayName : string option;
  description : string option;
  avatar : string option;
  indexedAt : datetime option;
  viewer : actor_viewerState option;
  labels : label_label list option;
}

(*
  path: app.bsky.actor.defs#profileViewBasic;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.defs",
            "names": [ "profileViewBasic" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "handle",
              "ocaml_key": "handle",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "handle",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "displayName",
              "ocaml_key": "displayName",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 640,
                  "maxGraphemes": 64,
                  "default": null
                }
              ]
            },
            {
              "key": "avatar",
              "ocaml_key": "avatar",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "viewer",
              "ocaml_key": "viewer",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.actor.defs", "names": [ "viewerState" ] }
              ]
            },
            {
              "key": "labels",
              "ocaml_key": "labels",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.actor.defs",
                    "names": [ "profileViewBasic", "labels" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.label.defs",
                      "names": [ "label" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "viewerState" ] },
            { "nsid": "com.atproto.label.defs", "names": [ "label" ] },
            { "nsid": "did", "names": [] },
            { "nsid": "handle", "names": [] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#viewerState; com.atproto.label.defs#label; did;
        handle;
*)
type actor_profileViewBasic = {
  did : did;
  handle : handle;
  displayName : string option;
  avatar : string option;
  viewer : actor_viewerState option;
  labels : label_label list option;
}

(*
  path: app.bsky.actor.defs#profileViewDetailed;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.defs",
            "names": [ "profileViewDetailed" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "handle",
              "ocaml_key": "handle",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "handle",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "displayName",
              "ocaml_key": "displayName",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 640,
                  "maxGraphemes": 64,
                  "default": null
                }
              ]
            },
            {
              "key": "description",
              "ocaml_key": "description",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 2560,
                  "maxGraphemes": 256,
                  "default": null
                }
              ]
            },
            {
              "key": "avatar",
              "ocaml_key": "avatar",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "banner",
              "ocaml_key": "banner",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "followersCount",
              "ocaml_key": "followersCount",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "followsCount",
              "ocaml_key": "followsCount",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "postsCount",
              "ocaml_key": "postsCount",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "indexedAt",
              "ocaml_key": "indexedAt",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "viewer",
              "ocaml_key": "viewer",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.actor.defs", "names": [ "viewerState" ] }
              ]
            },
            {
              "key": "labels",
              "ocaml_key": "labels",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.actor.defs",
                    "names": [ "profileViewDetailed", "labels" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.label.defs",
                      "names": [ "label" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "viewerState" ] },
            { "nsid": "com.atproto.label.defs", "names": [ "label" ] },
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] },
            { "nsid": "handle", "names": [] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#viewerState; com.atproto.label.defs#label;
        datetime; did; handle;
*)
type actor_profileViewDetailed = {
  did : did;
  handle : handle;
  displayName : string option;
  description : string option;
  avatar : string option;
  banner : string option;
  followersCount : int64 option;
  followsCount : int64 option;
  postsCount : int64 option;
  indexedAt : datetime option;
  viewer : actor_viewerState option;
  labels : label_label list option;
}

(*
  path: app.bsky.actor.getPreferences#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.getPreferences",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "preferences",
              "ocaml_key": "preferences",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.actor.defs", "names": [ "preferences" ] }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "preferences" ] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#preferences;
*)
type actor_getPreferences_output = {preferences : actor_preferences}

(*
  path: app.bsky.actor.getPreferences#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.getPreferences",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [],
          "deps": []
        }
      ];
  deps: ;
*)
type actor_getPreferences_parameters = unit

(*
  path: at-identifier;
  ty: [
        "Alias",
        {
          "path": { "nsid": "at-identifier", "names": [] },
          "ty": [
            "Format",
            {
              "format": "at-identifier",
              "description": null,
              "knownValues": null,
              "minLength": null,
              "maxLength": null,
              "maxGraphemes": null,
              "default": null
            }
          ],
          "deps": [ { "nsid": "at-identifier", "names": [] } ]
        }
      ];
  deps: at-identifier;
*)
type at_identifier = string

(*
  path: app.bsky.actor.getProfile#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.getProfile",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "actor",
              "ocaml_key": "actor",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-identifier", "names": [] } ]
        }
      ];
  deps: at-identifier;
*)
type actor_getProfile_parameters = {actor : at_identifier}

(*
  path: app.bsky.actor.getProfiles#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.getProfiles",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "profiles",
              "ocaml_key": "profiles",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.actor.getProfiles",
                    "names": [ "main", "output", "profiles" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.actor.defs",
                      "names": [ "profileViewDetailed" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "app.bsky.actor.defs",
              "names": [ "profileViewDetailed" ]
            }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileViewDetailed;
*)
type actor_getProfiles_output = {profiles : actor_profileViewDetailed list}

(*
  path: app.bsky.actor.getProfiles#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.getProfiles",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "actors",
              "ocaml_key": "actors",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.actor.getProfiles",
                    "names": [ "main", "parameters", "actors" ]
                  },
                  "description": null,
                  "maxLength": 25,
                  "items": [
                    "Format",
                    {
                      "format": "at-identifier",
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-identifier", "names": [] } ]
        }
      ];
  deps: at-identifier;
*)
type actor_getProfiles_parameters = {actors : at_identifier list}

(*
  path: app.bsky.actor.getSuggestions#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.getSuggestions",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "actors",
              "ocaml_key": "actors",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.actor.getSuggestions",
                    "names": [ "main", "output", "actors" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.actor.defs",
                      "names": [ "profileView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileView;
*)
type actor_getSuggestions_output = {
  cursor : string option;
  actors : actor_profileView list;
}

(*
  path: app.bsky.actor.getSuggestions#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.getSuggestions",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type actor_getSuggestions_parameters = {
  limit : int64 option;
  cursor : string option;
}

(*
  path: app.bsky.actor.profile;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.actor.profile", "names": [ "main" ] },
          "description": null,
          "fields": [
            {
              "key": "displayName",
              "ocaml_key": "displayName",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 640,
                  "maxGraphemes": 64,
                  "default": null
                }
              ]
            },
            {
              "key": "description",
              "ocaml_key": "description",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 2560,
                  "maxGraphemes": 256,
                  "default": null
                }
              ]
            },
            {
              "key": "avatar",
              "ocaml_key": "avatar",
              "optional": true,
              "nullable": false,
              "ty": [
                "Blob",
                {
                  "accept": [ "image/png", "image/jpeg" ],
                  "maxSize": 1000000
                }
              ]
            },
            {
              "key": "banner",
              "ocaml_key": "banner",
              "optional": true,
              "nullable": false,
              "ty": [
                "Blob",
                {
                  "accept": [ "image/png", "image/jpeg" ],
                  "maxSize": 1000000
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type actor_profile = {
  displayName : string option;
  description : string option;
  avatar : blob option;
  banner : blob option;
}

(*
  path: app.bsky.actor.putPreferences#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.putPreferences",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "preferences",
              "ocaml_key": "preferences",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.actor.defs", "names": [ "preferences" ] }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "preferences" ] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#preferences;
*)
type actor_putPreferences_input = {preferences : actor_preferences}

(*
  path: app.bsky.actor.searchActors#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.searchActors",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "actors",
              "ocaml_key": "actors",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.actor.searchActors",
                    "names": [ "main", "output", "actors" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.actor.defs",
                      "names": [ "profileView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileView;
*)
type actor_searchActors_output = {
  cursor : string option;
  actors : actor_profileView list;
}

(*
  path: app.bsky.actor.searchActors#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.searchActors",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "term",
              "ocaml_key": "term",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type actor_searchActors_parameters = {
  term : string option;
  limit : int64 option;
  cursor : string option;
}

(*
  path: app.bsky.actor.searchActorsTypeahead#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.searchActorsTypeahead",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "actors",
              "ocaml_key": "actors",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.actor.searchActorsTypeahead",
                    "names": [ "main", "output", "actors" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.actor.defs",
                      "names": [ "profileViewBasic" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "app.bsky.actor.defs",
              "names": [ "profileViewBasic" ]
            }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileViewBasic;
*)
type actor_searchActorsTypeahead_output = {actors : actor_profileViewBasic list}

(*
  path: app.bsky.actor.searchActorsTypeahead#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.actor.searchActorsTypeahead",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "term",
              "ocaml_key": "term",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type actor_searchActorsTypeahead_parameters = {
  term : string option;
  limit : int64 option;
}

(*
  path: app.bsky.embed.external#external;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.embed.external",
            "names": [ "external" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "title",
              "ocaml_key": "title",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "description",
              "ocaml_key": "description",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "thumb",
              "ocaml_key": "thumb",
              "optional": true,
              "nullable": false,
              "ty": [
                "Blob", { "accept": [ "image/*" ], "maxSize": 1000000 }
              ]
            }
          ],
          "deps": [ { "nsid": "uri", "names": [] } ]
        }
      ];
  deps: uri;
*)
type embed_external_external = {
  uri : uri;
  title : string;
  description : string;
  thumb : blob option;
}

(*
  path: app.bsky.embed.external;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.embed.external", "names": [ "main" ] },
          "description": null,
          "fields": [
            {
              "key": "external",
              "ocaml_key": "external_",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.embed.external",
                  "names": [ "external" ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.embed.external", "names": [ "external" ] }
          ]
        }
      ];
  deps: app.bsky.embed.external#external;
*)
type embed_external = {external_ : embed_external_external}

(*
  path: app.bsky.embed.external#viewExternal;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.embed.external",
            "names": [ "viewExternal" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "title",
              "ocaml_key": "title",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "description",
              "ocaml_key": "description",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "thumb",
              "ocaml_key": "thumb",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "uri", "names": [] } ]
        }
      ];
  deps: uri;
*)
type embed_external_viewExternal = {
  uri : uri;
  title : string;
  description : string;
  thumb : string option;
}

(*
  path: app.bsky.embed.external#view;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.embed.external", "names": [ "view" ] },
          "description": null,
          "fields": [
            {
              "key": "external",
              "ocaml_key": "external_",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.embed.external",
                  "names": [ "viewExternal" ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "app.bsky.embed.external",
              "names": [ "viewExternal" ]
            }
          ]
        }
      ];
  deps: app.bsky.embed.external#viewExternal;
*)
type embed_external_view = {external_ : embed_external_viewExternal}

(*
  path: app.bsky.embed.images#image;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.embed.images", "names": [ "image" ] },
          "description": null,
          "fields": [
            {
              "key": "image",
              "ocaml_key": "image",
              "optional": false,
              "nullable": false,
              "ty": [
                "Blob", { "accept": [ "image/*" ], "maxSize": 1000000 }
              ]
            },
            {
              "key": "alt",
              "ocaml_key": "alt",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type embed_images_image = {image : blob; alt : string}

(*
  path: app.bsky.embed.images;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.embed.images", "names": [ "main" ] },
          "description": null,
          "fields": [
            {
              "key": "images",
              "ocaml_key": "images",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.embed.images",
                    "names": [ "main", "images" ]
                  },
                  "description": null,
                  "maxLength": 4,
                  "items": [
                    "Ref",
                    { "nsid": "app.bsky.embed.images", "names": [ "image" ] }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.embed.images", "names": [ "image" ] }
          ]
        }
      ];
  deps: app.bsky.embed.images#image;
*)
type embed_images = {images : embed_images_image list}

(*
  path: app.bsky.embed.images#viewImage;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.embed.images",
            "names": [ "viewImage" ]
          },
          "description": null,
          "fields": [
            {
              "key": "thumb",
              "ocaml_key": "thumb",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "fullsize",
              "ocaml_key": "fullsize",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "alt",
              "ocaml_key": "alt",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type embed_images_viewImage = {thumb : string; fullsize : string; alt : string}

(*
  path: app.bsky.embed.images#view;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.embed.images", "names": [ "view" ] },
          "description": null,
          "fields": [
            {
              "key": "images",
              "ocaml_key": "images",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.embed.images",
                    "names": [ "view", "images" ]
                  },
                  "description": null,
                  "maxLength": 4,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.embed.images",
                      "names": [ "viewImage" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.embed.images", "names": [ "viewImage" ] }
          ]
        }
      ];
  deps: app.bsky.embed.images#viewImage;
*)
type embed_images_view = {images : embed_images_viewImage list}

(*
  path: com.atproto.repo.strongRef;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.strongRef",
            "names": [ "main" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-uri", "names": [] }, { "nsid": "cid", "names": [] }
          ]
        }
      ];
  deps: at-uri; cid;
*)
type repo_strongRef = {uri : at_uri; cid : cid}

(*
  path: app.bsky.embed.record;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.embed.record", "names": [ "main" ] },
          "description": null,
          "fields": [
            {
              "key": "record",
              "ocaml_key": "record",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "com.atproto.repo.strongRef", "names": [ "main" ] }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.repo.strongRef", "names": [ "main" ] }
          ]
        }
      ];
  deps: com.atproto.repo.strongRef;
*)
type embed_record = {record : repo_strongRef}

(*
  path: app.bsky.richtext.facet#mention;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.richtext.facet",
            "names": [ "mention" ]
          },
          "description": "A facet feature for actor mentions.",
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "did", "names": [] } ]
        }
      ];
  deps: did;
*)
type richtext_facet_mention = {did : did}
[@@ocaml.doc "A facet feature for actor mentions."]

(*
  path: app.bsky.richtext.facet#link;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.richtext.facet", "names": [ "link" ] },
          "description": "A facet feature for links.",
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "uri", "names": [] } ]
        }
      ];
  deps: uri;
*)
type richtext_facet_link = {uri : uri}
[@@ocaml.doc "A facet feature for links."]

(*
  path: app.bsky.richtext.facet#main/features/item;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "app.bsky.richtext.facet",
            "names": [ "main", "features", "item" ]
          },
          "constrs": [
            {
              "ocaml_name": "Mention",
              "path": {
                "nsid": "app.bsky.richtext.facet",
                "names": [ "mention" ]
              }
            },
            {
              "ocaml_name": "Link",
              "path": {
                "nsid": "app.bsky.richtext.facet",
                "names": [ "link" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "app.bsky.richtext.facet", "names": [ "mention" ] },
            { "nsid": "app.bsky.richtext.facet", "names": [ "link" ] }
          ]
        }
      ];
  deps: app.bsky.richtext.facet#mention; app.bsky.richtext.facet#link;
*)
type richtext_facet_features_item =
  | Mention of richtext_facet_mention
  | Link of richtext_facet_link

(*
  path: app.bsky.richtext.facet#byteSlice;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.richtext.facet",
            "names": [ "byteSlice" ]
          },
          "description": "A text segment. Start is inclusive, end is exclusive. Indices are for utf8-encoded strings.",
          "fields": [
            {
              "key": "byteStart",
              "ocaml_key": "byteStart",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 0,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "byteEnd",
              "ocaml_key": "byteEnd",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 0,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type richtext_facet_byteSlice = {byteStart : int64; byteEnd : int64}
[@@ocaml.doc
  "A text segment. Start is inclusive, end is exclusive. Indices are for \
   utf8-encoded strings."]

(*
  path: app.bsky.richtext.facet;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.richtext.facet", "names": [ "main" ] },
          "description": null,
          "fields": [
            {
              "key": "index",
              "ocaml_key": "index",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.richtext.facet",
                  "names": [ "byteSlice" ]
                }
              ]
            },
            {
              "key": "features",
              "ocaml_key": "features",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.richtext.facet",
                    "names": [ "main", "features" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.richtext.facet",
                      "names": [ "main", "features", "item" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.richtext.facet", "names": [ "byteSlice" ] },
            {
              "nsid": "app.bsky.richtext.facet",
              "names": [ "main", "features", "item" ]
            }
          ]
        }
      ];
  deps: app.bsky.richtext.facet#byteSlice;
        app.bsky.richtext.facet#main/features/item;
*)
type richtext_facet = {
  index : richtext_facet_byteSlice;
  features : richtext_facet_features_item list;
}

(*
  path: app.bsky.graph.defs#listView;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.graph.defs", "names": [ "listView" ] },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "creator",
              "ocaml_key": "creator",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] }
              ]
            },
            {
              "key": "name",
              "ocaml_key": "name",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": 1,
                  "maxLength": 64,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "purpose",
              "ocaml_key": "purpose",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.graph.defs", "names": [ "listPurpose" ] }
              ]
            },
            {
              "key": "description",
              "ocaml_key": "description",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 3000,
                  "maxGraphemes": 300,
                  "default": null
                }
              ]
            },
            {
              "key": "descriptionFacets",
              "ocaml_key": "descriptionFacets",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.graph.defs",
                    "names": [ "listView", "descriptionFacets" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.richtext.facet",
                      "names": [ "main" ]
                    }
                  ]
                }
              ]
            },
            {
              "key": "avatar",
              "ocaml_key": "avatar",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "viewer",
              "ocaml_key": "viewer",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.graph.defs",
                  "names": [ "listViewerState" ]
                }
              ]
            },
            {
              "key": "indexedAt",
              "ocaml_key": "indexedAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] },
            { "nsid": "app.bsky.graph.defs", "names": [ "listPurpose" ] },
            { "nsid": "app.bsky.graph.defs", "names": [ "listViewerState" ] },
            { "nsid": "app.bsky.richtext.facet", "names": [ "main" ] },
            { "nsid": "at-uri", "names": [] },
            { "nsid": "cid", "names": [] },
            { "nsid": "datetime", "names": [] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileView; app.bsky.graph.defs#listPurpose;
        app.bsky.graph.defs#listViewerState; app.bsky.richtext.facet; at-uri;
        cid; datetime;
*)
type graph_listView = {
  uri : at_uri;
  cid : cid;
  creator : actor_profileView;
  name : string;
  purpose : graph_listPurpose;
  description : string option;
  descriptionFacets : richtext_facet list option;
  avatar : string option;
  viewer : graph_listViewerState option;
  indexedAt : datetime;
}

(*
  path: app.bsky.feed.defs#generatorViewerState;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "generatorViewerState" ]
          },
          "description": null,
          "fields": [
            {
              "key": "like",
              "ocaml_key": "like",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type feed_generatorViewerState = {like : at_uri option}

(*
  path: app.bsky.feed.defs#generatorView;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "generatorView" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "creator",
              "ocaml_key": "creator",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] }
              ]
            },
            {
              "key": "displayName",
              "ocaml_key": "displayName",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "description",
              "ocaml_key": "description",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 3000,
                  "maxGraphemes": 300,
                  "default": null
                }
              ]
            },
            {
              "key": "descriptionFacets",
              "ocaml_key": "descriptionFacets",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.defs",
                    "names": [ "generatorView", "descriptionFacets" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.richtext.facet",
                      "names": [ "main" ]
                    }
                  ]
                }
              ]
            },
            {
              "key": "avatar",
              "ocaml_key": "avatar",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "likeCount",
              "ocaml_key": "likeCount",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 0,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "viewer",
              "ocaml_key": "viewer",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.feed.defs",
                  "names": [ "generatorViewerState" ]
                }
              ]
            },
            {
              "key": "indexedAt",
              "ocaml_key": "indexedAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] },
            {
              "nsid": "app.bsky.feed.defs",
              "names": [ "generatorViewerState" ]
            },
            { "nsid": "app.bsky.richtext.facet", "names": [ "main" ] },
            { "nsid": "at-uri", "names": [] },
            { "nsid": "cid", "names": [] },
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileView;
        app.bsky.feed.defs#generatorViewerState; app.bsky.richtext.facet;
        at-uri; cid; datetime; did;
*)
type feed_generatorView = {
  uri : at_uri;
  cid : cid;
  did : did;
  creator : actor_profileView;
  displayName : string;
  description : string option;
  descriptionFacets : richtext_facet list option;
  avatar : string option;
  likeCount : int64 option;
  viewer : feed_generatorViewerState option;
  indexedAt : datetime;
}

(*
  path: app.bsky.embed.recordWithMedia#view/media;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "app.bsky.embed.recordWithMedia",
            "names": [ "view", "media" ]
          },
          "constrs": [
            {
              "ocaml_name": "Images",
              "path": {
                "nsid": "app.bsky.embed.images",
                "names": [ "view" ]
              }
            },
            {
              "ocaml_name": "External",
              "path": {
                "nsid": "app.bsky.embed.external",
                "names": [ "view" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "app.bsky.embed.images", "names": [ "view" ] },
            { "nsid": "app.bsky.embed.external", "names": [ "view" ] }
          ]
        }
      ];
  deps: app.bsky.embed.images#view; app.bsky.embed.external#view;
*)
type embed_recordWithMedia_view_media =
  | Images of embed_images_view
  | External of embed_external_view

(*
  path: app.bsky.embed.record#viewNotFound;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.embed.record",
            "names": [ "viewNotFound" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type embed_record_viewNotFound = {uri : at_uri}

(*
  path: app.bsky.embed.record#viewBlocked;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.embed.record",
            "names": [ "viewBlocked" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type embed_record_viewBlocked = {uri : at_uri}

(*
  path: app.bsky.embed.recordWithMedia#view;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.embed.recordWithMedia",
            "names": [ "view" ]
          },
          "description": null,
          "fields": [
            {
              "key": "record",
              "ocaml_key": "record",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.embed.record", "names": [ "view" ] }
              ]
            },
            {
              "key": "media",
              "ocaml_key": "media",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.embed.recordWithMedia",
                  "names": [ "view", "media" ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.embed.record", "names": [ "view" ] },
            {
              "nsid": "app.bsky.embed.recordWithMedia",
              "names": [ "view", "media" ]
            }
          ]
        }
      ];
  deps: app.bsky.embed.record#view; app.bsky.embed.recordWithMedia#view/media;
  path: app.bsky.embed.record#viewRecord/embeds/item;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "app.bsky.embed.record",
            "names": [ "viewRecord", "embeds", "item" ]
          },
          "constrs": [
            {
              "ocaml_name": "Images",
              "path": {
                "nsid": "app.bsky.embed.images",
                "names": [ "view" ]
              }
            },
            {
              "ocaml_name": "External",
              "path": {
                "nsid": "app.bsky.embed.external",
                "names": [ "view" ]
              }
            },
            {
              "ocaml_name": "Record",
              "path": {
                "nsid": "app.bsky.embed.record",
                "names": [ "view" ]
              }
            },
            {
              "ocaml_name": "RecordWithMedia",
              "path": {
                "nsid": "app.bsky.embed.recordWithMedia",
                "names": [ "view" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "app.bsky.embed.images", "names": [ "view" ] },
            { "nsid": "app.bsky.embed.external", "names": [ "view" ] },
            { "nsid": "app.bsky.embed.record", "names": [ "view" ] },
            { "nsid": "app.bsky.embed.recordWithMedia", "names": [ "view" ] }
          ]
        }
      ];
  deps: app.bsky.embed.images#view; app.bsky.embed.external#view;
        app.bsky.embed.record#view; app.bsky.embed.recordWithMedia#view;
  path: app.bsky.embed.record#viewRecord;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.embed.record",
            "names": [ "viewRecord" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "author",
              "ocaml_key": "author",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.actor.defs",
                  "names": [ "profileViewBasic" ]
                }
              ]
            },
            {
              "key": "value",
              "ocaml_key": "value",
              "optional": false,
              "nullable": false,
              "ty": [ "Unknown", { "description": null } ]
            },
            {
              "key": "labels",
              "ocaml_key": "labels",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.embed.record",
                    "names": [ "viewRecord", "labels" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.label.defs",
                      "names": [ "label" ]
                    }
                  ]
                }
              ]
            },
            {
              "key": "embeds",
              "ocaml_key": "embeds",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.embed.record",
                    "names": [ "viewRecord", "embeds" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.embed.record",
                      "names": [ "viewRecord", "embeds", "item" ]
                    }
                  ]
                }
              ]
            },
            {
              "key": "indexedAt",
              "ocaml_key": "indexedAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "app.bsky.actor.defs",
              "names": [ "profileViewBasic" ]
            },
            {
              "nsid": "app.bsky.embed.record",
              "names": [ "viewRecord", "embeds", "item" ]
            },
            { "nsid": "at-uri", "names": [] },
            { "nsid": "cid", "names": [] },
            { "nsid": "com.atproto.label.defs", "names": [ "label" ] },
            { "nsid": "datetime", "names": [] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileViewBasic;
        app.bsky.embed.record#viewRecord/embeds/item; at-uri; cid;
        com.atproto.label.defs#label; datetime;
  path: app.bsky.embed.record#view/record;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "app.bsky.embed.record",
            "names": [ "view", "record" ]
          },
          "constrs": [
            {
              "ocaml_name": "ViewRecord",
              "path": {
                "nsid": "app.bsky.embed.record",
                "names": [ "viewRecord" ]
              }
            },
            {
              "ocaml_name": "ViewNotFound",
              "path": {
                "nsid": "app.bsky.embed.record",
                "names": [ "viewNotFound" ]
              }
            },
            {
              "ocaml_name": "ViewBlocked",
              "path": {
                "nsid": "app.bsky.embed.record",
                "names": [ "viewBlocked" ]
              }
            },
            {
              "ocaml_name": "GeneratorView",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "generatorView" ]
              }
            },
            {
              "ocaml_name": "ListView",
              "path": {
                "nsid": "app.bsky.graph.defs",
                "names": [ "listView" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "app.bsky.embed.record", "names": [ "viewRecord" ] },
            { "nsid": "app.bsky.embed.record", "names": [ "viewNotFound" ] },
            { "nsid": "app.bsky.embed.record", "names": [ "viewBlocked" ] },
            { "nsid": "app.bsky.feed.defs", "names": [ "generatorView" ] },
            { "nsid": "app.bsky.graph.defs", "names": [ "listView" ] }
          ]
        }
      ];
  deps: app.bsky.embed.record#viewRecord; app.bsky.embed.record#viewNotFound;
        app.bsky.embed.record#viewBlocked; app.bsky.feed.defs#generatorView;
        app.bsky.graph.defs#listView;
  path: app.bsky.embed.record#view;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.embed.record", "names": [ "view" ] },
          "description": null,
          "fields": [
            {
              "key": "record",
              "ocaml_key": "record",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.embed.record",
                  "names": [ "view", "record" ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "app.bsky.embed.record",
              "names": [ "view", "record" ]
            }
          ]
        }
      ];
  deps: app.bsky.embed.record#view/record;
*)
type embed_recordWithMedia_view = {
  record : embed_record_view;
  media : embed_recordWithMedia_view_media;
}
and embed_record_viewRecord_embeds_item =
  | Images of embed_images_view
  | External of embed_external_view
  | Record of embed_record_view
  | RecordWithMedia of embed_recordWithMedia_view
and embed_record_viewRecord = {
  uri : at_uri;
  cid : cid;
  author : actor_profileViewBasic;
  value : unknown;
  labels : label_label list option;
  embeds : embed_record_viewRecord_embeds_item list option;
  indexedAt : datetime;
}
and embed_record_view_record =
  | ViewRecord of embed_record_viewRecord
  | ViewNotFound of embed_record_viewNotFound
  | ViewBlocked of embed_record_viewBlocked
  | GeneratorView of feed_generatorView
  | ListView of graph_listView
and embed_record_view = {record : embed_record_view_record}

(*
  path: app.bsky.embed.recordWithMedia#main/media;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "app.bsky.embed.recordWithMedia",
            "names": [ "main", "media" ]
          },
          "constrs": [
            {
              "ocaml_name": "Images",
              "path": {
                "nsid": "app.bsky.embed.images",
                "names": [ "main" ]
              }
            },
            {
              "ocaml_name": "External",
              "path": {
                "nsid": "app.bsky.embed.external",
                "names": [ "main" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "app.bsky.embed.images", "names": [ "main" ] },
            { "nsid": "app.bsky.embed.external", "names": [ "main" ] }
          ]
        }
      ];
  deps: app.bsky.embed.images; app.bsky.embed.external;
*)
type embed_recordWithMedia_media =
  | Images of embed_images
  | External of embed_external

(*
  path: app.bsky.embed.recordWithMedia;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.embed.recordWithMedia",
            "names": [ "main" ]
          },
          "description": null,
          "fields": [
            {
              "key": "record",
              "ocaml_key": "record",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.embed.record", "names": [ "main" ] }
              ]
            },
            {
              "key": "media",
              "ocaml_key": "media",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.embed.recordWithMedia",
                  "names": [ "main", "media" ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.embed.record", "names": [ "main" ] },
            {
              "nsid": "app.bsky.embed.recordWithMedia",
              "names": [ "main", "media" ]
            }
          ]
        }
      ];
  deps: app.bsky.embed.record; app.bsky.embed.recordWithMedia#main/media;
*)
type embed_recordWithMedia = {
  record : embed_record;
  media : embed_recordWithMedia_media;
}

(*
  path: app.bsky.feed.defs#blockedPost;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "blockedPost" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "blocked",
              "ocaml_key": "blocked",
              "optional": false,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": null, "const": true }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type feed_blockedPost = {uri : at_uri; blocked : bool}

(*
  path: app.bsky.feed.defs#viewerState;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "viewerState" ]
          },
          "description": null,
          "fields": [
            {
              "key": "repost",
              "ocaml_key": "repost",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "like",
              "ocaml_key": "like",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type feed_viewerState = {repost : at_uri option; like : at_uri option}

(*
  path: app.bsky.feed.defs#postView/embed;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "postView", "embed" ]
          },
          "constrs": [
            {
              "ocaml_name": "Images",
              "path": {
                "nsid": "app.bsky.embed.images",
                "names": [ "view" ]
              }
            },
            {
              "ocaml_name": "External",
              "path": {
                "nsid": "app.bsky.embed.external",
                "names": [ "view" ]
              }
            },
            {
              "ocaml_name": "Record",
              "path": {
                "nsid": "app.bsky.embed.record",
                "names": [ "view" ]
              }
            },
            {
              "ocaml_name": "RecordWithMedia",
              "path": {
                "nsid": "app.bsky.embed.recordWithMedia",
                "names": [ "view" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "app.bsky.embed.images", "names": [ "view" ] },
            { "nsid": "app.bsky.embed.external", "names": [ "view" ] },
            { "nsid": "app.bsky.embed.record", "names": [ "view" ] },
            { "nsid": "app.bsky.embed.recordWithMedia", "names": [ "view" ] }
          ]
        }
      ];
  deps: app.bsky.embed.images#view; app.bsky.embed.external#view;
        app.bsky.embed.record#view; app.bsky.embed.recordWithMedia#view;
*)
type feed_postView_embed =
  | Images of embed_images_view
  | External of embed_external_view
  | Record of embed_record_view
  | RecordWithMedia of embed_recordWithMedia_view

(*
  path: app.bsky.feed.defs#postView;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.feed.defs", "names": [ "postView" ] },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "author",
              "ocaml_key": "author",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.actor.defs",
                  "names": [ "profileViewBasic" ]
                }
              ]
            },
            {
              "key": "record",
              "ocaml_key": "record",
              "optional": false,
              "nullable": false,
              "ty": [ "Unknown", { "description": null } ]
            },
            {
              "key": "embed",
              "ocaml_key": "embed",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.feed.defs",
                  "names": [ "postView", "embed" ]
                }
              ]
            },
            {
              "key": "replyCount",
              "ocaml_key": "replyCount",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "repostCount",
              "ocaml_key": "repostCount",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "likeCount",
              "ocaml_key": "likeCount",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "indexedAt",
              "ocaml_key": "indexedAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "viewer",
              "ocaml_key": "viewer",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.feed.defs", "names": [ "viewerState" ] }
              ]
            },
            {
              "key": "labels",
              "ocaml_key": "labels",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.defs",
                    "names": [ "postView", "labels" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.label.defs",
                      "names": [ "label" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "app.bsky.actor.defs",
              "names": [ "profileViewBasic" ]
            },
            {
              "nsid": "app.bsky.feed.defs",
              "names": [ "postView", "embed" ]
            },
            { "nsid": "app.bsky.feed.defs", "names": [ "viewerState" ] },
            { "nsid": "at-uri", "names": [] },
            { "nsid": "cid", "names": [] },
            { "nsid": "com.atproto.label.defs", "names": [ "label" ] },
            { "nsid": "datetime", "names": [] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileViewBasic;
        app.bsky.feed.defs#postView/embed; app.bsky.feed.defs#viewerState;
        at-uri; cid; com.atproto.label.defs#label; datetime;
*)
type feed_postView = {
  uri : at_uri;
  cid : cid;
  author : actor_profileViewBasic;
  record : unknown;
  embed : feed_postView_embed option;
  replyCount : int64 option;
  repostCount : int64 option;
  likeCount : int64 option;
  indexedAt : datetime;
  viewer : feed_viewerState option;
  labels : label_label list option;
}

(*
  path: app.bsky.feed.defs#notFoundPost;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "notFoundPost" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "notFound",
              "ocaml_key": "notFound",
              "optional": false,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": null, "const": true }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type feed_notFoundPost = {uri : at_uri; notFound : bool}

(*
  path: app.bsky.feed.defs#replyRef/root;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "replyRef", "root" ]
          },
          "constrs": [
            {
              "ocaml_name": "PostView",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "postView" ]
              }
            },
            {
              "ocaml_name": "NotFoundPost",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "notFoundPost" ]
              }
            },
            {
              "ocaml_name": "BlockedPost",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "blockedPost" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "postView" ] },
            { "nsid": "app.bsky.feed.defs", "names": [ "notFoundPost" ] },
            { "nsid": "app.bsky.feed.defs", "names": [ "blockedPost" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#postView; app.bsky.feed.defs#notFoundPost;
        app.bsky.feed.defs#blockedPost;
*)
type feed_replyRef_root =
  | PostView of feed_postView
  | NotFoundPost of feed_notFoundPost
  | BlockedPost of feed_blockedPost

(*
  path: app.bsky.feed.defs#replyRef/parent;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "replyRef", "parent" ]
          },
          "constrs": [
            {
              "ocaml_name": "PostView",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "postView" ]
              }
            },
            {
              "ocaml_name": "NotFoundPost",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "notFoundPost" ]
              }
            },
            {
              "ocaml_name": "BlockedPost",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "blockedPost" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "postView" ] },
            { "nsid": "app.bsky.feed.defs", "names": [ "notFoundPost" ] },
            { "nsid": "app.bsky.feed.defs", "names": [ "blockedPost" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#postView; app.bsky.feed.defs#notFoundPost;
        app.bsky.feed.defs#blockedPost;
*)
type feed_replyRef_parent =
  | PostView of feed_postView
  | NotFoundPost of feed_notFoundPost
  | BlockedPost of feed_blockedPost

(*
  path: app.bsky.feed.defs#replyRef;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.feed.defs", "names": [ "replyRef" ] },
          "description": null,
          "fields": [
            {
              "key": "root",
              "ocaml_key": "root",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.feed.defs",
                  "names": [ "replyRef", "root" ]
                }
              ]
            },
            {
              "key": "parent",
              "ocaml_key": "parent",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.feed.defs",
                  "names": [ "replyRef", "parent" ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "app.bsky.feed.defs",
              "names": [ "replyRef", "parent" ]
            },
            { "nsid": "app.bsky.feed.defs", "names": [ "replyRef", "root" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#replyRef/parent; app.bsky.feed.defs#replyRef/root;
*)
type feed_replyRef = {root : feed_replyRef_root; parent : feed_replyRef_parent}

(*
  path: app.bsky.feed.defs#reasonRepost;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "reasonRepost" ]
          },
          "description": null,
          "fields": [
            {
              "key": "by",
              "ocaml_key": "by",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.actor.defs",
                  "names": [ "profileViewBasic" ]
                }
              ]
            },
            {
              "key": "indexedAt",
              "ocaml_key": "indexedAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "app.bsky.actor.defs",
              "names": [ "profileViewBasic" ]
            },
            { "nsid": "datetime", "names": [] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileViewBasic; datetime;
*)
type feed_reasonRepost = {by : actor_profileViewBasic; indexedAt : datetime}

(*
  path: app.bsky.feed.defs#feedViewPost/reason;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "feedViewPost", "reason" ]
          },
          "constrs": [
            {
              "ocaml_name": "Feed",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "reasonRepost" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "reasonRepost" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#reasonRepost;
*)
type feed_feedViewPost_reason = Feed of feed_reasonRepost

(*
  path: app.bsky.feed.defs#feedViewPost;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "feedViewPost" ]
          },
          "description": null,
          "fields": [
            {
              "key": "post",
              "ocaml_key": "post",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.feed.defs", "names": [ "postView" ] }
              ]
            },
            {
              "key": "reply",
              "ocaml_key": "reply",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.feed.defs", "names": [ "replyRef" ] }
              ]
            },
            {
              "key": "reason",
              "ocaml_key": "reason",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.feed.defs",
                  "names": [ "feedViewPost", "reason" ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "app.bsky.feed.defs",
              "names": [ "feedViewPost", "reason" ]
            },
            { "nsid": "app.bsky.feed.defs", "names": [ "postView" ] },
            { "nsid": "app.bsky.feed.defs", "names": [ "replyRef" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#feedViewPost/reason; app.bsky.feed.defs#postView;
        app.bsky.feed.defs#replyRef;
*)
type feed_feedViewPost = {
  post : feed_postView;
  reply : feed_replyRef option;
  reason : feed_feedViewPost_reason option;
}

(*
  path: app.bsky.feed.defs#skeletonReasonRepost;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "skeletonReasonRepost" ]
          },
          "description": null,
          "fields": [
            {
              "key": "repost",
              "ocaml_key": "repost",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type feed_skeletonReasonRepost = {repost : at_uri}

(*
  path: app.bsky.feed.defs#skeletonFeedPost/reason;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "skeletonFeedPost", "reason" ]
          },
          "constrs": [
            {
              "ocaml_name": "Feed",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "skeletonReasonRepost" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            {
              "nsid": "app.bsky.feed.defs",
              "names": [ "skeletonReasonRepost" ]
            }
          ]
        }
      ];
  deps: app.bsky.feed.defs#skeletonReasonRepost;
*)
type feed_skeletonFeedPost_reason = Feed of feed_skeletonReasonRepost

(*
  path: app.bsky.feed.defs#skeletonFeedPost;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "skeletonFeedPost" ]
          },
          "description": null,
          "fields": [
            {
              "key": "post",
              "ocaml_key": "post",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "reason",
              "ocaml_key": "reason",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.feed.defs",
                  "names": [ "skeletonFeedPost", "reason" ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "app.bsky.feed.defs",
              "names": [ "skeletonFeedPost", "reason" ]
            },
            { "nsid": "at-uri", "names": [] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#skeletonFeedPost/reason; at-uri;
*)
type feed_skeletonFeedPost = {
  post : at_uri;
  reason : feed_skeletonFeedPost_reason option;
}

(*
  path: app.bsky.feed.defs#threadViewPost/replies/item;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "threadViewPost", "replies", "item" ]
          },
          "constrs": [
            {
              "ocaml_name": "ThreadViewPost",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "threadViewPost" ]
              }
            },
            {
              "ocaml_name": "NotFoundPost",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "notFoundPost" ]
              }
            },
            {
              "ocaml_name": "BlockedPost",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "blockedPost" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "threadViewPost" ] },
            { "nsid": "app.bsky.feed.defs", "names": [ "notFoundPost" ] },
            { "nsid": "app.bsky.feed.defs", "names": [ "blockedPost" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#threadViewPost; app.bsky.feed.defs#notFoundPost;
        app.bsky.feed.defs#blockedPost;
  path: app.bsky.feed.defs#threadViewPost/parent;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "threadViewPost", "parent" ]
          },
          "constrs": [
            {
              "ocaml_name": "ThreadViewPost",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "threadViewPost" ]
              }
            },
            {
              "ocaml_name": "NotFoundPost",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "notFoundPost" ]
              }
            },
            {
              "ocaml_name": "BlockedPost",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "blockedPost" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "threadViewPost" ] },
            { "nsid": "app.bsky.feed.defs", "names": [ "notFoundPost" ] },
            { "nsid": "app.bsky.feed.defs", "names": [ "blockedPost" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#threadViewPost; app.bsky.feed.defs#notFoundPost;
        app.bsky.feed.defs#blockedPost;
  path: app.bsky.feed.defs#threadViewPost;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.defs",
            "names": [ "threadViewPost" ]
          },
          "description": null,
          "fields": [
            {
              "key": "post",
              "ocaml_key": "post",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.feed.defs", "names": [ "postView" ] }
              ]
            },
            {
              "key": "parent",
              "ocaml_key": "parent",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.feed.defs",
                  "names": [ "threadViewPost", "parent" ]
                }
              ]
            },
            {
              "key": "replies",
              "ocaml_key": "replies",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.defs",
                    "names": [ "threadViewPost", "replies" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.feed.defs",
                      "names": [ "threadViewPost", "replies", "item" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "postView" ] },
            {
              "nsid": "app.bsky.feed.defs",
              "names": [ "threadViewPost", "parent" ]
            },
            {
              "nsid": "app.bsky.feed.defs",
              "names": [ "threadViewPost", "replies", "item" ]
            }
          ]
        }
      ];
  deps: app.bsky.feed.defs#postView;
        app.bsky.feed.defs#threadViewPost/parent;
        app.bsky.feed.defs#threadViewPost/replies/item;
*)
type feed_threadViewPost_replies_item =
  | ThreadViewPost of feed_threadViewPost
  | NotFoundPost of feed_notFoundPost
  | BlockedPost of feed_blockedPost
and feed_threadViewPost_parent =
  | ThreadViewPost of feed_threadViewPost
  | NotFoundPost of feed_notFoundPost
  | BlockedPost of feed_blockedPost
and feed_threadViewPost = {
  post : feed_postView;
  parent : feed_threadViewPost_parent option;
  replies : feed_threadViewPost_replies_item list option;
}

(*
  path: app.bsky.feed.describeFeedGenerator#feed;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.describeFeedGenerator",
            "names": [ "feed" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type feed_describeFeedGenerator_feed = {uri : at_uri}

(*
  path: app.bsky.feed.describeFeedGenerator#links;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.describeFeedGenerator",
            "names": [ "links" ]
          },
          "description": null,
          "fields": [
            {
              "key": "privacyPolicy",
              "ocaml_key": "privacyPolicy",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "termsOfService",
              "ocaml_key": "termsOfService",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type feed_describeFeedGenerator_links = {
  privacyPolicy : string option;
  termsOfService : string option;
}

(*
  path: app.bsky.feed.describeFeedGenerator#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.describeFeedGenerator",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "feeds",
              "ocaml_key": "feeds",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.describeFeedGenerator",
                    "names": [ "main", "output", "feeds" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.feed.describeFeedGenerator",
                      "names": [ "feed" ]
                    }
                  ]
                }
              ]
            },
            {
              "key": "links",
              "ocaml_key": "links",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.feed.describeFeedGenerator",
                  "names": [ "links" ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "app.bsky.feed.describeFeedGenerator",
              "names": [ "feed" ]
            },
            {
              "nsid": "app.bsky.feed.describeFeedGenerator",
              "names": [ "links" ]
            },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: app.bsky.feed.describeFeedGenerator#feed;
        app.bsky.feed.describeFeedGenerator#links; did;
*)
type feed_describeFeedGenerator_output = {
  did : did;
  feeds : feed_describeFeedGenerator_feed list;
  links : feed_describeFeedGenerator_links option;
}

(*
  path: app.bsky.feed.generator;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.feed.generator", "names": [ "main" ] },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "displayName",
              "ocaml_key": "displayName",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 240,
                  "maxGraphemes": 24,
                  "default": null
                }
              ]
            },
            {
              "key": "description",
              "ocaml_key": "description",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 3000,
                  "maxGraphemes": 300,
                  "default": null
                }
              ]
            },
            {
              "key": "descriptionFacets",
              "ocaml_key": "descriptionFacets",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.generator",
                    "names": [ "main", "descriptionFacets" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.richtext.facet",
                      "names": [ "main" ]
                    }
                  ]
                }
              ]
            },
            {
              "key": "avatar",
              "ocaml_key": "avatar",
              "optional": true,
              "nullable": false,
              "ty": [
                "Blob",
                {
                  "accept": [ "image/png", "image/jpeg" ],
                  "maxSize": 1000000
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.richtext.facet", "names": [ "main" ] },
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: app.bsky.richtext.facet; datetime; did;
*)
type feed_generator = {
  did : did;
  displayName : string;
  description : string option;
  descriptionFacets : richtext_facet list option;
  avatar : blob option;
  createdAt : datetime;
}

(*
  path: app.bsky.feed.getActorFeeds#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getActorFeeds",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "feeds",
              "ocaml_key": "feeds",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.getActorFeeds",
                    "names": [ "main", "output", "feeds" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.feed.defs",
                      "names": [ "generatorView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "generatorView" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#generatorView;
*)
type feed_getActorFeeds_output = {
  cursor : string option;
  feeds : feed_generatorView list;
}

(*
  path: app.bsky.feed.getActorFeeds#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getActorFeeds",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "actor",
              "ocaml_key": "actor",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-identifier", "names": [] } ]
        }
      ];
  deps: at-identifier;
*)
type feed_getActorFeeds_parameters = {
  actor : at_identifier;
  limit : int64 option;
  cursor : string option;
}

(*
  path: app.bsky.feed.getAuthorFeed#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getAuthorFeed",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "feed",
              "ocaml_key": "feed",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.getAuthorFeed",
                    "names": [ "main", "output", "feed" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.feed.defs",
                      "names": [ "feedViewPost" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "feedViewPost" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#feedViewPost;
*)
type feed_getAuthorFeed_output = {
  cursor : string option;
  feed : feed_feedViewPost list;
}

(*
  path: app.bsky.feed.getAuthorFeed#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getAuthorFeed",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "actor",
              "ocaml_key": "actor",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-identifier", "names": [] } ]
        }
      ];
  deps: at-identifier;
*)
type feed_getAuthorFeed_parameters = {
  actor : at_identifier;
  limit : int64 option;
  cursor : string option;
}

(*
  path: app.bsky.feed.getFeed#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getFeed",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "feed",
              "ocaml_key": "feed",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.getFeed",
                    "names": [ "main", "output", "feed" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.feed.defs",
                      "names": [ "feedViewPost" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "feedViewPost" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#feedViewPost;
*)
type feed_getFeed_output = {
  cursor : string option;
  feed : feed_feedViewPost list;
}

(*
  path: app.bsky.feed.getFeed#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getFeed",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "feed",
              "ocaml_key": "feed",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type feed_getFeed_parameters = {
  feed : at_uri;
  limit : int64 option;
  cursor : string option;
}

(*
  path: app.bsky.feed.getFeedGenerator#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getFeedGenerator",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "view",
              "ocaml_key": "view",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.feed.defs",
                  "names": [ "generatorView" ]
                }
              ]
            },
            {
              "key": "isOnline",
              "ocaml_key": "isOnline",
              "optional": false,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": null, "const": null }
              ]
            },
            {
              "key": "isValid",
              "ocaml_key": "isValid",
              "optional": false,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": null, "const": null }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "generatorView" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#generatorView;
*)
type feed_getFeedGenerator_output = {
  view : feed_generatorView;
  isOnline : bool;
  isValid : bool;
}

(*
  path: app.bsky.feed.getFeedGenerator#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getFeedGenerator",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "feed",
              "ocaml_key": "feed",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type feed_getFeedGenerator_parameters = {feed : at_uri}

(*
  path: app.bsky.feed.getFeedGenerators#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getFeedGenerators",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "feeds",
              "ocaml_key": "feeds",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.getFeedGenerators",
                    "names": [ "main", "output", "feeds" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.feed.defs",
                      "names": [ "generatorView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "generatorView" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#generatorView;
*)
type feed_getFeedGenerators_output = {feeds : feed_generatorView list}

(*
  path: app.bsky.feed.getFeedGenerators#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getFeedGenerators",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "feeds",
              "ocaml_key": "feeds",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.getFeedGenerators",
                    "names": [ "main", "parameters", "feeds" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Format",
                    {
                      "format": "at-uri",
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type feed_getFeedGenerators_parameters = {feeds : at_uri list}

(*
  path: app.bsky.feed.getFeedSkeleton#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getFeedSkeleton",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "feed",
              "ocaml_key": "feed",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.getFeedSkeleton",
                    "names": [ "main", "output", "feed" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.feed.defs",
                      "names": [ "skeletonFeedPost" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "skeletonFeedPost" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#skeletonFeedPost;
*)
type feed_getFeedSkeleton_output = {
  cursor : string option;
  feed : feed_skeletonFeedPost list;
}

(*
  path: app.bsky.feed.getFeedSkeleton#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getFeedSkeleton",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "feed",
              "ocaml_key": "feed",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type feed_getFeedSkeleton_parameters = {
  feed : at_uri;
  limit : int64 option;
  cursor : string option;
}

(*
  path: app.bsky.feed.getLikes#like;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.feed.getLikes", "names": [ "like" ] },
          "description": null,
          "fields": [
            {
              "key": "indexedAt",
              "ocaml_key": "indexedAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "actor",
              "ocaml_key": "actor",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] },
            { "nsid": "datetime", "names": [] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileView; datetime;
*)
type feed_getLikes_like = {
  indexedAt : datetime;
  createdAt : datetime;
  actor : actor_profileView;
}

(*
  path: app.bsky.feed.getLikes#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getLikes",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "likes",
              "ocaml_key": "likes",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.getLikes",
                    "names": [ "main", "output", "likes" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    { "nsid": "app.bsky.feed.getLikes", "names": [ "like" ] }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.feed.getLikes", "names": [ "like" ] },
            { "nsid": "at-uri", "names": [] },
            { "nsid": "cid", "names": [] }
          ]
        }
      ];
  deps: app.bsky.feed.getLikes#like; at-uri; cid;
*)
type feed_getLikes_output = {
  uri : at_uri;
  cid : cid option;
  cursor : string option;
  likes : feed_getLikes_like list;
}

(*
  path: app.bsky.feed.getLikes#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getLikes",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-uri", "names": [] }, { "nsid": "cid", "names": [] }
          ]
        }
      ];
  deps: at-uri; cid;
*)
type feed_getLikes_parameters = {
  uri : at_uri;
  cid : cid option;
  limit : int64 option;
  cursor : string option;
}

(*
  path: app.bsky.feed.getPostThread#main/output/thread;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "app.bsky.feed.getPostThread",
            "names": [ "main", "output", "thread" ]
          },
          "constrs": [
            {
              "ocaml_name": "ThreadViewPost",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "threadViewPost" ]
              }
            },
            {
              "ocaml_name": "NotFoundPost",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "notFoundPost" ]
              }
            },
            {
              "ocaml_name": "BlockedPost",
              "path": {
                "nsid": "app.bsky.feed.defs",
                "names": [ "blockedPost" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "threadViewPost" ] },
            { "nsid": "app.bsky.feed.defs", "names": [ "notFoundPost" ] },
            { "nsid": "app.bsky.feed.defs", "names": [ "blockedPost" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#threadViewPost; app.bsky.feed.defs#notFoundPost;
        app.bsky.feed.defs#blockedPost;
*)
type feed_getPostThread_output_thread =
  | ThreadViewPost of feed_threadViewPost
  | NotFoundPost of feed_notFoundPost
  | BlockedPost of feed_blockedPost

(*
  path: app.bsky.feed.getPostThread#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getPostThread",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "thread",
              "ocaml_key": "thread",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.feed.getPostThread",
                  "names": [ "main", "output", "thread" ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "app.bsky.feed.getPostThread",
              "names": [ "main", "output", "thread" ]
            }
          ]
        }
      ];
  deps: app.bsky.feed.getPostThread#main/output/thread;
*)
type feed_getPostThread_output = {thread : feed_getPostThread_output_thread}

(*
  path: app.bsky.feed.getPostThread#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getPostThread",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "depth",
              "ocaml_key": "depth",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 0,
                  "maximum": 1000,
                  "default": 6,
                  "description": null
                }
              ]
            },
            {
              "key": "parentHeight",
              "ocaml_key": "parentHeight",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 0,
                  "maximum": 1000,
                  "default": 80,
                  "description": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type feed_getPostThread_parameters = {
  uri : at_uri;
  depth : int64 option;
  parentHeight : int64 option;
}

(*
  path: app.bsky.feed.getPosts#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getPosts",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "posts",
              "ocaml_key": "posts",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.getPosts",
                    "names": [ "main", "output", "posts" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    { "nsid": "app.bsky.feed.defs", "names": [ "postView" ] }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "postView" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#postView;
*)
type feed_getPosts_output = {posts : feed_postView list}

(*
  path: app.bsky.feed.getPosts#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getPosts",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uris",
              "ocaml_key": "uris",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.getPosts",
                    "names": [ "main", "parameters", "uris" ]
                  },
                  "description": null,
                  "maxLength": 25,
                  "items": [
                    "Format",
                    {
                      "format": "at-uri",
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type feed_getPosts_parameters = {uris : at_uri list}

(*
  path: app.bsky.feed.getRepostedBy#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getRepostedBy",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "repostedBy",
              "ocaml_key": "repostedBy",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.getRepostedBy",
                    "names": [ "main", "output", "repostedBy" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.actor.defs",
                      "names": [ "profileView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] },
            { "nsid": "at-uri", "names": [] },
            { "nsid": "cid", "names": [] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileView; at-uri; cid;
*)
type feed_getRepostedBy_output = {
  uri : at_uri;
  cid : cid option;
  cursor : string option;
  repostedBy : actor_profileView list;
}

(*
  path: app.bsky.feed.getRepostedBy#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getRepostedBy",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-uri", "names": [] }, { "nsid": "cid", "names": [] }
          ]
        }
      ];
  deps: at-uri; cid;
*)
type feed_getRepostedBy_parameters = {
  uri : at_uri;
  cid : cid option;
  limit : int64 option;
  cursor : string option;
}

(*
  path: app.bsky.feed.getTimeline#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getTimeline",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "feed",
              "ocaml_key": "feed",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.getTimeline",
                    "names": [ "main", "output", "feed" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.feed.defs",
                      "names": [ "feedViewPost" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "feedViewPost" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#feedViewPost;
*)
type feed_getTimeline_output = {
  cursor : string option;
  feed : feed_feedViewPost list;
}

(*
  path: app.bsky.feed.getTimeline#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.feed.getTimeline",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "algorithm",
              "ocaml_key": "algorithm",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type feed_getTimeline_parameters = {
  algorithm : string option;
  limit : int64 option;
  cursor : string option;
}

(*
  path: app.bsky.feed.like;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.feed.like", "names": [ "main" ] },
          "description": null,
          "fields": [
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "com.atproto.repo.strongRef", "names": [ "main" ] }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.repo.strongRef", "names": [ "main" ] },
            { "nsid": "datetime", "names": [] }
          ]
        }
      ];
  deps: com.atproto.repo.strongRef; datetime;
*)
type feed_like = {subject : repo_strongRef; createdAt : datetime}

(*
  path: app.bsky.feed.post#textSlice;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.feed.post", "names": [ "textSlice" ] },
          "description": "Deprecated. Use app.bsky.richtext instead -- A text segment. Start is inclusive, end is exclusive. Indices are for utf16-encoded strings.",
          "fields": [
            {
              "key": "start",
              "ocaml_key": "start",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 0,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "end",
              "ocaml_key": "end_",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 0,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type feed_post_textSlice = {start : int64; end_ : int64}
[@@ocaml.doc
  "Deprecated. Use app.bsky.richtext instead -- A text segment. Start is \
   inclusive, end is exclusive. Indices are for utf16-encoded strings."]

(*
  path: app.bsky.feed.post#entity;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.feed.post", "names": [ "entity" ] },
          "description": "Deprecated: use facets instead.",
          "fields": [
            {
              "key": "index",
              "ocaml_key": "index",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.feed.post", "names": [ "textSlice" ] }
              ]
            },
            {
              "key": "type",
              "ocaml_key": "type_",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": "Expected values are 'mention' and 'link'.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "value",
              "ocaml_key": "value",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.feed.post", "names": [ "textSlice" ] }
          ]
        }
      ];
  deps: app.bsky.feed.post#textSlice;
*)
type feed_post_entity = {
  index : feed_post_textSlice;
  type_ : string;
  value : string;
}
[@@ocaml.doc "Deprecated: use facets instead."]

(*
  path: language;
  ty: [
        "Alias",
        {
          "path": { "nsid": "language", "names": [] },
          "ty": [
            "Format",
            {
              "format": "language",
              "description": null,
              "knownValues": null,
              "minLength": null,
              "maxLength": null,
              "maxGraphemes": null,
              "default": null
            }
          ],
          "deps": [ { "nsid": "language", "names": [] } ]
        }
      ];
  deps: language;
*)
type language = string

(*
  path: app.bsky.feed.post#replyRef;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.feed.post", "names": [ "replyRef" ] },
          "description": null,
          "fields": [
            {
              "key": "root",
              "ocaml_key": "root",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "com.atproto.repo.strongRef", "names": [ "main" ] }
              ]
            },
            {
              "key": "parent",
              "ocaml_key": "parent",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "com.atproto.repo.strongRef", "names": [ "main" ] }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.repo.strongRef", "names": [ "main" ] }
          ]
        }
      ];
  deps: com.atproto.repo.strongRef;
*)
type feed_post_replyRef = {root : repo_strongRef; parent : repo_strongRef}

(*
  path: app.bsky.feed.post#main/embed;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "app.bsky.feed.post",
            "names": [ "main", "embed" ]
          },
          "constrs": [
            {
              "ocaml_name": "Images",
              "path": {
                "nsid": "app.bsky.embed.images",
                "names": [ "main" ]
              }
            },
            {
              "ocaml_name": "External",
              "path": {
                "nsid": "app.bsky.embed.external",
                "names": [ "main" ]
              }
            },
            {
              "ocaml_name": "Record",
              "path": {
                "nsid": "app.bsky.embed.record",
                "names": [ "main" ]
              }
            },
            {
              "ocaml_name": "RecordWithMedia",
              "path": {
                "nsid": "app.bsky.embed.recordWithMedia",
                "names": [ "main" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "app.bsky.embed.images", "names": [ "main" ] },
            { "nsid": "app.bsky.embed.external", "names": [ "main" ] },
            { "nsid": "app.bsky.embed.record", "names": [ "main" ] },
            { "nsid": "app.bsky.embed.recordWithMedia", "names": [ "main" ] }
          ]
        }
      ];
  deps: app.bsky.embed.images; app.bsky.embed.external;
        app.bsky.embed.record; app.bsky.embed.recordWithMedia;
*)
type feed_post_embed =
  | Images of embed_images
  | External of embed_external
  | Record of embed_record
  | RecordWithMedia of embed_recordWithMedia

(*
  path: app.bsky.feed.post;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.feed.post", "names": [ "main" ] },
          "description": null,
          "fields": [
            {
              "key": "text",
              "ocaml_key": "text",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 3000,
                  "maxGraphemes": 300,
                  "default": null
                }
              ]
            },
            {
              "key": "entities",
              "ocaml_key": "entities",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.post",
                    "names": [ "main", "entities" ]
                  },
                  "description": "Deprecated: replaced by app.bsky.richtext.facet.",
                  "maxLength": null,
                  "items": [
                    "Ref",
                    { "nsid": "app.bsky.feed.post", "names": [ "entity" ] }
                  ]
                }
              ]
            },
            {
              "key": "facets",
              "ocaml_key": "facets",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.post",
                    "names": [ "main", "facets" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.richtext.facet",
                      "names": [ "main" ]
                    }
                  ]
                }
              ]
            },
            {
              "key": "reply",
              "ocaml_key": "reply",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.feed.post", "names": [ "replyRef" ] }
              ]
            },
            {
              "key": "embed",
              "ocaml_key": "embed",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "app.bsky.feed.post",
                  "names": [ "main", "embed" ]
                }
              ]
            },
            {
              "key": "langs",
              "ocaml_key": "langs",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.feed.post",
                    "names": [ "main", "langs" ]
                  },
                  "description": null,
                  "maxLength": 3,
                  "items": [
                    "Format",
                    {
                      "format": "language",
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.feed.post", "names": [ "entity" ] },
            { "nsid": "app.bsky.feed.post", "names": [ "main", "embed" ] },
            { "nsid": "app.bsky.feed.post", "names": [ "replyRef" ] },
            { "nsid": "app.bsky.richtext.facet", "names": [ "main" ] },
            { "nsid": "datetime", "names": [] },
            { "nsid": "language", "names": [] }
          ]
        }
      ];
  deps: app.bsky.feed.post#entity; app.bsky.feed.post#main/embed;
        app.bsky.feed.post#replyRef; app.bsky.richtext.facet; datetime;
        language;
*)
type feed_post = {
  text : string;
  entities : feed_post_entity list option;
  facets : richtext_facet list option;
  reply : feed_post_replyRef option;
  embed : feed_post_embed option;
  langs : language list option;
  createdAt : datetime;
}

(*
  path: app.bsky.feed.repost;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.feed.repost", "names": [ "main" ] },
          "description": null,
          "fields": [
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "com.atproto.repo.strongRef", "names": [ "main" ] }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.repo.strongRef", "names": [ "main" ] },
            { "nsid": "datetime", "names": [] }
          ]
        }
      ];
  deps: com.atproto.repo.strongRef; datetime;
*)
type feed_repost = {subject : repo_strongRef; createdAt : datetime}

(*
  path: app.bsky.graph.block;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.graph.block", "names": [ "main" ] },
          "description": null,
          "fields": [
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: datetime; did;
*)
type graph_block = {subject : did; createdAt : datetime}

(*
  path: app.bsky.graph.defs#listItemView;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.defs",
            "names": [ "listItemView" ]
          },
          "description": null,
          "fields": [
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileView;
*)
type graph_listItemView = {subject : actor_profileView}

(*
  path: app.bsky.graph.defs#modlist;
  ty: [
        "Alias",
        {
          "path": { "nsid": "app.bsky.graph.defs", "names": [ "modlist" ] },
          "ty": [
            "Token",
            {
              "description": "A list of actors to apply an aggregate moderation action (mute/block) on"
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type graph_modlist = string
[@@ocaml.doc
  "A list of actors to apply an aggregate moderation action (mute/block) on"]

(*
  path: app.bsky.graph.follow;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.graph.follow", "names": [ "main" ] },
          "description": null,
          "fields": [
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: datetime; did;
*)
type graph_follow = {subject : did; createdAt : datetime}

(*
  path: app.bsky.graph.getBlocks#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.getBlocks",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "blocks",
              "ocaml_key": "blocks",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.graph.getBlocks",
                    "names": [ "main", "output", "blocks" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.actor.defs",
                      "names": [ "profileView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileView;
*)
type graph_getBlocks_output = {
  cursor : string option;
  blocks : actor_profileView list;
}

(*
  path: app.bsky.graph.getBlocks#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.getBlocks",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type graph_getBlocks_parameters = {limit : int64 option; cursor : string option}

(*
  path: app.bsky.graph.getFollowers#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.getFollowers",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "followers",
              "ocaml_key": "followers",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.graph.getFollowers",
                    "names": [ "main", "output", "followers" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.actor.defs",
                      "names": [ "profileView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileView;
*)
type graph_getFollowers_output = {
  subject : actor_profileView;
  cursor : string option;
  followers : actor_profileView list;
}

(*
  path: app.bsky.graph.getFollowers#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.getFollowers",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "actor",
              "ocaml_key": "actor",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-identifier", "names": [] } ]
        }
      ];
  deps: at-identifier;
*)
type graph_getFollowers_parameters = {
  actor : at_identifier;
  limit : int64 option;
  cursor : string option;
}

(*
  path: app.bsky.graph.getFollows#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.getFollows",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "follows",
              "ocaml_key": "follows",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.graph.getFollows",
                    "names": [ "main", "output", "follows" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.actor.defs",
                      "names": [ "profileView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileView;
*)
type graph_getFollows_output = {
  subject : actor_profileView;
  cursor : string option;
  follows : actor_profileView list;
}

(*
  path: app.bsky.graph.getFollows#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.getFollows",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "actor",
              "ocaml_key": "actor",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-identifier", "names": [] } ]
        }
      ];
  deps: at-identifier;
*)
type graph_getFollows_parameters = {
  actor : at_identifier;
  limit : int64 option;
  cursor : string option;
}

(*
  path: app.bsky.graph.getList#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.getList",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "list",
              "ocaml_key": "list",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.graph.defs", "names": [ "listView" ] }
              ]
            },
            {
              "key": "items",
              "ocaml_key": "items",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.graph.getList",
                    "names": [ "main", "output", "items" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.graph.defs",
                      "names": [ "listItemView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.graph.defs", "names": [ "listItemView" ] },
            { "nsid": "app.bsky.graph.defs", "names": [ "listView" ] }
          ]
        }
      ];
  deps: app.bsky.graph.defs#listItemView; app.bsky.graph.defs#listView;
*)
type graph_getList_output = {
  cursor : string option;
  list : graph_listView;
  items : graph_listItemView list;
}

(*
  path: app.bsky.graph.getList#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.getList",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "list",
              "ocaml_key": "list",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type graph_getList_parameters = {
  list : at_uri;
  limit : int64 option;
  cursor : string option;
}

(*
  path: app.bsky.graph.getListMutes#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.getListMutes",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "lists",
              "ocaml_key": "lists",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.graph.getListMutes",
                    "names": [ "main", "output", "lists" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.graph.defs",
                      "names": [ "listView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.graph.defs", "names": [ "listView" ] }
          ]
        }
      ];
  deps: app.bsky.graph.defs#listView;
*)
type graph_getListMutes_output = {
  cursor : string option;
  lists : graph_listView list;
}

(*
  path: app.bsky.graph.getListMutes#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.getListMutes",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type graph_getListMutes_parameters = {
  limit : int64 option;
  cursor : string option;
}

(*
  path: app.bsky.graph.getLists#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.getLists",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "lists",
              "ocaml_key": "lists",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.graph.getLists",
                    "names": [ "main", "output", "lists" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.graph.defs",
                      "names": [ "listView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.graph.defs", "names": [ "listView" ] }
          ]
        }
      ];
  deps: app.bsky.graph.defs#listView;
*)
type graph_getLists_output = {
  cursor : string option;
  lists : graph_listView list;
}

(*
  path: app.bsky.graph.getLists#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.getLists",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "actor",
              "ocaml_key": "actor",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-identifier", "names": [] } ]
        }
      ];
  deps: at-identifier;
*)
type graph_getLists_parameters = {
  actor : at_identifier;
  limit : int64 option;
  cursor : string option;
}

(*
  path: app.bsky.graph.getMutes#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.getMutes",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "mutes",
              "ocaml_key": "mutes",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.graph.getMutes",
                    "names": [ "main", "output", "mutes" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.actor.defs",
                      "names": [ "profileView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileView;
*)
type graph_getMutes_output = {
  cursor : string option;
  mutes : actor_profileView list;
}

(*
  path: app.bsky.graph.getMutes#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.getMutes",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type graph_getMutes_parameters = {limit : int64 option; cursor : string option}

(*
  path: app.bsky.graph.list;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.graph.list", "names": [ "main" ] },
          "description": null,
          "fields": [
            {
              "key": "purpose",
              "ocaml_key": "purpose",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.graph.defs", "names": [ "listPurpose" ] }
              ]
            },
            {
              "key": "name",
              "ocaml_key": "name",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": 1,
                  "maxLength": 64,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "description",
              "ocaml_key": "description",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 3000,
                  "maxGraphemes": 300,
                  "default": null
                }
              ]
            },
            {
              "key": "descriptionFacets",
              "ocaml_key": "descriptionFacets",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.graph.list",
                    "names": [ "main", "descriptionFacets" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.richtext.facet",
                      "names": [ "main" ]
                    }
                  ]
                }
              ]
            },
            {
              "key": "avatar",
              "ocaml_key": "avatar",
              "optional": true,
              "nullable": false,
              "ty": [
                "Blob",
                {
                  "accept": [ "image/png", "image/jpeg" ],
                  "maxSize": 1000000
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.graph.defs", "names": [ "listPurpose" ] },
            { "nsid": "app.bsky.richtext.facet", "names": [ "main" ] },
            { "nsid": "datetime", "names": [] }
          ]
        }
      ];
  deps: app.bsky.graph.defs#listPurpose; app.bsky.richtext.facet; datetime;
*)
type graph_list = {
  purpose : graph_listPurpose;
  name : string;
  description : string option;
  descriptionFacets : richtext_facet list option;
  avatar : blob option;
  createdAt : datetime;
}

(*
  path: app.bsky.graph.listitem;
  ty: [
        "Object",
        {
          "path": { "nsid": "app.bsky.graph.listitem", "names": [ "main" ] },
          "description": null,
          "fields": [
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "list",
              "ocaml_key": "list",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-uri", "names": [] },
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: at-uri; datetime; did;
*)
type graph_listitem = {subject : did; list : at_uri; createdAt : datetime}

(*
  path: app.bsky.graph.muteActor#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.muteActor",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "actor",
              "ocaml_key": "actor",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-identifier", "names": [] } ]
        }
      ];
  deps: at-identifier;
*)
type graph_muteActor_input = {actor : at_identifier}

(*
  path: app.bsky.graph.muteActorList#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.muteActorList",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "list",
              "ocaml_key": "list",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type graph_muteActorList_input = {list : at_uri}

(*
  path: app.bsky.graph.unmuteActor#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.unmuteActor",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "actor",
              "ocaml_key": "actor",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-identifier", "names": [] } ]
        }
      ];
  deps: at-identifier;
*)
type graph_unmuteActor_input = {actor : at_identifier}

(*
  path: app.bsky.graph.unmuteActorList#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.graph.unmuteActorList",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "list",
              "ocaml_key": "list",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type graph_unmuteActorList_input = {list : at_uri}

(*
  path: app.bsky.notification.getUnreadCount#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.notification.getUnreadCount",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "count",
              "ocaml_key": "count",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type notification_getUnreadCount_output = {count : int64}

(*
  path: app.bsky.notification.getUnreadCount#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.notification.getUnreadCount",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "seenAt",
              "ocaml_key": "seenAt",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "datetime", "names": [] } ]
        }
      ];
  deps: datetime;
*)
type notification_getUnreadCount_parameters = {seenAt : datetime option}

(*
  path: app.bsky.notification.listNotifications#notification;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.notification.listNotifications",
            "names": [ "notification" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "author",
              "ocaml_key": "author",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] }
              ]
            },
            {
              "key": "reason",
              "ocaml_key": "reason",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": "Expected values are 'like', 'repost', 'follow', 'mention', 'reply', and 'quote'.",
                  "knownValues": [
                    "like", "repost", "follow", "mention", "reply", "quote"
                  ],
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "reasonSubject",
              "ocaml_key": "reasonSubject",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "record",
              "ocaml_key": "record",
              "optional": false,
              "nullable": false,
              "ty": [ "Unknown", { "description": null } ]
            },
            {
              "key": "isRead",
              "ocaml_key": "isRead",
              "optional": false,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": null, "const": null }
              ]
            },
            {
              "key": "indexedAt",
              "ocaml_key": "indexedAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "labels",
              "ocaml_key": "labels",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.notification.listNotifications",
                    "names": [ "notification", "labels" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.label.defs",
                      "names": [ "label" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.actor.defs", "names": [ "profileView" ] },
            { "nsid": "at-uri", "names": [] },
            { "nsid": "cid", "names": [] },
            { "nsid": "com.atproto.label.defs", "names": [ "label" ] },
            { "nsid": "datetime", "names": [] }
          ]
        }
      ];
  deps: app.bsky.actor.defs#profileView; at-uri; cid;
        com.atproto.label.defs#label; datetime;
*)
type notification_listNotifications_notification = {
  uri : at_uri;
  cid : cid;
  author : actor_profileView;
  reason : string;
  reasonSubject : at_uri option;
  record : unknown;
  isRead : bool;
  indexedAt : datetime;
  labels : label_label list option;
}

(*
  path: app.bsky.notification.listNotifications#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.notification.listNotifications",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "notifications",
              "ocaml_key": "notifications",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.notification.listNotifications",
                    "names": [ "main", "output", "notifications" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.notification.listNotifications",
                      "names": [ "notification" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "app.bsky.notification.listNotifications",
              "names": [ "notification" ]
            }
          ]
        }
      ];
  deps: app.bsky.notification.listNotifications#notification;
*)
type notification_listNotifications_output = {
  cursor : string option;
  notifications : notification_listNotifications_notification list;
}

(*
  path: app.bsky.notification.listNotifications#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.notification.listNotifications",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "seenAt",
              "ocaml_key": "seenAt",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "datetime", "names": [] } ]
        }
      ];
  deps: datetime;
*)
type notification_listNotifications_parameters = {
  limit : int64 option;
  cursor : string option;
  seenAt : datetime option;
}

(*
  path: app.bsky.notification.updateSeen#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.notification.updateSeen",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "seenAt",
              "ocaml_key": "seenAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "datetime", "names": [] } ]
        }
      ];
  deps: datetime;
*)
type notification_updateSeen_input = {seenAt : datetime}

(*
  path: app.bsky.unspecced.getPopular#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.unspecced.getPopular",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "feed",
              "ocaml_key": "feed",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.unspecced.getPopular",
                    "names": [ "main", "output", "feed" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.feed.defs",
                      "names": [ "feedViewPost" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "feedViewPost" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#feedViewPost;
*)
type unspecced_getPopular_output = {
  cursor : string option;
  feed : feed_feedViewPost list;
}

(*
  path: app.bsky.unspecced.getPopular#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.unspecced.getPopular",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "includeNsfw",
              "ocaml_key": "includeNsfw",
              "optional": true,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": false, "const": null }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type unspecced_getPopular_parameters = {
  includeNsfw : bool option;
  limit : int64 option;
  cursor : string option;
}

(*
  path: app.bsky.unspecced.getPopularFeedGenerators#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.unspecced.getPopularFeedGenerators",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "feeds",
              "ocaml_key": "feeds",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.unspecced.getPopularFeedGenerators",
                    "names": [ "main", "output", "feeds" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.feed.defs",
                      "names": [ "generatorView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "generatorView" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#generatorView;
*)
type unspecced_getPopularFeedGenerators_output = {
  feeds : feed_generatorView list;
}

(*
  path: app.bsky.unspecced.getTimelineSkeleton#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.unspecced.getTimelineSkeleton",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "feed",
              "ocaml_key": "feed",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "app.bsky.unspecced.getTimelineSkeleton",
                    "names": [ "main", "output", "feed" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "app.bsky.feed.defs",
                      "names": [ "skeletonFeedPost" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "app.bsky.feed.defs", "names": [ "skeletonFeedPost" ] }
          ]
        }
      ];
  deps: app.bsky.feed.defs#skeletonFeedPost;
*)
type unspecced_getTimelineSkeleton_output = {
  cursor : string option;
  feed : feed_skeletonFeedPost list;
}

(*
  path: app.bsky.unspecced.getTimelineSkeleton#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "app.bsky.unspecced.getTimelineSkeleton",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type unspecced_getTimelineSkeleton_parameters = {
  limit : int64 option;
  cursor : string option;
}

(*
  path: com.atproto.admin.defs#acknowledge;
  ty: [
        "Alias",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "acknowledge" ]
          },
          "ty": [
            "Token",
            {
              "description": "Moderation action type: Acknowledge. Indicates that the content was reviewed and not considered to violate PDS rules."
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type admin_acknowledge = string
[@@ocaml.doc
  "Moderation action type: Acknowledge. Indicates that the content was \
   reviewed and not considered to violate PDS rules."]

(*
  path: com.atproto.admin.defs#actionReversal;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "actionReversal" ]
          },
          "description": null,
          "fields": [
            {
              "key": "reason",
              "ocaml_key": "reason",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdBy",
              "ocaml_key": "createdBy",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: datetime; did;
*)
type admin_actionReversal = {
  reason : string;
  createdBy : did;
  createdAt : datetime;
}

(*
  path: com.atproto.admin.defs#actionType;
  ty: [
        "Alias",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "actionType" ]
          },
          "ty": [
            "String",
            {
              "description": null,
              "knownValues": [
                "#takedown", "#flag", "#acknowledge", "#escalate"
              ],
              "minLength": null,
              "maxLength": null,
              "maxGraphemes": null,
              "default": null
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type admin_actionType = string

(*
  path: com.atproto.admin.defs#repoRef;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "repoRef" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "did", "names": [] } ]
        }
      ];
  deps: did;
*)
type admin_repoRef = {did : did}

(*
  path: com.atproto.admin.defs#actionView/subject;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "actionView", "subject" ]
          },
          "constrs": [
            {
              "ocaml_name": "RepoRef",
              "path": {
                "nsid": "com.atproto.admin.defs",
                "names": [ "repoRef" ]
              }
            },
            {
              "ocaml_name": "StrongRef",
              "path": {
                "nsid": "com.atproto.repo.strongRef",
                "names": [ "main" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "com.atproto.admin.defs", "names": [ "repoRef" ] },
            { "nsid": "com.atproto.repo.strongRef", "names": [ "main" ] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#repoRef; com.atproto.repo.strongRef;
*)
type admin_actionView_subject =
  | RepoRef of admin_repoRef
  | StrongRef of repo_strongRef

(*
  path: com.atproto.admin.defs#actionView;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "actionView" ]
          },
          "description": null,
          "fields": [
            {
              "key": "id",
              "ocaml_key": "id",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "action",
              "ocaml_key": "action",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "actionType" ]
                }
              ]
            },
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "actionView", "subject" ]
                }
              ]
            },
            {
              "key": "subjectBlobCids",
              "ocaml_key": "subjectBlobCids",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "actionView", "subjectBlobCids" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "String",
                    {
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "createLabelVals",
              "ocaml_key": "createLabelVals",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "actionView", "createLabelVals" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "String",
                    {
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "negateLabelVals",
              "ocaml_key": "negateLabelVals",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "actionView", "negateLabelVals" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "String",
                    {
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "reason",
              "ocaml_key": "reason",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdBy",
              "ocaml_key": "createdBy",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "reversal",
              "ocaml_key": "reversal",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "actionReversal" ]
                }
              ]
            },
            {
              "key": "resolvedReportIds",
              "ocaml_key": "resolvedReportIds",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "actionView", "resolvedReportIds" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Integer",
                    {
                      "minimum": null,
                      "maximum": null,
                      "default": null,
                      "description": null
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "com.atproto.admin.defs",
              "names": [ "actionReversal" ]
            },
            { "nsid": "com.atproto.admin.defs", "names": [ "actionType" ] },
            {
              "nsid": "com.atproto.admin.defs",
              "names": [ "actionView", "subject" ]
            },
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#actionReversal;
        com.atproto.admin.defs#actionType;
        com.atproto.admin.defs#actionView/subject; datetime; did;
*)
type admin_actionView = {
  id : int64;
  action : admin_actionType;
  subject : admin_actionView_subject;
  subjectBlobCids : string list;
  createLabelVals : string list option;
  negateLabelVals : string list option;
  reason : string;
  createdBy : did;
  createdAt : datetime;
  reversal : admin_actionReversal option;
  resolvedReportIds : int64 list;
}

(*
  path: com.atproto.admin.defs#actionViewCurrent;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "actionViewCurrent" ]
          },
          "description": null,
          "fields": [
            {
              "key": "id",
              "ocaml_key": "id",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "action",
              "ocaml_key": "action",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "actionType" ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.admin.defs", "names": [ "actionType" ] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#actionType;
*)
type admin_actionViewCurrent = {id : int64; action : admin_actionType}

(*
  path: com.atproto.moderation.defs#reasonType;
  ty: [
        "Alias",
        {
          "path": {
            "nsid": "com.atproto.moderation.defs",
            "names": [ "reasonType" ]
          },
          "ty": [
            "String",
            {
              "description": null,
              "knownValues": [
                "com.atproto.moderation.defs#reasonSpam",
                "com.atproto.moderation.defs#reasonViolation",
                "com.atproto.moderation.defs#reasonMisleading",
                "com.atproto.moderation.defs#reasonSexual",
                "com.atproto.moderation.defs#reasonRude",
                "com.atproto.moderation.defs#reasonOther"
              ],
              "minLength": null,
              "maxLength": null,
              "maxGraphemes": null,
              "default": null
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type moderation_reasonType = string

(*
  path: com.atproto.admin.defs#reportView/subject;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "reportView", "subject" ]
          },
          "constrs": [
            {
              "ocaml_name": "RepoRef",
              "path": {
                "nsid": "com.atproto.admin.defs",
                "names": [ "repoRef" ]
              }
            },
            {
              "ocaml_name": "StrongRef",
              "path": {
                "nsid": "com.atproto.repo.strongRef",
                "names": [ "main" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "com.atproto.admin.defs", "names": [ "repoRef" ] },
            { "nsid": "com.atproto.repo.strongRef", "names": [ "main" ] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#repoRef; com.atproto.repo.strongRef;
*)
type admin_reportView_subject =
  | RepoRef of admin_repoRef
  | StrongRef of repo_strongRef

(*
  path: com.atproto.admin.defs#reportView;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "reportView" ]
          },
          "description": null,
          "fields": [
            {
              "key": "id",
              "ocaml_key": "id",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "reasonType",
              "ocaml_key": "reasonType",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.moderation.defs",
                  "names": [ "reasonType" ]
                }
              ]
            },
            {
              "key": "reason",
              "ocaml_key": "reason",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "subjectRepoHandle",
              "ocaml_key": "subjectRepoHandle",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "reportView", "subject" ]
                }
              ]
            },
            {
              "key": "reportedBy",
              "ocaml_key": "reportedBy",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "resolvedByActionIds",
              "ocaml_key": "resolvedByActionIds",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "reportView", "resolvedByActionIds" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Integer",
                    {
                      "minimum": null,
                      "maximum": null,
                      "default": null,
                      "description": null
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "com.atproto.admin.defs",
              "names": [ "reportView", "subject" ]
            },
            {
              "nsid": "com.atproto.moderation.defs",
              "names": [ "reasonType" ]
            },
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#reportView/subject;
        com.atproto.moderation.defs#reasonType; datetime; did;
*)
type admin_reportView = {
  id : int64;
  reasonType : moderation_reasonType;
  reason : string option;
  subjectRepoHandle : string option;
  subject : admin_reportView_subject;
  reportedBy : did;
  createdAt : datetime;
  resolvedByActionIds : int64 list;
}

(*
  path: com.atproto.admin.defs#moderation;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "moderation" ]
          },
          "description": null,
          "fields": [
            {
              "key": "currentAction",
              "ocaml_key": "currentAction",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "actionViewCurrent" ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "com.atproto.admin.defs",
              "names": [ "actionViewCurrent" ]
            }
          ]
        }
      ];
  deps: com.atproto.admin.defs#actionViewCurrent;
*)
type admin_moderation = {currentAction : admin_actionViewCurrent option}

(*
  path: com.atproto.admin.defs#videoDetails;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "videoDetails" ]
          },
          "description": null,
          "fields": [
            {
              "key": "width",
              "ocaml_key": "width",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "height",
              "ocaml_key": "height",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "length",
              "ocaml_key": "length",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type admin_videoDetails = {width : int64; height : int64; length : int64}

(*
  path: com.atproto.admin.defs#imageDetails;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "imageDetails" ]
          },
          "description": null,
          "fields": [
            {
              "key": "width",
              "ocaml_key": "width",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "height",
              "ocaml_key": "height",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type admin_imageDetails = {width : int64; height : int64}

(*
  path: com.atproto.admin.defs#blobView/details;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "blobView", "details" ]
          },
          "constrs": [
            {
              "ocaml_name": "ImageDetails",
              "path": {
                "nsid": "com.atproto.admin.defs",
                "names": [ "imageDetails" ]
              }
            },
            {
              "ocaml_name": "VideoDetails",
              "path": {
                "nsid": "com.atproto.admin.defs",
                "names": [ "videoDetails" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "com.atproto.admin.defs", "names": [ "imageDetails" ] },
            { "nsid": "com.atproto.admin.defs", "names": [ "videoDetails" ] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#imageDetails;
        com.atproto.admin.defs#videoDetails;
*)
type admin_blobView_details =
  | ImageDetails of admin_imageDetails
  | VideoDetails of admin_videoDetails

(*
  path: com.atproto.admin.defs#blobView;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "blobView" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "mimeType",
              "ocaml_key": "mimeType",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "size",
              "ocaml_key": "size",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "details",
              "ocaml_key": "details",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "blobView", "details" ]
                }
              ]
            },
            {
              "key": "moderation",
              "ocaml_key": "moderation",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "moderation" ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "cid", "names": [] },
            {
              "nsid": "com.atproto.admin.defs",
              "names": [ "blobView", "details" ]
            },
            { "nsid": "com.atproto.admin.defs", "names": [ "moderation" ] },
            { "nsid": "datetime", "names": [] }
          ]
        }
      ];
  deps: cid; com.atproto.admin.defs#blobView/details;
        com.atproto.admin.defs#moderation; datetime;
*)
type admin_blobView = {
  cid : cid;
  mimeType : string;
  size : int64;
  createdAt : datetime;
  details : admin_blobView_details option;
  moderation : admin_moderation option;
}

(*
  path: com.atproto.admin.defs#repoViewNotFound;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "repoViewNotFound" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "did", "names": [] } ]
        }
      ];
  deps: did;
*)
type admin_repoViewNotFound = {did : did}

(*
  path: com.atproto.server.defs#inviteCodeUse;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.defs",
            "names": [ "inviteCodeUse" ]
          },
          "description": null,
          "fields": [
            {
              "key": "usedBy",
              "ocaml_key": "usedBy",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "usedAt",
              "ocaml_key": "usedAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: datetime; did;
*)
type server_inviteCodeUse = {usedBy : did; usedAt : datetime}

(*
  path: com.atproto.server.defs#inviteCode;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.defs",
            "names": [ "inviteCode" ]
          },
          "description": null,
          "fields": [
            {
              "key": "code",
              "ocaml_key": "code",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "available",
              "ocaml_key": "available",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "disabled",
              "ocaml_key": "disabled",
              "optional": false,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": null, "const": null }
              ]
            },
            {
              "key": "forAccount",
              "ocaml_key": "forAccount",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdBy",
              "ocaml_key": "createdBy",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "uses",
              "ocaml_key": "uses",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.server.defs",
                    "names": [ "inviteCode", "uses" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.server.defs",
                      "names": [ "inviteCodeUse" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "com.atproto.server.defs",
              "names": [ "inviteCodeUse" ]
            },
            { "nsid": "datetime", "names": [] }
          ]
        }
      ];
  deps: com.atproto.server.defs#inviteCodeUse; datetime;
*)
type server_inviteCode = {
  code : string;
  available : int64;
  disabled : bool;
  forAccount : string;
  createdBy : string;
  createdAt : datetime;
  uses : server_inviteCodeUse list;
}

(*
  path: com.atproto.admin.defs#repoView;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "repoView" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "handle",
              "ocaml_key": "handle",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "handle",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "email",
              "ocaml_key": "email",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "relatedRecords",
              "ocaml_key": "relatedRecords",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "repoView", "relatedRecords" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [ "Unknown", { "description": null } ]
                }
              ]
            },
            {
              "key": "indexedAt",
              "ocaml_key": "indexedAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "moderation",
              "ocaml_key": "moderation",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "moderation" ]
                }
              ]
            },
            {
              "key": "invitedBy",
              "ocaml_key": "invitedBy",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.server.defs",
                  "names": [ "inviteCode" ]
                }
              ]
            },
            {
              "key": "invitesDisabled",
              "ocaml_key": "invitesDisabled",
              "optional": true,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": null, "const": null }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.admin.defs", "names": [ "moderation" ] },
            { "nsid": "com.atproto.server.defs", "names": [ "inviteCode" ] },
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] },
            { "nsid": "handle", "names": [] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#moderation;
        com.atproto.server.defs#inviteCode; datetime; did; handle;
*)
type admin_repoView = {
  did : did;
  handle : handle;
  email : string option;
  relatedRecords : unknown list;
  indexedAt : datetime;
  moderation : admin_moderation;
  invitedBy : server_inviteCode option;
  invitesDisabled : bool option;
}

(*
  path: com.atproto.admin.defs#recordViewNotFound;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "recordViewNotFound" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-uri", "names": [] } ]
        }
      ];
  deps: at-uri;
*)
type admin_recordViewNotFound = {uri : at_uri}

(*
  path: com.atproto.admin.defs#recordView;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "recordView" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "value",
              "ocaml_key": "value",
              "optional": false,
              "nullable": false,
              "ty": [ "Unknown", { "description": null } ]
            },
            {
              "key": "blobCids",
              "ocaml_key": "blobCids",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "recordView", "blobCids" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Format",
                    {
                      "format": "cid",
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "indexedAt",
              "ocaml_key": "indexedAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "moderation",
              "ocaml_key": "moderation",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "moderation" ]
                }
              ]
            },
            {
              "key": "repo",
              "ocaml_key": "repo",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "com.atproto.admin.defs", "names": [ "repoView" ] }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-uri", "names": [] },
            { "nsid": "cid", "names": [] },
            { "nsid": "com.atproto.admin.defs", "names": [ "moderation" ] },
            { "nsid": "com.atproto.admin.defs", "names": [ "repoView" ] },
            { "nsid": "datetime", "names": [] }
          ]
        }
      ];
  deps: at-uri; cid; com.atproto.admin.defs#moderation;
        com.atproto.admin.defs#repoView; datetime;
*)
type admin_recordView = {
  uri : at_uri;
  cid : cid;
  value : unknown;
  blobCids : cid list;
  indexedAt : datetime;
  moderation : admin_moderation;
  repo : admin_repoView;
}

(*
  path: com.atproto.admin.defs#actionViewDetail/subject;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "actionViewDetail", "subject" ]
          },
          "constrs": [
            {
              "ocaml_name": "RepoView",
              "path": {
                "nsid": "com.atproto.admin.defs",
                "names": [ "repoView" ]
              }
            },
            {
              "ocaml_name": "RepoViewNotFound",
              "path": {
                "nsid": "com.atproto.admin.defs",
                "names": [ "repoViewNotFound" ]
              }
            },
            {
              "ocaml_name": "RecordView",
              "path": {
                "nsid": "com.atproto.admin.defs",
                "names": [ "recordView" ]
              }
            },
            {
              "ocaml_name": "RecordViewNotFound",
              "path": {
                "nsid": "com.atproto.admin.defs",
                "names": [ "recordViewNotFound" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "com.atproto.admin.defs", "names": [ "repoView" ] },
            {
              "nsid": "com.atproto.admin.defs",
              "names": [ "repoViewNotFound" ]
            },
            { "nsid": "com.atproto.admin.defs", "names": [ "recordView" ] },
            {
              "nsid": "com.atproto.admin.defs",
              "names": [ "recordViewNotFound" ]
            }
          ]
        }
      ];
  deps: com.atproto.admin.defs#repoView;
        com.atproto.admin.defs#repoViewNotFound;
        com.atproto.admin.defs#recordView;
        com.atproto.admin.defs#recordViewNotFound;
*)
type admin_actionViewDetail_subject =
  | RepoView of admin_repoView
  | RepoViewNotFound of admin_repoViewNotFound
  | RecordView of admin_recordView
  | RecordViewNotFound of admin_recordViewNotFound

(*
  path: com.atproto.admin.defs#actionViewDetail;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "actionViewDetail" ]
          },
          "description": null,
          "fields": [
            {
              "key": "id",
              "ocaml_key": "id",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "action",
              "ocaml_key": "action",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "actionType" ]
                }
              ]
            },
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "actionViewDetail", "subject" ]
                }
              ]
            },
            {
              "key": "subjectBlobs",
              "ocaml_key": "subjectBlobs",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "actionViewDetail", "subjectBlobs" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.admin.defs",
                      "names": [ "blobView" ]
                    }
                  ]
                }
              ]
            },
            {
              "key": "createLabelVals",
              "ocaml_key": "createLabelVals",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "actionViewDetail", "createLabelVals" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "String",
                    {
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "negateLabelVals",
              "ocaml_key": "negateLabelVals",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "actionViewDetail", "negateLabelVals" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "String",
                    {
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "reason",
              "ocaml_key": "reason",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdBy",
              "ocaml_key": "createdBy",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "reversal",
              "ocaml_key": "reversal",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "actionReversal" ]
                }
              ]
            },
            {
              "key": "resolvedReports",
              "ocaml_key": "resolvedReports",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "actionViewDetail", "resolvedReports" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.admin.defs",
                      "names": [ "reportView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "com.atproto.admin.defs",
              "names": [ "actionReversal" ]
            },
            { "nsid": "com.atproto.admin.defs", "names": [ "actionType" ] },
            {
              "nsid": "com.atproto.admin.defs",
              "names": [ "actionViewDetail", "subject" ]
            },
            { "nsid": "com.atproto.admin.defs", "names": [ "blobView" ] },
            { "nsid": "com.atproto.admin.defs", "names": [ "reportView" ] },
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#actionReversal;
        com.atproto.admin.defs#actionType;
        com.atproto.admin.defs#actionViewDetail/subject;
        com.atproto.admin.defs#blobView; com.atproto.admin.defs#reportView;
        datetime; did;
*)
type admin_actionViewDetail = {
  id : int64;
  action : admin_actionType;
  subject : admin_actionViewDetail_subject;
  subjectBlobs : admin_blobView list;
  createLabelVals : string list option;
  negateLabelVals : string list option;
  reason : string;
  createdBy : did;
  createdAt : datetime;
  reversal : admin_actionReversal option;
  resolvedReports : admin_reportView list;
}

(*
  path: com.atproto.admin.defs#escalate;
  ty: [
        "Alias",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "escalate" ]
          },
          "ty": [
            "Token",
            {
              "description": "Moderation action type: Escalate. Indicates that the content has been flagged for additional review."
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type admin_escalate = string
[@@ocaml.doc
  "Moderation action type: Escalate. Indicates that the content has been \
   flagged for additional review."]

(*
  path: com.atproto.admin.defs#flag;
  ty: [
        "Alias",
        {
          "path": { "nsid": "com.atproto.admin.defs", "names": [ "flag" ] },
          "ty": [
            "Token",
            {
              "description": "Moderation action type: Flag. Indicates that the content was reviewed and considered to violate PDS rules, but may still be served."
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type admin_flag = string
[@@ocaml.doc
  "Moderation action type: Flag. Indicates that the content was reviewed and \
   considered to violate PDS rules, but may still be served."]

(*
  path: com.atproto.admin.defs#moderationDetail;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "moderationDetail" ]
          },
          "description": null,
          "fields": [
            {
              "key": "currentAction",
              "ocaml_key": "currentAction",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "actionViewCurrent" ]
                }
              ]
            },
            {
              "key": "actions",
              "ocaml_key": "actions",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "moderationDetail", "actions" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.admin.defs",
                      "names": [ "actionView" ]
                    }
                  ]
                }
              ]
            },
            {
              "key": "reports",
              "ocaml_key": "reports",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "moderationDetail", "reports" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.admin.defs",
                      "names": [ "reportView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.admin.defs", "names": [ "actionView" ] },
            {
              "nsid": "com.atproto.admin.defs",
              "names": [ "actionViewCurrent" ]
            },
            { "nsid": "com.atproto.admin.defs", "names": [ "reportView" ] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#actionView;
        com.atproto.admin.defs#actionViewCurrent;
        com.atproto.admin.defs#reportView;
*)
type admin_moderationDetail = {
  currentAction : admin_actionViewCurrent option;
  actions : admin_actionView list;
  reports : admin_reportView list;
}

(*
  path: com.atproto.admin.defs#recordViewDetail;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "recordViewDetail" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "value",
              "ocaml_key": "value",
              "optional": false,
              "nullable": false,
              "ty": [ "Unknown", { "description": null } ]
            },
            {
              "key": "blobs",
              "ocaml_key": "blobs",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "recordViewDetail", "blobs" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.admin.defs",
                      "names": [ "blobView" ]
                    }
                  ]
                }
              ]
            },
            {
              "key": "labels",
              "ocaml_key": "labels",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "recordViewDetail", "labels" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.label.defs",
                      "names": [ "label" ]
                    }
                  ]
                }
              ]
            },
            {
              "key": "indexedAt",
              "ocaml_key": "indexedAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "moderation",
              "ocaml_key": "moderation",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "moderationDetail" ]
                }
              ]
            },
            {
              "key": "repo",
              "ocaml_key": "repo",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                { "nsid": "com.atproto.admin.defs", "names": [ "repoView" ] }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-uri", "names": [] },
            { "nsid": "cid", "names": [] },
            { "nsid": "com.atproto.admin.defs", "names": [ "blobView" ] },
            {
              "nsid": "com.atproto.admin.defs",
              "names": [ "moderationDetail" ]
            },
            { "nsid": "com.atproto.admin.defs", "names": [ "repoView" ] },
            { "nsid": "com.atproto.label.defs", "names": [ "label" ] },
            { "nsid": "datetime", "names": [] }
          ]
        }
      ];
  deps: at-uri; cid; com.atproto.admin.defs#blobView;
        com.atproto.admin.defs#moderationDetail;
        com.atproto.admin.defs#repoView; com.atproto.label.defs#label;
        datetime;
*)
type admin_recordViewDetail = {
  uri : at_uri;
  cid : cid;
  value : unknown;
  blobs : admin_blobView list;
  labels : label_label list option;
  indexedAt : datetime;
  moderation : admin_moderationDetail;
  repo : admin_repoView;
}

(*
  path: com.atproto.admin.defs#repoViewDetail;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "repoViewDetail" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "handle",
              "ocaml_key": "handle",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "handle",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "email",
              "ocaml_key": "email",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "relatedRecords",
              "ocaml_key": "relatedRecords",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "repoViewDetail", "relatedRecords" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [ "Unknown", { "description": null } ]
                }
              ]
            },
            {
              "key": "indexedAt",
              "ocaml_key": "indexedAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "moderation",
              "ocaml_key": "moderation",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "moderationDetail" ]
                }
              ]
            },
            {
              "key": "labels",
              "ocaml_key": "labels",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "repoViewDetail", "labels" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.label.defs",
                      "names": [ "label" ]
                    }
                  ]
                }
              ]
            },
            {
              "key": "invitedBy",
              "ocaml_key": "invitedBy",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.server.defs",
                  "names": [ "inviteCode" ]
                }
              ]
            },
            {
              "key": "invites",
              "ocaml_key": "invites",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "repoViewDetail", "invites" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.server.defs",
                      "names": [ "inviteCode" ]
                    }
                  ]
                }
              ]
            },
            {
              "key": "invitesDisabled",
              "ocaml_key": "invitesDisabled",
              "optional": true,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": null, "const": null }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "com.atproto.admin.defs",
              "names": [ "moderationDetail" ]
            },
            { "nsid": "com.atproto.label.defs", "names": [ "label" ] },
            { "nsid": "com.atproto.server.defs", "names": [ "inviteCode" ] },
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] },
            { "nsid": "handle", "names": [] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#moderationDetail;
        com.atproto.label.defs#label; com.atproto.server.defs#inviteCode;
        datetime; did; handle;
*)
type admin_repoViewDetail = {
  did : did;
  handle : handle;
  email : string option;
  relatedRecords : unknown list;
  indexedAt : datetime;
  moderation : admin_moderationDetail;
  labels : label_label list option;
  invitedBy : server_inviteCode option;
  invites : server_inviteCode list option;
  invitesDisabled : bool option;
}

(*
  path: com.atproto.admin.defs#reportViewDetail/subject;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "reportViewDetail", "subject" ]
          },
          "constrs": [
            {
              "ocaml_name": "RepoView",
              "path": {
                "nsid": "com.atproto.admin.defs",
                "names": [ "repoView" ]
              }
            },
            {
              "ocaml_name": "RepoViewNotFound",
              "path": {
                "nsid": "com.atproto.admin.defs",
                "names": [ "repoViewNotFound" ]
              }
            },
            {
              "ocaml_name": "RecordView",
              "path": {
                "nsid": "com.atproto.admin.defs",
                "names": [ "recordView" ]
              }
            },
            {
              "ocaml_name": "RecordViewNotFound",
              "path": {
                "nsid": "com.atproto.admin.defs",
                "names": [ "recordViewNotFound" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "com.atproto.admin.defs", "names": [ "repoView" ] },
            {
              "nsid": "com.atproto.admin.defs",
              "names": [ "repoViewNotFound" ]
            },
            { "nsid": "com.atproto.admin.defs", "names": [ "recordView" ] },
            {
              "nsid": "com.atproto.admin.defs",
              "names": [ "recordViewNotFound" ]
            }
          ]
        }
      ];
  deps: com.atproto.admin.defs#repoView;
        com.atproto.admin.defs#repoViewNotFound;
        com.atproto.admin.defs#recordView;
        com.atproto.admin.defs#recordViewNotFound;
*)
type admin_reportViewDetail_subject =
  | RepoView of admin_repoView
  | RepoViewNotFound of admin_repoViewNotFound
  | RecordView of admin_recordView
  | RecordViewNotFound of admin_recordViewNotFound

(*
  path: com.atproto.admin.defs#reportViewDetail;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "reportViewDetail" ]
          },
          "description": null,
          "fields": [
            {
              "key": "id",
              "ocaml_key": "id",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "reasonType",
              "ocaml_key": "reasonType",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.moderation.defs",
                  "names": [ "reasonType" ]
                }
              ]
            },
            {
              "key": "reason",
              "ocaml_key": "reason",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.defs",
                  "names": [ "reportViewDetail", "subject" ]
                }
              ]
            },
            {
              "key": "reportedBy",
              "ocaml_key": "reportedBy",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "resolvedByActions",
              "ocaml_key": "resolvedByActions",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.defs",
                    "names": [ "reportViewDetail", "resolvedByActions" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.admin.defs",
                      "names": [ "actionView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.admin.defs", "names": [ "actionView" ] },
            {
              "nsid": "com.atproto.admin.defs",
              "names": [ "reportViewDetail", "subject" ]
            },
            {
              "nsid": "com.atproto.moderation.defs",
              "names": [ "reasonType" ]
            },
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#actionView;
        com.atproto.admin.defs#reportViewDetail/subject;
        com.atproto.moderation.defs#reasonType; datetime; did;
*)
type admin_reportViewDetail = {
  id : int64;
  reasonType : moderation_reasonType;
  reason : string option;
  subject : admin_reportViewDetail_subject;
  reportedBy : did;
  createdAt : datetime;
  resolvedByActions : admin_actionView list;
}

(*
  path: com.atproto.admin.defs#takedown;
  ty: [
        "Alias",
        {
          "path": {
            "nsid": "com.atproto.admin.defs",
            "names": [ "takedown" ]
          },
          "ty": [
            "Token",
            {
              "description": "Moderation action type: Takedown. Indicates that content should not be served by the PDS."
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type admin_takedown = string
[@@ocaml.doc
  "Moderation action type: Takedown. Indicates that content should not be \
   served by the PDS."]

(*
  path: com.atproto.admin.disableAccountInvites#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.disableAccountInvites",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "account",
              "ocaml_key": "account",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "did", "names": [] } ]
        }
      ];
  deps: did;
*)
type admin_disableAccountInvites_input = {account : did}

(*
  path: com.atproto.admin.disableInviteCodes#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.disableInviteCodes",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "codes",
              "ocaml_key": "codes",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.disableInviteCodes",
                    "names": [ "main", "input", "codes" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "String",
                    {
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "accounts",
              "ocaml_key": "accounts",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.disableInviteCodes",
                    "names": [ "main", "input", "accounts" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "String",
                    {
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type admin_disableInviteCodes_input = {
  codes : string list option;
  accounts : string list option;
}

(*
  path: com.atproto.admin.enableAccountInvites#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.enableAccountInvites",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "account",
              "ocaml_key": "account",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "did", "names": [] } ]
        }
      ];
  deps: did;
*)
type admin_enableAccountInvites_input = {account : did}

(*
  path: com.atproto.admin.getInviteCodes#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.getInviteCodes",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "codes",
              "ocaml_key": "codes",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.getInviteCodes",
                    "names": [ "main", "output", "codes" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.server.defs",
                      "names": [ "inviteCode" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.server.defs", "names": [ "inviteCode" ] }
          ]
        }
      ];
  deps: com.atproto.server.defs#inviteCode;
*)
type admin_getInviteCodes_output = {
  cursor : string option;
  codes : server_inviteCode list;
}

(*
  path: com.atproto.admin.getInviteCodes#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.getInviteCodes",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "sort",
              "ocaml_key": "sort",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": [ "recent", "usage" ],
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": "recent"
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 500,
                  "default": 100,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type admin_getInviteCodes_parameters = {
  sort : string option;
  limit : int64 option;
  cursor : string option;
}

(*
  path: com.atproto.admin.getModerationAction#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.getModerationAction",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "id",
              "ocaml_key": "id",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type admin_getModerationAction_parameters = {id : int64}

(*
  path: com.atproto.admin.getModerationActions#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.getModerationActions",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "actions",
              "ocaml_key": "actions",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.getModerationActions",
                    "names": [ "main", "output", "actions" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.admin.defs",
                      "names": [ "actionView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.admin.defs", "names": [ "actionView" ] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#actionView;
*)
type admin_getModerationActions_output = {
  cursor : string option;
  actions : admin_actionView list;
}

(*
  path: com.atproto.admin.getModerationActions#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.getModerationActions",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type admin_getModerationActions_parameters = {
  subject : string option;
  limit : int64 option;
  cursor : string option;
}

(*
  path: com.atproto.admin.getModerationReport#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.getModerationReport",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "id",
              "ocaml_key": "id",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type admin_getModerationReport_parameters = {id : int64}

(*
  path: com.atproto.admin.getModerationReports#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.getModerationReports",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "reports",
              "ocaml_key": "reports",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.getModerationReports",
                    "names": [ "main", "output", "reports" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.admin.defs",
                      "names": [ "reportView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.admin.defs", "names": [ "reportView" ] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#reportView;
*)
type admin_getModerationReports_output = {
  cursor : string option;
  reports : admin_reportView list;
}

(*
  path: com.atproto.admin.getModerationReports#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.getModerationReports",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "ignoreSubjects",
              "ocaml_key": "ignoreSubjects",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.getModerationReports",
                    "names": [ "main", "parameters", "ignoreSubjects" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "String",
                    {
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "reporters",
              "ocaml_key": "reporters",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.getModerationReports",
                    "names": [ "main", "parameters", "reporters" ]
                  },
                  "description": "Filter reports made by one or more DIDs",
                  "maxLength": null,
                  "items": [
                    "String",
                    {
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "resolved",
              "ocaml_key": "resolved",
              "optional": true,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": null, "const": null }
              ]
            },
            {
              "key": "actionType",
              "ocaml_key": "actionType",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": [
                    "com.atproto.admin.defs#takedown",
                    "com.atproto.admin.defs#flag",
                    "com.atproto.admin.defs#acknowledge",
                    "com.atproto.admin.defs#escalate"
                  ],
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "reverse",
              "ocaml_key": "reverse",
              "optional": true,
              "nullable": false,
              "ty": [
                "Boolean",
                {
                  "description": "Reverse the order of the returned records? when true, returns reports in chronological order",
                  "default": null,
                  "const": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type admin_getModerationReports_parameters = {
  subject : string option;
  ignoreSubjects : string list option;
  reporters : string list option;
  resolved : bool option;
  actionType : string option;
  limit : int64 option;
  cursor : string option;
  reverse : bool option;
}

(*
  path: com.atproto.admin.getRecord#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.getRecord",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-uri", "names": [] }, { "nsid": "cid", "names": [] }
          ]
        }
      ];
  deps: at-uri; cid;
*)
type admin_getRecord_parameters = {uri : at_uri; cid : cid option}

(*
  path: com.atproto.admin.getRepo#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.getRepo",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "did", "names": [] } ]
        }
      ];
  deps: did;
*)
type admin_getRepo_parameters = {did : did}

(*
  path: com.atproto.admin.rebaseRepo#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.rebaseRepo",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "repo",
              "ocaml_key": "repo",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": "The handle or DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "swapCommit",
              "ocaml_key": "swapCommit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "Compare and swap with the previous commit by cid.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-identifier", "names": [] },
            { "nsid": "cid", "names": [] }
          ]
        }
      ];
  deps: at-identifier; cid;
*)
type admin_rebaseRepo_input = {repo : at_identifier; swapCommit : cid option}

(*
  path: com.atproto.admin.resolveModerationReports#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.resolveModerationReports",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "actionId",
              "ocaml_key": "actionId",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "reportIds",
              "ocaml_key": "reportIds",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.resolveModerationReports",
                    "names": [ "main", "input", "reportIds" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Integer",
                    {
                      "minimum": null,
                      "maximum": null,
                      "default": null,
                      "description": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "createdBy",
              "ocaml_key": "createdBy",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "did", "names": [] } ]
        }
      ];
  deps: did;
*)
type admin_resolveModerationReports_input = {
  actionId : int64;
  reportIds : int64 list;
  createdBy : did;
}

(*
  path: com.atproto.admin.reverseModerationAction#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.reverseModerationAction",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "id",
              "ocaml_key": "id",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "reason",
              "ocaml_key": "reason",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdBy",
              "ocaml_key": "createdBy",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "did", "names": [] } ]
        }
      ];
  deps: did;
*)
type admin_reverseModerationAction_input = {
  id : int64;
  reason : string;
  createdBy : did;
}

(*
  path: com.atproto.admin.searchRepos#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.searchRepos",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "repos",
              "ocaml_key": "repos",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.searchRepos",
                    "names": [ "main", "output", "repos" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.admin.defs",
                      "names": [ "repoView" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.admin.defs", "names": [ "repoView" ] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#repoView;
*)
type admin_searchRepos_output = {
  cursor : string option;
  repos : admin_repoView list;
}

(*
  path: com.atproto.admin.searchRepos#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.searchRepos",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "term",
              "ocaml_key": "term",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "invitedBy",
              "ocaml_key": "invitedBy",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type admin_searchRepos_parameters = {
  term : string option;
  invitedBy : string option;
  limit : int64 option;
  cursor : string option;
}

(*
  path: com.atproto.admin.takeModerationAction#main/input/subject;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "com.atproto.admin.takeModerationAction",
            "names": [ "main", "input", "subject" ]
          },
          "constrs": [
            {
              "ocaml_name": "RepoRef",
              "path": {
                "nsid": "com.atproto.admin.defs",
                "names": [ "repoRef" ]
              }
            },
            {
              "ocaml_name": "StrongRef",
              "path": {
                "nsid": "com.atproto.repo.strongRef",
                "names": [ "main" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "com.atproto.admin.defs", "names": [ "repoRef" ] },
            { "nsid": "com.atproto.repo.strongRef", "names": [ "main" ] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#repoRef; com.atproto.repo.strongRef;
*)
type admin_takeModerationAction_input_subject =
  | RepoRef of admin_repoRef
  | StrongRef of repo_strongRef

(*
  path: com.atproto.admin.takeModerationAction#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.takeModerationAction",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "action",
              "ocaml_key": "action",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": [
                    "com.atproto.admin.defs#takedown",
                    "com.atproto.admin.defs#flag",
                    "com.atproto.admin.defs#acknowledge"
                  ],
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.admin.takeModerationAction",
                  "names": [ "main", "input", "subject" ]
                }
              ]
            },
            {
              "key": "subjectBlobCids",
              "ocaml_key": "subjectBlobCids",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.takeModerationAction",
                    "names": [ "main", "input", "subjectBlobCids" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Format",
                    {
                      "format": "cid",
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "createLabelVals",
              "ocaml_key": "createLabelVals",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.takeModerationAction",
                    "names": [ "main", "input", "createLabelVals" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "String",
                    {
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "negateLabelVals",
              "ocaml_key": "negateLabelVals",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.admin.takeModerationAction",
                    "names": [ "main", "input", "negateLabelVals" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "String",
                    {
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "reason",
              "ocaml_key": "reason",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdBy",
              "ocaml_key": "createdBy",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "cid", "names": [] },
            {
              "nsid": "com.atproto.admin.takeModerationAction",
              "names": [ "main", "input", "subject" ]
            },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: cid; com.atproto.admin.takeModerationAction#main/input/subject; did;
*)
type admin_takeModerationAction_input = {
  action : string;
  subject : admin_takeModerationAction_input_subject;
  subjectBlobCids : cid list option;
  createLabelVals : string list option;
  negateLabelVals : string list option;
  reason : string;
  createdBy : did;
}

(*
  path: com.atproto.admin.updateAccountEmail#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.updateAccountEmail",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "account",
              "ocaml_key": "account",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": "The handle or DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "email",
              "ocaml_key": "email",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-identifier", "names": [] } ]
        }
      ];
  deps: at-identifier;
*)
type admin_updateAccountEmail_input = {account : at_identifier; email : string}

(*
  path: com.atproto.admin.updateAccountHandle#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.admin.updateAccountHandle",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "handle",
              "ocaml_key": "handle",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "handle",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "did", "names": [] }, { "nsid": "handle", "names": [] }
          ]
        }
      ];
  deps: did; handle;
*)
type admin_updateAccountHandle_input = {did : did; handle : handle}

(*
  path: com.atproto.identity.resolveHandle#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.identity.resolveHandle",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "did", "names": [] } ]
        }
      ];
  deps: did;
*)
type identity_resolveHandle_output = {did : did}

(*
  path: com.atproto.identity.resolveHandle#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.identity.resolveHandle",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "handle",
              "ocaml_key": "handle",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "handle",
                  "description": "The handle to resolve.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "handle", "names": [] } ]
        }
      ];
  deps: handle;
*)
type identity_resolveHandle_parameters = {handle : handle}

(*
  path: com.atproto.identity.updateHandle#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.identity.updateHandle",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "handle",
              "ocaml_key": "handle",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "handle",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "handle", "names": [] } ]
        }
      ];
  deps: handle;
*)
type identity_updateHandle_input = {handle : handle}

(*
  path: com.atproto.label.queryLabels#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.label.queryLabels",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "labels",
              "ocaml_key": "labels",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.label.queryLabels",
                    "names": [ "main", "output", "labels" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.label.defs",
                      "names": [ "label" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.label.defs", "names": [ "label" ] }
          ]
        }
      ];
  deps: com.atproto.label.defs#label;
*)
type label_queryLabels_output = {
  cursor : string option;
  labels : label_label list;
}

(*
  path: com.atproto.label.queryLabels#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.label.queryLabels",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uriPatterns",
              "ocaml_key": "uriPatterns",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.label.queryLabels",
                    "names": [ "main", "parameters", "uriPatterns" ]
                  },
                  "description": "List of AT URI patterns to match (boolean 'OR'). Each may be a prefix (ending with '*'; will match inclusive of the string leading to '*'), or a full URI",
                  "maxLength": null,
                  "items": [
                    "String",
                    {
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "sources",
              "ocaml_key": "sources",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.label.queryLabels",
                    "names": [ "main", "parameters", "sources" ]
                  },
                  "description": "Optional list of label sources (DIDs) to filter on",
                  "maxLength": null,
                  "items": [
                    "Format",
                    {
                      "format": "did",
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 250,
                  "default": 50,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "did", "names": [] } ]
        }
      ];
  deps: did;
*)
type label_queryLabels_parameters = {
  uriPatterns : string list;
  sources : did list option;
  limit : int64 option;
  cursor : string option;
}

(*
  path: com.atproto.label.subscribeLabels#info;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.label.subscribeLabels",
            "names": [ "info" ]
          },
          "description": null,
          "fields": [
            {
              "key": "name",
              "ocaml_key": "name",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": [ "OutdatedCursor" ],
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "message",
              "ocaml_key": "message",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type label_subscribeLabels_info = {name : string; message : string option}

(*
  path: com.atproto.label.subscribeLabels#labels;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.label.subscribeLabels",
            "names": [ "labels" ]
          },
          "description": null,
          "fields": [
            {
              "key": "seq",
              "ocaml_key": "seq",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "labels",
              "ocaml_key": "labels",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.label.subscribeLabels",
                    "names": [ "labels", "labels" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.label.defs",
                      "names": [ "label" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.label.defs", "names": [ "label" ] }
          ]
        }
      ];
  deps: com.atproto.label.defs#label;
*)
type label_subscribeLabels_labels = {seq : int64; labels : label_label list}

(*
  path: com.atproto.label.subscribeLabels#main/message;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "com.atproto.label.subscribeLabels",
            "names": [ "main", "message" ]
          },
          "constrs": [
            {
              "ocaml_name": "Labels",
              "path": {
                "nsid": "com.atproto.label.subscribeLabels",
                "names": [ "labels" ]
              }
            },
            {
              "ocaml_name": "Info",
              "path": {
                "nsid": "com.atproto.label.subscribeLabels",
                "names": [ "info" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            {
              "nsid": "com.atproto.label.subscribeLabels",
              "names": [ "labels" ]
            },
            {
              "nsid": "com.atproto.label.subscribeLabels",
              "names": [ "info" ]
            }
          ]
        }
      ];
  deps: com.atproto.label.subscribeLabels#labels;
        com.atproto.label.subscribeLabels#info;
*)
type label_subscribeLabels_message =
  | Labels of label_subscribeLabels_labels
  | Info of label_subscribeLabels_info

(*
  path: com.atproto.label.subscribeLabels#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.label.subscribeLabels",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": "The last known event to backfill from."
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type label_subscribeLabels_parameters = {cursor : int64 option}

(*
  path: com.atproto.moderation.createReport#main/input/subject;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "com.atproto.moderation.createReport",
            "names": [ "main", "input", "subject" ]
          },
          "constrs": [
            {
              "ocaml_name": "RepoRef",
              "path": {
                "nsid": "com.atproto.admin.defs",
                "names": [ "repoRef" ]
              }
            },
            {
              "ocaml_name": "StrongRef",
              "path": {
                "nsid": "com.atproto.repo.strongRef",
                "names": [ "main" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "com.atproto.admin.defs", "names": [ "repoRef" ] },
            { "nsid": "com.atproto.repo.strongRef", "names": [ "main" ] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#repoRef; com.atproto.repo.strongRef;
*)
type moderation_createReport_input_subject =
  | RepoRef of admin_repoRef
  | StrongRef of repo_strongRef

(*
  path: com.atproto.moderation.createReport#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.moderation.createReport",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "reasonType",
              "ocaml_key": "reasonType",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.moderation.defs",
                  "names": [ "reasonType" ]
                }
              ]
            },
            {
              "key": "reason",
              "ocaml_key": "reason",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.moderation.createReport",
                  "names": [ "main", "input", "subject" ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "com.atproto.moderation.createReport",
              "names": [ "main", "input", "subject" ]
            },
            {
              "nsid": "com.atproto.moderation.defs",
              "names": [ "reasonType" ]
            }
          ]
        }
      ];
  deps: com.atproto.moderation.createReport#main/input/subject;
        com.atproto.moderation.defs#reasonType;
*)
type moderation_createReport_input = {
  reasonType : moderation_reasonType;
  reason : string option;
  subject : moderation_createReport_input_subject;
}

(*
  path: com.atproto.moderation.createReport#main/output/subject;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "com.atproto.moderation.createReport",
            "names": [ "main", "output", "subject" ]
          },
          "constrs": [
            {
              "ocaml_name": "RepoRef",
              "path": {
                "nsid": "com.atproto.admin.defs",
                "names": [ "repoRef" ]
              }
            },
            {
              "ocaml_name": "StrongRef",
              "path": {
                "nsid": "com.atproto.repo.strongRef",
                "names": [ "main" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            { "nsid": "com.atproto.admin.defs", "names": [ "repoRef" ] },
            { "nsid": "com.atproto.repo.strongRef", "names": [ "main" ] }
          ]
        }
      ];
  deps: com.atproto.admin.defs#repoRef; com.atproto.repo.strongRef;
*)
type moderation_createReport_output_subject =
  | RepoRef of admin_repoRef
  | StrongRef of repo_strongRef

(*
  path: com.atproto.moderation.createReport#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.moderation.createReport",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "id",
              "ocaml_key": "id",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "reasonType",
              "ocaml_key": "reasonType",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.moderation.defs",
                  "names": [ "reasonType" ]
                }
              ]
            },
            {
              "key": "reason",
              "ocaml_key": "reason",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "subject",
              "ocaml_key": "subject",
              "optional": false,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.moderation.createReport",
                  "names": [ "main", "output", "subject" ]
                }
              ]
            },
            {
              "key": "reportedBy",
              "ocaml_key": "reportedBy",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "com.atproto.moderation.createReport",
              "names": [ "main", "output", "subject" ]
            },
            {
              "nsid": "com.atproto.moderation.defs",
              "names": [ "reasonType" ]
            },
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: com.atproto.moderation.createReport#main/output/subject;
        com.atproto.moderation.defs#reasonType; datetime; did;
*)
type moderation_createReport_output = {
  id : int64;
  reasonType : moderation_reasonType;
  reason : string option;
  subject : moderation_createReport_output_subject;
  reportedBy : did;
  createdAt : datetime;
}

(*
  path: com.atproto.moderation.defs#reasonMisleading;
  ty: [
        "Alias",
        {
          "path": {
            "nsid": "com.atproto.moderation.defs",
            "names": [ "reasonMisleading" ]
          },
          "ty": [
            "Token",
            { "description": "Misleading identity, affiliation, or content" }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type moderation_reasonMisleading = string
[@@ocaml.doc "Misleading identity, affiliation, or content"]

(*
  path: com.atproto.moderation.defs#reasonOther;
  ty: [
        "Alias",
        {
          "path": {
            "nsid": "com.atproto.moderation.defs",
            "names": [ "reasonOther" ]
          },
          "ty": [
            "Token",
            {
              "description": "Other: reports not falling under another report category"
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type moderation_reasonOther = string
[@@ocaml.doc "Other: reports not falling under another report category"]

(*
  path: com.atproto.moderation.defs#reasonRude;
  ty: [
        "Alias",
        {
          "path": {
            "nsid": "com.atproto.moderation.defs",
            "names": [ "reasonRude" ]
          },
          "ty": [
            "Token",
            {
              "description": "Rude, harassing, explicit, or otherwise unwelcoming behavior"
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type moderation_reasonRude = string
[@@ocaml.doc "Rude, harassing, explicit, or otherwise unwelcoming behavior"]

(*
  path: com.atproto.moderation.defs#reasonSexual;
  ty: [
        "Alias",
        {
          "path": {
            "nsid": "com.atproto.moderation.defs",
            "names": [ "reasonSexual" ]
          },
          "ty": [
            "Token",
            { "description": "Unwanted or mis-labeled sexual content" }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type moderation_reasonSexual = string
[@@ocaml.doc "Unwanted or mis-labeled sexual content"]

(*
  path: com.atproto.moderation.defs#reasonSpam;
  ty: [
        "Alias",
        {
          "path": {
            "nsid": "com.atproto.moderation.defs",
            "names": [ "reasonSpam" ]
          },
          "ty": [
            "Token",
            {
              "description": "Spam: frequent unwanted promotion, replies, mentions"
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type moderation_reasonSpam = string
[@@ocaml.doc "Spam: frequent unwanted promotion, replies, mentions"]

(*
  path: com.atproto.moderation.defs#reasonViolation;
  ty: [
        "Alias",
        {
          "path": {
            "nsid": "com.atproto.moderation.defs",
            "names": [ "reasonViolation" ]
          },
          "ty": [
            "Token",
            {
              "description": "Direct violation of server rules, laws, terms of service"
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type moderation_reasonViolation = string
[@@ocaml.doc "Direct violation of server rules, laws, terms of service"]

(*
  path: nsid;
  ty: [
        "Alias",
        {
          "path": { "nsid": "nsid", "names": [] },
          "ty": [
            "Format",
            {
              "format": "nsid",
              "description": null,
              "knownValues": null,
              "minLength": null,
              "maxLength": null,
              "maxGraphemes": null,
              "default": null
            }
          ],
          "deps": [ { "nsid": "nsid", "names": [] } ]
        }
      ];
  deps: nsid;
*)
type nsid = string

(*
  path: com.atproto.repo.applyWrites#create;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.applyWrites",
            "names": [ "create" ]
          },
          "description": "Create a new record.",
          "fields": [
            {
              "key": "collection",
              "ocaml_key": "collection",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "nsid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "rkey",
              "ocaml_key": "rkey",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 15,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "value",
              "ocaml_key": "value",
              "optional": false,
              "nullable": false,
              "ty": [ "Unknown", { "description": null } ]
            }
          ],
          "deps": [ { "nsid": "nsid", "names": [] } ]
        }
      ];
  deps: nsid;
*)
type repo_applyWrites_create = {
  collection : nsid;
  rkey : string option;
  value : unknown;
}
[@@ocaml.doc "Create a new record."]

(*
  path: com.atproto.repo.applyWrites#delete;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.applyWrites",
            "names": [ "delete" ]
          },
          "description": "Delete an existing record.",
          "fields": [
            {
              "key": "collection",
              "ocaml_key": "collection",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "nsid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "rkey",
              "ocaml_key": "rkey",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "nsid", "names": [] } ]
        }
      ];
  deps: nsid;
*)
type repo_applyWrites_delete = {collection : nsid; rkey : string}
[@@ocaml.doc "Delete an existing record."]

(*
  path: com.atproto.repo.applyWrites#update;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.applyWrites",
            "names": [ "update" ]
          },
          "description": "Update an existing record.",
          "fields": [
            {
              "key": "collection",
              "ocaml_key": "collection",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "nsid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "rkey",
              "ocaml_key": "rkey",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "value",
              "ocaml_key": "value",
              "optional": false,
              "nullable": false,
              "ty": [ "Unknown", { "description": null } ]
            }
          ],
          "deps": [ { "nsid": "nsid", "names": [] } ]
        }
      ];
  deps: nsid;
*)
type repo_applyWrites_update = {
  collection : nsid;
  rkey : string;
  value : unknown;
}
[@@ocaml.doc "Update an existing record."]

(*
  path: com.atproto.repo.applyWrites#main/input/writes/item;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "com.atproto.repo.applyWrites",
            "names": [ "main", "input", "writes", "item" ]
          },
          "constrs": [
            {
              "ocaml_name": "Create",
              "path": {
                "nsid": "com.atproto.repo.applyWrites",
                "names": [ "create" ]
              }
            },
            {
              "ocaml_name": "Update",
              "path": {
                "nsid": "com.atproto.repo.applyWrites",
                "names": [ "update" ]
              }
            },
            {
              "ocaml_name": "Delete",
              "path": {
                "nsid": "com.atproto.repo.applyWrites",
                "names": [ "delete" ]
              }
            }
          ],
          "closed": true,
          "deps": [
            { "nsid": "com.atproto.repo.applyWrites", "names": [ "create" ] },
            { "nsid": "com.atproto.repo.applyWrites", "names": [ "update" ] },
            { "nsid": "com.atproto.repo.applyWrites", "names": [ "delete" ] }
          ]
        }
      ];
  deps: com.atproto.repo.applyWrites#create;
        com.atproto.repo.applyWrites#update;
        com.atproto.repo.applyWrites#delete;
*)
type repo_applyWrites_input_writes_item =
  | Create of repo_applyWrites_create
  | Update of repo_applyWrites_update
  | Delete of repo_applyWrites_delete

(*
  path: com.atproto.repo.applyWrites#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.applyWrites",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "repo",
              "ocaml_key": "repo",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": "The handle or DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "validate",
              "ocaml_key": "validate",
              "optional": true,
              "nullable": false,
              "ty": [
                "Boolean",
                {
                  "description": "Validate the records?",
                  "default": true,
                  "const": null
                }
              ]
            },
            {
              "key": "writes",
              "ocaml_key": "writes",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.repo.applyWrites",
                    "names": [ "main", "input", "writes" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.repo.applyWrites",
                      "names": [ "main", "input", "writes", "item" ]
                    }
                  ]
                }
              ]
            },
            {
              "key": "swapCommit",
              "ocaml_key": "swapCommit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-identifier", "names": [] },
            { "nsid": "cid", "names": [] },
            {
              "nsid": "com.atproto.repo.applyWrites",
              "names": [ "main", "input", "writes", "item" ]
            }
          ]
        }
      ];
  deps: at-identifier; cid;
        com.atproto.repo.applyWrites#main/input/writes/item;
*)
type repo_applyWrites_input = {
  repo : at_identifier;
  validate : bool option;
  writes : repo_applyWrites_input_writes_item list;
  swapCommit : cid option;
}

(*
  path: com.atproto.repo.createRecord#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.createRecord",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "repo",
              "ocaml_key": "repo",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": "The handle or DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "collection",
              "ocaml_key": "collection",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "nsid",
                  "description": "The NSID of the record collection.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "rkey",
              "ocaml_key": "rkey",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": "The key of the record.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 15,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "validate",
              "ocaml_key": "validate",
              "optional": true,
              "nullable": false,
              "ty": [
                "Boolean",
                {
                  "description": "Validate the record?",
                  "default": true,
                  "const": null
                }
              ]
            },
            {
              "key": "record",
              "ocaml_key": "record",
              "optional": false,
              "nullable": false,
              "ty": [ "Unknown", { "description": "The record to create." } ]
            },
            {
              "key": "swapCommit",
              "ocaml_key": "swapCommit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "Compare and swap with the previous commit by cid.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-identifier", "names": [] },
            { "nsid": "cid", "names": [] },
            { "nsid": "nsid", "names": [] }
          ]
        }
      ];
  deps: at-identifier; cid; nsid;
*)
type repo_createRecord_input = {
  repo : at_identifier;
  collection : nsid;
  rkey : string option;
  validate : bool option;
  record : unknown;
  swapCommit : cid option;
}

(*
  path: com.atproto.repo.createRecord#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.createRecord",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-uri", "names": [] }, { "nsid": "cid", "names": [] }
          ]
        }
      ];
  deps: at-uri; cid;
*)
type repo_createRecord_output = {uri : at_uri; cid : cid}

(*
  path: com.atproto.repo.deleteRecord#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.deleteRecord",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "repo",
              "ocaml_key": "repo",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": "The handle or DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "collection",
              "ocaml_key": "collection",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "nsid",
                  "description": "The NSID of the record collection.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "rkey",
              "ocaml_key": "rkey",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": "The key of the record.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "swapRecord",
              "ocaml_key": "swapRecord",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "Compare and swap with the previous record by cid.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "swapCommit",
              "ocaml_key": "swapCommit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "Compare and swap with the previous commit by cid.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-identifier", "names": [] },
            { "nsid": "cid", "names": [] },
            { "nsid": "nsid", "names": [] }
          ]
        }
      ];
  deps: at-identifier; cid; nsid;
*)
type repo_deleteRecord_input = {
  repo : at_identifier;
  collection : nsid;
  rkey : string;
  swapRecord : cid option;
  swapCommit : cid option;
}

(*
  path: com.atproto.repo.describeRepo#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.describeRepo",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "handle",
              "ocaml_key": "handle",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "handle",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "didDoc",
              "ocaml_key": "didDoc",
              "optional": false,
              "nullable": false,
              "ty": [ "Unknown", { "description": null } ]
            },
            {
              "key": "collections",
              "ocaml_key": "collections",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.repo.describeRepo",
                    "names": [ "main", "output", "collections" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Format",
                    {
                      "format": "nsid",
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "handleIsCorrect",
              "ocaml_key": "handleIsCorrect",
              "optional": false,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": null, "const": null }
              ]
            }
          ],
          "deps": [
            { "nsid": "did", "names": [] },
            { "nsid": "handle", "names": [] },
            { "nsid": "nsid", "names": [] }
          ]
        }
      ];
  deps: did; handle; nsid;
*)
type repo_describeRepo_output = {
  handle : handle;
  did : did;
  didDoc : unknown;
  collections : nsid list;
  handleIsCorrect : bool;
}

(*
  path: com.atproto.repo.describeRepo#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.describeRepo",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "repo",
              "ocaml_key": "repo",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": "The handle or DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "at-identifier", "names": [] } ]
        }
      ];
  deps: at-identifier;
*)
type repo_describeRepo_parameters = {repo : at_identifier}

(*
  path: com.atproto.repo.getRecord#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.getRecord",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "value",
              "ocaml_key": "value",
              "optional": false,
              "nullable": false,
              "ty": [ "Unknown", { "description": null } ]
            }
          ],
          "deps": [
            { "nsid": "at-uri", "names": [] }, { "nsid": "cid", "names": [] }
          ]
        }
      ];
  deps: at-uri; cid;
*)
type repo_getRecord_output = {uri : at_uri; cid : cid option; value : unknown}

(*
  path: com.atproto.repo.getRecord#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.getRecord",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "repo",
              "ocaml_key": "repo",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": "The handle or DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "collection",
              "ocaml_key": "collection",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "nsid",
                  "description": "The NSID of the record collection.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "rkey",
              "ocaml_key": "rkey",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": "The key of the record.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "The CID of the version of the record. If not specified, then return the most recent version.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-identifier", "names": [] },
            { "nsid": "cid", "names": [] },
            { "nsid": "nsid", "names": [] }
          ]
        }
      ];
  deps: at-identifier; cid; nsid;
*)
type repo_getRecord_parameters = {
  repo : at_identifier;
  collection : nsid;
  rkey : string;
  cid : cid option;
}

(*
  path: com.atproto.repo.listRecords#record;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.listRecords",
            "names": [ "record" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "value",
              "ocaml_key": "value",
              "optional": false,
              "nullable": false,
              "ty": [ "Unknown", { "description": null } ]
            }
          ],
          "deps": [
            { "nsid": "at-uri", "names": [] }, { "nsid": "cid", "names": [] }
          ]
        }
      ];
  deps: at-uri; cid;
*)
type repo_listRecords_record = {uri : at_uri; cid : cid; value : unknown}

(*
  path: com.atproto.repo.listRecords#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.listRecords",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "records",
              "ocaml_key": "records",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.repo.listRecords",
                    "names": [ "main", "output", "records" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.repo.listRecords",
                      "names": [ "record" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.repo.listRecords", "names": [ "record" ] }
          ]
        }
      ];
  deps: com.atproto.repo.listRecords#record;
*)
type repo_listRecords_output = {
  cursor : string option;
  records : repo_listRecords_record list;
}

(*
  path: com.atproto.repo.listRecords#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.listRecords",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "repo",
              "ocaml_key": "repo",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": "The handle or DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "collection",
              "ocaml_key": "collection",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "nsid",
                  "description": "The NSID of the record type.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 100,
                  "default": 50,
                  "description": "The number of records to return."
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "rkeyStart",
              "ocaml_key": "rkeyStart",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": "DEPRECATED: The lowest sort-ordered rkey to start from (exclusive)",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "rkeyEnd",
              "ocaml_key": "rkeyEnd",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": "DEPRECATED: The highest sort-ordered rkey to stop at (exclusive)",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "reverse",
              "ocaml_key": "reverse",
              "optional": true,
              "nullable": false,
              "ty": [
                "Boolean",
                {
                  "description": "Reverse the order of the returned records?",
                  "default": null,
                  "const": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-identifier", "names": [] },
            { "nsid": "nsid", "names": [] }
          ]
        }
      ];
  deps: at-identifier; nsid;
*)
type repo_listRecords_parameters = {
  repo : at_identifier;
  collection : nsid;
  limit : int64 option;
  cursor : string option;
  rkeyStart : string option;
  rkeyEnd : string option;
  reverse : bool option;
}

(*
  path: com.atproto.repo.putRecord#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.putRecord",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "repo",
              "ocaml_key": "repo",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": "The handle or DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "collection",
              "ocaml_key": "collection",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "nsid",
                  "description": "The NSID of the record collection.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "rkey",
              "ocaml_key": "rkey",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": "The key of the record.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": 15,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "validate",
              "ocaml_key": "validate",
              "optional": true,
              "nullable": false,
              "ty": [
                "Boolean",
                {
                  "description": "Validate the record?",
                  "default": true,
                  "const": null
                }
              ]
            },
            {
              "key": "record",
              "ocaml_key": "record",
              "optional": false,
              "nullable": false,
              "ty": [ "Unknown", { "description": "The record to write." } ]
            },
            {
              "key": "swapRecord",
              "ocaml_key": "swapRecord",
              "optional": true,
              "nullable": true,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "Compare and swap with the previous record by cid.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "swapCommit",
              "ocaml_key": "swapCommit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "Compare and swap with the previous commit by cid.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-identifier", "names": [] },
            { "nsid": "cid", "names": [] },
            { "nsid": "nsid", "names": [] }
          ]
        }
      ];
  deps: at-identifier; cid; nsid;
*)
type repo_putRecord_input = {
  repo : at_identifier;
  collection : nsid;
  rkey : string;
  validate : bool option;
  record : unknown;
  swapRecord : cid option;
  swapCommit : cid option;
}

(*
  path: com.atproto.repo.putRecord#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.putRecord",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "uri",
              "ocaml_key": "uri",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-uri",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-uri", "names": [] }, { "nsid": "cid", "names": [] }
          ]
        }
      ];
  deps: at-uri; cid;
*)
type repo_putRecord_output = {uri : at_uri; cid : cid}

(*
  path: com.atproto.repo.rebaseRepo#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.rebaseRepo",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "repo",
              "ocaml_key": "repo",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "at-identifier",
                  "description": "The handle or DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "swapCommit",
              "ocaml_key": "swapCommit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "Compare and swap with the previous commit by cid.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "at-identifier", "names": [] },
            { "nsid": "cid", "names": [] }
          ]
        }
      ];
  deps: at-identifier; cid;
*)
type repo_rebaseRepo_input = {repo : at_identifier; swapCommit : cid option}

(*
  path: com.atproto.repo.uploadBlob#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.repo.uploadBlob",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "blob",
              "ocaml_key": "blob",
              "optional": false,
              "nullable": false,
              "ty": [ "Blob", { "accept": null, "maxSize": null } ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type repo_uploadBlob_output = {blob : blob}

(*
  path: com.atproto.server.createAccount#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.createAccount",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "email",
              "ocaml_key": "email",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "handle",
              "ocaml_key": "handle",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "handle",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "inviteCode",
              "ocaml_key": "inviteCode",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "password",
              "ocaml_key": "password",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "recoveryKey",
              "ocaml_key": "recoveryKey",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "did", "names": [] }, { "nsid": "handle", "names": [] }
          ]
        }
      ];
  deps: did; handle;
*)
type server_createAccount_input = {
  email : string;
  handle : handle;
  did : did option;
  inviteCode : string option;
  password : string;
  recoveryKey : string option;
}

(*
  path: com.atproto.server.createAccount#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.createAccount",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "accessJwt",
              "ocaml_key": "accessJwt",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "refreshJwt",
              "ocaml_key": "refreshJwt",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "handle",
              "ocaml_key": "handle",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "handle",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "did", "names": [] }, { "nsid": "handle", "names": [] }
          ]
        }
      ];
  deps: did; handle;
*)
type server_createAccount_output = {
  accessJwt : string;
  refreshJwt : string;
  handle : handle;
  did : did;
}

(*
  path: com.atproto.server.createAppPassword#appPassword;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.createAppPassword",
            "names": [ "appPassword" ]
          },
          "description": null,
          "fields": [
            {
              "key": "name",
              "ocaml_key": "name",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "password",
              "ocaml_key": "password",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "datetime", "names": [] } ]
        }
      ];
  deps: datetime;
*)
type server_createAppPassword_appPassword = {
  name : string;
  password : string;
  createdAt : datetime;
}

(*
  path: com.atproto.server.createAppPassword#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.createAppPassword",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "name",
              "ocaml_key": "name",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type server_createAppPassword_input = {name : string}

(*
  path: com.atproto.server.createInviteCode#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.createInviteCode",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "useCount",
              "ocaml_key": "useCount",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "forAccount",
              "ocaml_key": "forAccount",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "did", "names": [] } ]
        }
      ];
  deps: did;
*)
type server_createInviteCode_input = {useCount : int64; forAccount : did option}

(*
  path: com.atproto.server.createInviteCode#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.createInviteCode",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "code",
              "ocaml_key": "code",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type server_createInviteCode_output = {code : string}

(*
  path: com.atproto.server.createInviteCodes#accountCodes;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.createInviteCodes",
            "names": [ "accountCodes" ]
          },
          "description": null,
          "fields": [
            {
              "key": "account",
              "ocaml_key": "account",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "codes",
              "ocaml_key": "codes",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.server.createInviteCodes",
                    "names": [ "accountCodes", "codes" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "String",
                    {
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type server_createInviteCodes_accountCodes = {
  account : string;
  codes : string list;
}

(*
  path: com.atproto.server.createInviteCodes#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.createInviteCodes",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "codeCount",
              "ocaml_key": "codeCount",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": 1,
                  "description": null
                }
              ]
            },
            {
              "key": "useCount",
              "ocaml_key": "useCount",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "forAccounts",
              "ocaml_key": "forAccounts",
              "optional": true,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.server.createInviteCodes",
                    "names": [ "main", "input", "forAccounts" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Format",
                    {
                      "format": "did",
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [ { "nsid": "did", "names": [] } ]
        }
      ];
  deps: did;
*)
type server_createInviteCodes_input = {
  codeCount : int64;
  useCount : int64;
  forAccounts : did list option;
}

(*
  path: com.atproto.server.createInviteCodes#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.createInviteCodes",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "codes",
              "ocaml_key": "codes",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.server.createInviteCodes",
                    "names": [ "main", "output", "codes" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.server.createInviteCodes",
                      "names": [ "accountCodes" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "com.atproto.server.createInviteCodes",
              "names": [ "accountCodes" ]
            }
          ]
        }
      ];
  deps: com.atproto.server.createInviteCodes#accountCodes;
*)
type server_createInviteCodes_output = {
  codes : server_createInviteCodes_accountCodes list;
}

(*
  path: com.atproto.server.createSession#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.createSession",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "identifier",
              "ocaml_key": "identifier",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": "Handle or other identifier supported by the server for the authenticating user.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "password",
              "ocaml_key": "password",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type server_createSession_input = {identifier : string; password : string}

(*
  path: com.atproto.server.createSession#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.createSession",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "accessJwt",
              "ocaml_key": "accessJwt",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "refreshJwt",
              "ocaml_key": "refreshJwt",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "handle",
              "ocaml_key": "handle",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "handle",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "email",
              "ocaml_key": "email",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "did", "names": [] }, { "nsid": "handle", "names": [] }
          ]
        }
      ];
  deps: did; handle;
*)
type server_createSession_output = {
  accessJwt : string;
  refreshJwt : string;
  handle : handle;
  did : did;
  email : string option;
}

(*
  path: com.atproto.server.deleteAccount#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.deleteAccount",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "password",
              "ocaml_key": "password",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "token",
              "ocaml_key": "token",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "did", "names": [] } ]
        }
      ];
  deps: did;
*)
type server_deleteAccount_input = {did : did; password : string; token : string}

(*
  path: com.atproto.server.describeServer#links;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.describeServer",
            "names": [ "links" ]
          },
          "description": null,
          "fields": [
            {
              "key": "privacyPolicy",
              "ocaml_key": "privacyPolicy",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "termsOfService",
              "ocaml_key": "termsOfService",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type server_describeServer_links = {
  privacyPolicy : string option;
  termsOfService : string option;
}

(*
  path: com.atproto.server.describeServer#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.describeServer",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "inviteCodeRequired",
              "ocaml_key": "inviteCodeRequired",
              "optional": true,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": null, "const": null }
              ]
            },
            {
              "key": "availableUserDomains",
              "ocaml_key": "availableUserDomains",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.server.describeServer",
                    "names": [ "main", "output", "availableUserDomains" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "String",
                    {
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            },
            {
              "key": "links",
              "ocaml_key": "links",
              "optional": true,
              "nullable": false,
              "ty": [
                "Ref",
                {
                  "nsid": "com.atproto.server.describeServer",
                  "names": [ "links" ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "com.atproto.server.describeServer",
              "names": [ "links" ]
            }
          ]
        }
      ];
  deps: com.atproto.server.describeServer#links;
*)
type server_describeServer_output = {
  inviteCodeRequired : bool option;
  availableUserDomains : string list;
  links : server_describeServer_links option;
}

(*
  path: com.atproto.server.getAccountInviteCodes#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.getAccountInviteCodes",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "codes",
              "ocaml_key": "codes",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.server.getAccountInviteCodes",
                    "names": [ "main", "output", "codes" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.server.defs",
                      "names": [ "inviteCode" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.server.defs", "names": [ "inviteCode" ] }
          ]
        }
      ];
  deps: com.atproto.server.defs#inviteCode;
*)
type server_getAccountInviteCodes_output = {codes : server_inviteCode list}

(*
  path: com.atproto.server.getAccountInviteCodes#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.getAccountInviteCodes",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "includeUsed",
              "ocaml_key": "includeUsed",
              "optional": true,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": true, "const": null }
              ]
            },
            {
              "key": "createAvailable",
              "ocaml_key": "createAvailable",
              "optional": true,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": true, "const": null }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type server_getAccountInviteCodes_parameters = {
  includeUsed : bool option;
  createAvailable : bool option;
}

(*
  path: com.atproto.server.getSession#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.getSession",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "handle",
              "ocaml_key": "handle",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "handle",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "email",
              "ocaml_key": "email",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "did", "names": [] }, { "nsid": "handle", "names": [] }
          ]
        }
      ];
  deps: did; handle;
*)
type server_getSession_output = {
  handle : handle;
  did : did;
  email : string option;
}

(*
  path: com.atproto.server.listAppPasswords#appPassword;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.listAppPasswords",
            "names": [ "appPassword" ]
          },
          "description": null,
          "fields": [
            {
              "key": "name",
              "ocaml_key": "name",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "createdAt",
              "ocaml_key": "createdAt",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "datetime", "names": [] } ]
        }
      ];
  deps: datetime;
*)
type server_listAppPasswords_appPassword = {name : string; createdAt : datetime}

(*
  path: com.atproto.server.listAppPasswords#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.listAppPasswords",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "passwords",
              "ocaml_key": "passwords",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.server.listAppPasswords",
                    "names": [ "main", "output", "passwords" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.server.listAppPasswords",
                      "names": [ "appPassword" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "com.atproto.server.listAppPasswords",
              "names": [ "appPassword" ]
            }
          ]
        }
      ];
  deps: com.atproto.server.listAppPasswords#appPassword;
*)
type server_listAppPasswords_output = {
  passwords : server_listAppPasswords_appPassword list;
}

(*
  path: com.atproto.server.refreshSession#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.refreshSession",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "accessJwt",
              "ocaml_key": "accessJwt",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "refreshJwt",
              "ocaml_key": "refreshJwt",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "handle",
              "ocaml_key": "handle",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "handle",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "did", "names": [] }, { "nsid": "handle", "names": [] }
          ]
        }
      ];
  deps: did; handle;
*)
type server_refreshSession_output = {
  accessJwt : string;
  refreshJwt : string;
  handle : handle;
  did : did;
}

(*
  path: com.atproto.server.requestPasswordReset#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.requestPasswordReset",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "email",
              "ocaml_key": "email",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type server_requestPasswordReset_input = {email : string}

(*
  path: com.atproto.server.resetPassword#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.resetPassword",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "token",
              "ocaml_key": "token",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "password",
              "ocaml_key": "password",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type server_resetPassword_input = {token : string; password : string}

(*
  path: com.atproto.server.revokeAppPassword#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.server.revokeAppPassword",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "name",
              "ocaml_key": "name",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type server_revokeAppPassword_input = {name : string}

(*
  path: com.atproto.sync.getBlob#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.getBlob",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": "The DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "The CID of the blob to fetch",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "cid", "names": [] }, { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: cid; did;
*)
type sync_getBlob_parameters = {did : did; cid : cid}

(*
  path: com.atproto.sync.getBlocks#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.getBlocks",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": "The DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cids",
              "ocaml_key": "cids",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.sync.getBlocks",
                    "names": [ "main", "parameters", "cids" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Format",
                    {
                      "format": "cid",
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "cid", "names": [] }, { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: cid; did;
*)
type sync_getBlocks_parameters = {did : did; cids : cid list}

(*
  path: com.atproto.sync.getCheckout#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.getCheckout",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": "The DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "commit",
              "ocaml_key": "commit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "The commit to get the checkout from. Defaults to current HEAD.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "cid", "names": [] }, { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: cid; did;
*)
type sync_getCheckout_parameters = {did : did; commit : cid option}

(*
  path: com.atproto.sync.getCommitPath#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.getCommitPath",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "commits",
              "ocaml_key": "commits",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.sync.getCommitPath",
                    "names": [ "main", "output", "commits" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Format",
                    {
                      "format": "cid",
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [ { "nsid": "cid", "names": [] } ]
        }
      ];
  deps: cid;
*)
type sync_getCommitPath_output = {commits : cid list}

(*
  path: com.atproto.sync.getCommitPath#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.getCommitPath",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": "The DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "latest",
              "ocaml_key": "latest",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "The most recent commit",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "earliest",
              "ocaml_key": "earliest",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "The earliest commit to start from",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "cid", "names": [] }, { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: cid; did;
*)
type sync_getCommitPath_parameters = {
  did : did;
  latest : cid option;
  earliest : cid option;
}

(*
  path: com.atproto.sync.getHead#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.getHead",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "root",
              "ocaml_key": "root",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "cid", "names": [] } ]
        }
      ];
  deps: cid;
*)
type sync_getHead_output = {root : cid}

(*
  path: com.atproto.sync.getHead#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.getHead",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": "The DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [ { "nsid": "did", "names": [] } ]
        }
      ];
  deps: did;
*)
type sync_getHead_parameters = {did : did}

(*
  path: com.atproto.sync.getRecord#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.getRecord",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": "The DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "collection",
              "ocaml_key": "collection",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "nsid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "rkey",
              "ocaml_key": "rkey",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "commit",
              "ocaml_key": "commit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "An optional past commit CID.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "cid", "names": [] },
            { "nsid": "did", "names": [] },
            { "nsid": "nsid", "names": [] }
          ]
        }
      ];
  deps: cid; did; nsid;
*)
type sync_getRecord_parameters = {
  did : did;
  collection : nsid;
  rkey : string;
  commit : cid option;
}

(*
  path: com.atproto.sync.getRepo#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.getRepo",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": "The DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "earliest",
              "ocaml_key": "earliest",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "The earliest commit in the commit range (not inclusive)",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "latest",
              "ocaml_key": "latest",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "The latest commit in the commit range (inclusive)",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "cid", "names": [] }, { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: cid; did;
*)
type sync_getRepo_parameters = {
  did : did;
  earliest : cid option;
  latest : cid option;
}

(*
  path: com.atproto.sync.listBlobs#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.listBlobs",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cids",
              "ocaml_key": "cids",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.sync.listBlobs",
                    "names": [ "main", "output", "cids" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Format",
                    {
                      "format": "cid",
                      "description": null,
                      "knownValues": null,
                      "minLength": null,
                      "maxLength": null,
                      "maxGraphemes": null,
                      "default": null
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [ { "nsid": "cid", "names": [] } ]
        }
      ];
  deps: cid;
*)
type sync_listBlobs_output = {cids : cid list}

(*
  path: com.atproto.sync.listBlobs#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.listBlobs",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": "The DID of the repo.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "latest",
              "ocaml_key": "latest",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "The most recent commit",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "earliest",
              "ocaml_key": "earliest",
              "optional": true,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": "The earliest commit to start from",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "cid", "names": [] }, { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: cid; did;
*)
type sync_listBlobs_parameters = {
  did : did;
  latest : cid option;
  earliest : cid option;
}

(*
  path: com.atproto.sync.listRepos#repo;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.listRepos",
            "names": [ "repo" ]
          },
          "description": null,
          "fields": [
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "head",
              "ocaml_key": "head",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "cid",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "cid", "names": [] }, { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: cid; did;
*)
type sync_listRepos_repo = {did : did; head : cid}

(*
  path: com.atproto.sync.listRepos#main/output;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.listRepos",
            "names": [ "main", "output" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "repos",
              "ocaml_key": "repos",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.sync.listRepos",
                    "names": [ "main", "output", "repos" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.sync.listRepos",
                      "names": [ "repo" ]
                    }
                  ]
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "com.atproto.sync.listRepos", "names": [ "repo" ] }
          ]
        }
      ];
  deps: com.atproto.sync.listRepos#repo;
*)
type sync_listRepos_output = {
  cursor : string option;
  repos : sync_listRepos_repo list;
}

(*
  path: com.atproto.sync.listRepos#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.listRepos",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "limit",
              "ocaml_key": "limit",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": 1,
                  "maximum": 1000,
                  "default": 500,
                  "description": null
                }
              ]
            },
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type sync_listRepos_parameters = {limit : int64 option; cursor : string option}

(*
  path: com.atproto.sync.notifyOfUpdate#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.notifyOfUpdate",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "hostname",
              "ocaml_key": "hostname",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": "Hostname of the service that is notifying of update.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type sync_notifyOfUpdate_input = {hostname : string}

(*
  path: com.atproto.sync.requestCrawl#main/input;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.requestCrawl",
            "names": [ "main", "input" ]
          },
          "description": null,
          "fields": [
            {
              "key": "hostname",
              "ocaml_key": "hostname",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": "Hostname of the service that is requesting to be crawled.",
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type sync_requestCrawl_input = {hostname : string}

(*
  path: com.atproto.sync.subscribeRepos#repoOp;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.subscribeRepos",
            "names": [ "repoOp" ]
          },
          "description": null,
          "fields": [
            {
              "key": "action",
              "ocaml_key": "action",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": [ "create", "update", "delete" ],
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "path",
              "ocaml_key": "path",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "cid",
              "ocaml_key": "cid",
              "optional": false,
              "nullable": true,
              "ty": [ "Cid_link", { "description": null } ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type sync_subscribeRepos_repoOp = {
  action : string;
  path : string;
  cid : cid_link nullable;
}

(*
  path: com.atproto.sync.subscribeRepos#commit;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.subscribeRepos",
            "names": [ "commit" ]
          },
          "description": null,
          "fields": [
            {
              "key": "seq",
              "ocaml_key": "seq",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "rebase",
              "ocaml_key": "rebase",
              "optional": false,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": null, "const": null }
              ]
            },
            {
              "key": "tooBig",
              "ocaml_key": "tooBig",
              "optional": false,
              "nullable": false,
              "ty": [
                "Boolean",
                { "description": null, "default": null, "const": null }
              ]
            },
            {
              "key": "repo",
              "ocaml_key": "repo",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "commit",
              "ocaml_key": "commit",
              "optional": false,
              "nullable": false,
              "ty": [ "Cid_link", { "description": null } ]
            },
            {
              "key": "prev",
              "ocaml_key": "prev",
              "optional": false,
              "nullable": true,
              "ty": [ "Cid_link", { "description": null } ]
            },
            {
              "key": "blocks",
              "ocaml_key": "blocks",
              "optional": false,
              "nullable": false,
              "ty": [
                "Bytes",
                {
                  "format": null,
                  "description": "CAR file containing relevant blocks",
                  "maxLength": 1000000
                }
              ]
            },
            {
              "key": "ops",
              "ocaml_key": "ops",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.sync.subscribeRepos",
                    "names": [ "commit", "ops" ]
                  },
                  "description": null,
                  "maxLength": 200,
                  "items": [
                    "Ref",
                    {
                      "nsid": "com.atproto.sync.subscribeRepos",
                      "names": [ "repoOp" ]
                    }
                  ]
                }
              ]
            },
            {
              "key": "blobs",
              "ocaml_key": "blobs",
              "optional": false,
              "nullable": false,
              "ty": [
                "Array",
                {
                  "path": {
                    "nsid": "com.atproto.sync.subscribeRepos",
                    "names": [ "commit", "blobs" ]
                  },
                  "description": null,
                  "maxLength": null,
                  "items": [ "Cid_link", { "description": null } ]
                }
              ]
            },
            {
              "key": "time",
              "ocaml_key": "time",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            {
              "nsid": "com.atproto.sync.subscribeRepos",
              "names": [ "repoOp" ]
            },
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: com.atproto.sync.subscribeRepos#repoOp; datetime; did;
*)
type sync_subscribeRepos_commit = {
  seq : int64;
  rebase : bool;
  tooBig : bool;
  repo : did;
  commit : cid_link;
  prev : cid_link nullable;
  blocks : bytes;
  ops : sync_subscribeRepos_repoOp list;
  blobs : cid_link list;
  time : datetime;
}

(*
  path: com.atproto.sync.subscribeRepos#handle;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.subscribeRepos",
            "names": [ "handle" ]
          },
          "description": null,
          "fields": [
            {
              "key": "seq",
              "ocaml_key": "seq",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "handle",
              "ocaml_key": "handle",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "handle",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "time",
              "ocaml_key": "time",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] },
            { "nsid": "handle", "names": [] }
          ]
        }
      ];
  deps: datetime; did; handle;
*)
type sync_subscribeRepos_handle = {
  seq : int64;
  did : did;
  handle : handle;
  time : datetime;
}

(*
  path: com.atproto.sync.subscribeRepos#info;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.subscribeRepos",
            "names": [ "info" ]
          },
          "description": null,
          "fields": [
            {
              "key": "name",
              "ocaml_key": "name",
              "optional": false,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": [ "OutdatedCursor" ],
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "message",
              "ocaml_key": "message",
              "optional": true,
              "nullable": false,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type sync_subscribeRepos_info = {name : string; message : string option}

(*
  path: com.atproto.sync.subscribeRepos#tombstone;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.subscribeRepos",
            "names": [ "tombstone" ]
          },
          "description": null,
          "fields": [
            {
              "key": "seq",
              "ocaml_key": "seq",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "time",
              "ocaml_key": "time",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: datetime; did;
*)
type sync_subscribeRepos_tombstone = {seq : int64; did : did; time : datetime}

(*
  path: com.atproto.sync.subscribeRepos#migrate;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.subscribeRepos",
            "names": [ "migrate" ]
          },
          "description": null,
          "fields": [
            {
              "key": "seq",
              "ocaml_key": "seq",
              "optional": false,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": null
                }
              ]
            },
            {
              "key": "did",
              "ocaml_key": "did",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "did",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "migrateTo",
              "ocaml_key": "migrateTo",
              "optional": false,
              "nullable": true,
              "ty": [
                "String",
                {
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            },
            {
              "key": "time",
              "ocaml_key": "time",
              "optional": false,
              "nullable": false,
              "ty": [
                "Format",
                {
                  "format": "datetime",
                  "description": null,
                  "knownValues": null,
                  "minLength": null,
                  "maxLength": null,
                  "maxGraphemes": null,
                  "default": null
                }
              ]
            }
          ],
          "deps": [
            { "nsid": "datetime", "names": [] },
            { "nsid": "did", "names": [] }
          ]
        }
      ];
  deps: datetime; did;
*)
type sync_subscribeRepos_migrate = {
  seq : int64;
  did : did;
  migrateTo : string nullable;
  time : datetime;
}

(*
  path: com.atproto.sync.subscribeRepos#main/message;
  ty: [
        "Union",
        {
          "path": {
            "nsid": "com.atproto.sync.subscribeRepos",
            "names": [ "main", "message" ]
          },
          "constrs": [
            {
              "ocaml_name": "Commit",
              "path": {
                "nsid": "com.atproto.sync.subscribeRepos",
                "names": [ "commit" ]
              }
            },
            {
              "ocaml_name": "Handle",
              "path": {
                "nsid": "com.atproto.sync.subscribeRepos",
                "names": [ "handle" ]
              }
            },
            {
              "ocaml_name": "Migrate",
              "path": {
                "nsid": "com.atproto.sync.subscribeRepos",
                "names": [ "migrate" ]
              }
            },
            {
              "ocaml_name": "Tombstone",
              "path": {
                "nsid": "com.atproto.sync.subscribeRepos",
                "names": [ "tombstone" ]
              }
            },
            {
              "ocaml_name": "Info",
              "path": {
                "nsid": "com.atproto.sync.subscribeRepos",
                "names": [ "info" ]
              }
            }
          ],
          "closed": null,
          "deps": [
            {
              "nsid": "com.atproto.sync.subscribeRepos",
              "names": [ "commit" ]
            },
            {
              "nsid": "com.atproto.sync.subscribeRepos",
              "names": [ "handle" ]
            },
            {
              "nsid": "com.atproto.sync.subscribeRepos",
              "names": [ "migrate" ]
            },
            {
              "nsid": "com.atproto.sync.subscribeRepos",
              "names": [ "tombstone" ]
            },
            {
              "nsid": "com.atproto.sync.subscribeRepos",
              "names": [ "info" ]
            }
          ]
        }
      ];
  deps: com.atproto.sync.subscribeRepos#commit;
        com.atproto.sync.subscribeRepos#handle;
        com.atproto.sync.subscribeRepos#migrate;
        com.atproto.sync.subscribeRepos#tombstone;
        com.atproto.sync.subscribeRepos#info;
*)
type sync_subscribeRepos_message =
  | Commit of sync_subscribeRepos_commit
  | Handle of sync_subscribeRepos_handle
  | Migrate of sync_subscribeRepos_migrate
  | Tombstone of sync_subscribeRepos_tombstone
  | Info of sync_subscribeRepos_info

(*
  path: com.atproto.sync.subscribeRepos#main/parameters;
  ty: [
        "Object",
        {
          "path": {
            "nsid": "com.atproto.sync.subscribeRepos",
            "names": [ "main", "parameters" ]
          },
          "description": null,
          "fields": [
            {
              "key": "cursor",
              "ocaml_key": "cursor",
              "optional": true,
              "nullable": false,
              "ty": [
                "Integer",
                {
                  "minimum": null,
                  "maximum": null,
                  "default": null,
                  "description": "The last known event to backfill from."
                }
              ]
            }
          ],
          "deps": []
        }
      ];
  deps: ;
*)
type sync_subscribeRepos_parameters = {cursor : int64 option}

open Ppx_yojson_conv_lib.Yojson_conv

let fail_yojson tyname mes (j : Yojson.Safe.t) =
  raise
    (Ppx_yojson_conv_lib.Yojson_conv.Of_yojson_error
       (Invalid_argument (tyname ^ ": " ^ mes), j))

let find_optional_field name kvs conv =
  let rec find_optional_field acc = function
    | [] -> None, kvs
    | (k, v) :: kvs when k = name -> Some (conv v), List.rev_append acc kvs
    | kv :: kvs -> find_optional_field (kv :: acc) kvs
  in
  find_optional_field [] kvs

let find_optional_nullable_field name kvs conv =
  let rec find_optional_field acc = function
    | [] -> None, kvs
    | (k, `Null) :: kvs when k = name -> None, List.rev_append acc kvs
    | (k, v) :: kvs when k = name -> Some (conv v), List.rev_append acc kvs
    | kv :: kvs -> find_optional_field (kv :: acc) kvs
  in
  find_optional_field [] kvs

let find_required_field path name kvs conv =
  let rec find_required_field acc = function
    | [] -> fail_yojson path ("key " ^ name ^ " required") (`Assoc kvs)
    | (k, v) :: kvs when k = name -> conv v, List.rev_append acc kvs
    | kv :: kvs -> find_required_field (kv :: acc) kvs
  in
  find_required_field [] kvs

let find_required_nullable_field path name kvs conv =
  let rec find_required_field acc = function
    | [] -> fail_yojson path ("key " ^ name ^ " required") (`Assoc kvs)
    | (k, `Null) :: kvs when k = name -> None, List.rev_append acc kvs
    | (k, v) :: kvs when k = name -> Some (conv v), List.rev_append acc kvs
    | kv :: kvs -> find_required_field (kv :: acc) kvs
  in
  find_required_field [] kvs

let actor_adultContentPref_of_yojson json =
  let path_string = "app.bsky.actor.defs#adultContentPref" in
  match json with
  | `Assoc kvs ->
      let enabled, kvs =
        find_required_field path_string "enabled" kvs bool_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({enabled} : actor_adultContentPref)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_adultContentPref (_object_ : actor_adultContentPref) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.defs#adultContentPref");
         Some ("enabled", yojson_of_bool _object_.enabled);
       ])

let actor_contentLabelPref_of_yojson json =
  let path_string = "app.bsky.actor.defs#contentLabelPref" in
  match json with
  | `Assoc kvs ->
      let label, kvs =
        find_required_field path_string "label" kvs string_of_yojson
      in
      let visibility, kvs =
        find_required_field path_string "visibility" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({label; visibility} : actor_contentLabelPref)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_contentLabelPref (_object_ : actor_contentLabelPref) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.defs#contentLabelPref");
         Some ("label", yojson_of_string _object_.label);
         Some ("visibility", yojson_of_string _object_.visibility);
       ])

let at_uri_of_yojson = string_of_yojson

let yojson_of_at_uri = yojson_of_string

let actor_savedFeedsPref_of_yojson json =
  let path_string = "app.bsky.actor.defs#savedFeedsPref" in
  match json with
  | `Assoc kvs ->
      let pinned, kvs =
        find_required_field
          path_string
          "pinned"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let saved, kvs =
        find_required_field
          path_string
          "saved"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({pinned; saved} : actor_savedFeedsPref)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_savedFeedsPref (_object_ : actor_savedFeedsPref) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.defs#savedFeedsPref");
         Some ("pinned", (yojson_of_list yojson_of_string) _object_.pinned);
         Some ("saved", (yojson_of_list yojson_of_string) _object_.saved);
       ])

let actor_preferences_item_of_yojson json =
  let path_string = "app.bsky.actor.defs#preferences/item" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "app.bsky.actor.defs#adultContentPref" ->
           AdultContentPref (actor_adultContentPref_of_yojson json)
       | "app.bsky.actor.defs#contentLabelPref" ->
           ContentLabelPref (actor_contentLabelPref_of_yojson json)
       | "app.bsky.actor.defs#savedFeedsPref" ->
           SavedFeedsPref (actor_savedFeedsPref_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : actor_preferences_item)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_preferences_item (union : actor_preferences_item) =
  match union with
  | AdultContentPref x -> yojson_of_actor_adultContentPref x
  | ContentLabelPref x -> yojson_of_actor_contentLabelPref x
  | SavedFeedsPref x -> yojson_of_actor_savedFeedsPref x

let actor_preferences_of_yojson =
  list_of_yojson actor_preferences_item_of_yojson

let yojson_of_actor_preferences =
  yojson_of_list yojson_of_actor_preferences_item

let handle_of_yojson = string_of_yojson

let yojson_of_handle = yojson_of_string

let did_of_yojson = string_of_yojson

let yojson_of_did = yojson_of_string

let datetime_of_yojson = string_of_yojson

let yojson_of_datetime = yojson_of_string

let uri_of_yojson = string_of_yojson

let yojson_of_uri = yojson_of_string

let cid_of_yojson = string_of_yojson

let yojson_of_cid = yojson_of_string

let label_label_of_yojson json =
  let path_string = "com.atproto.label.defs#label" in
  match json with
  | `Assoc kvs ->
      let src, kvs =
        find_required_field path_string "src" kvs string_of_yojson
      in
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs = find_optional_field "cid" kvs string_of_yojson in
      let val_, kvs =
        find_required_field path_string "val" kvs string_of_yojson
      in
      let neg, kvs = find_optional_field "neg" kvs bool_of_yojson in
      let cts, kvs =
        find_required_field path_string "cts" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({src; uri; cid; val_; neg; cts} : label_label)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_label_label (_object_ : label_label) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.label.defs#label");
         Some ("src", yojson_of_string _object_.src);
         Some ("uri", yojson_of_string _object_.uri);
         Option.map (fun v -> "cid", yojson_of_string v) _object_.cid;
         Some ("val", yojson_of_string _object_.val_);
         Option.map (fun v -> "neg", yojson_of_bool v) _object_.neg;
         Some ("cts", yojson_of_string _object_.cts);
       ])

let graph_listViewerState_of_yojson json =
  let path_string = "app.bsky.graph.defs#listViewerState" in
  match json with
  | `Assoc kvs ->
      let muted, kvs = find_optional_field "muted" kvs bool_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({muted} : graph_listViewerState)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_listViewerState (_object_ : graph_listViewerState) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.defs#listViewerState");
         Option.map (fun v -> "muted", yojson_of_bool v) _object_.muted;
       ])

let graph_listPurpose_of_yojson = string_of_yojson

let yojson_of_graph_listPurpose = yojson_of_string

let graph_listViewBasic_of_yojson json =
  let path_string = "app.bsky.graph.defs#listViewBasic" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs =
        find_required_field path_string "cid" kvs string_of_yojson
      in
      let name, kvs =
        find_required_field path_string "name" kvs string_of_yojson
      in
      let purpose, kvs =
        find_required_field
          path_string
          "purpose"
          kvs
          graph_listPurpose_of_yojson
      in
      let avatar, kvs = find_optional_field "avatar" kvs string_of_yojson in
      let viewer, kvs =
        find_optional_field "viewer" kvs graph_listViewerState_of_yojson
      in
      let indexedAt, kvs =
        find_optional_field "indexedAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({uri; cid; name; purpose; avatar; viewer; indexedAt}
          : graph_listViewBasic)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_listViewBasic (_object_ : graph_listViewBasic) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.defs#listViewBasic");
         Some ("uri", yojson_of_string _object_.uri);
         Some ("cid", yojson_of_string _object_.cid);
         Some ("name", yojson_of_string _object_.name);
         Some ("purpose", yojson_of_graph_listPurpose _object_.purpose);
         Option.map (fun v -> "avatar", yojson_of_string v) _object_.avatar;
         Option.map
           (fun v -> "viewer", yojson_of_graph_listViewerState v)
           _object_.viewer;
         Option.map
           (fun v -> "indexedAt", yojson_of_string v)
           _object_.indexedAt;
       ])

let actor_viewerState_of_yojson json =
  let path_string = "app.bsky.actor.defs#viewerState" in
  match json with
  | `Assoc kvs ->
      let muted, kvs = find_optional_field "muted" kvs bool_of_yojson in
      let mutedByList, kvs =
        find_optional_field "mutedByList" kvs graph_listViewBasic_of_yojson
      in
      let blockedBy, kvs = find_optional_field "blockedBy" kvs bool_of_yojson in
      let blocking, kvs = find_optional_field "blocking" kvs string_of_yojson in
      let following, kvs =
        find_optional_field "following" kvs string_of_yojson
      in
      let followedBy, kvs =
        find_optional_field "followedBy" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({muted; mutedByList; blockedBy; blocking; following; followedBy}
          : actor_viewerState)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_viewerState (_object_ : actor_viewerState) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.defs#viewerState");
         Option.map (fun v -> "muted", yojson_of_bool v) _object_.muted;
         Option.map
           (fun v -> "mutedByList", yojson_of_graph_listViewBasic v)
           _object_.mutedByList;
         Option.map (fun v -> "blockedBy", yojson_of_bool v) _object_.blockedBy;
         Option.map (fun v -> "blocking", yojson_of_string v) _object_.blocking;
         Option.map
           (fun v -> "following", yojson_of_string v)
           _object_.following;
         Option.map
           (fun v -> "followedBy", yojson_of_string v)
           _object_.followedBy;
       ])

let actor_profileView_of_yojson json =
  let path_string = "app.bsky.actor.defs#profileView" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let handle, kvs =
        find_required_field path_string "handle" kvs string_of_yojson
      in
      let displayName, kvs =
        find_optional_field "displayName" kvs string_of_yojson
      in
      let description, kvs =
        find_optional_field "description" kvs string_of_yojson
      in
      let avatar, kvs = find_optional_field "avatar" kvs string_of_yojson in
      let indexedAt, kvs =
        find_optional_field "indexedAt" kvs string_of_yojson
      in
      let viewer, kvs =
        find_optional_field "viewer" kvs actor_viewerState_of_yojson
      in
      let labels, kvs =
        find_optional_field "labels" kvs (list_of_yojson label_label_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({
           did;
           handle;
           displayName;
           description;
           avatar;
           indexedAt;
           viewer;
           labels;
         }
          : actor_profileView)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_profileView (_object_ : actor_profileView) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.defs#profileView");
         Some ("did", yojson_of_string _object_.did);
         Some ("handle", yojson_of_string _object_.handle);
         Option.map
           (fun v -> "displayName", yojson_of_string v)
           _object_.displayName;
         Option.map
           (fun v -> "description", yojson_of_string v)
           _object_.description;
         Option.map (fun v -> "avatar", yojson_of_string v) _object_.avatar;
         Option.map
           (fun v -> "indexedAt", yojson_of_string v)
           _object_.indexedAt;
         Option.map
           (fun v -> "viewer", yojson_of_actor_viewerState v)
           _object_.viewer;
         Option.map
           (fun v -> "labels", (yojson_of_list yojson_of_label_label) v)
           _object_.labels;
       ])

let actor_profileViewBasic_of_yojson json =
  let path_string = "app.bsky.actor.defs#profileViewBasic" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let handle, kvs =
        find_required_field path_string "handle" kvs string_of_yojson
      in
      let displayName, kvs =
        find_optional_field "displayName" kvs string_of_yojson
      in
      let avatar, kvs = find_optional_field "avatar" kvs string_of_yojson in
      let viewer, kvs =
        find_optional_field "viewer" kvs actor_viewerState_of_yojson
      in
      let labels, kvs =
        find_optional_field "labels" kvs (list_of_yojson label_label_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({did; handle; displayName; avatar; viewer; labels}
          : actor_profileViewBasic)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_profileViewBasic (_object_ : actor_profileViewBasic) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.defs#profileViewBasic");
         Some ("did", yojson_of_string _object_.did);
         Some ("handle", yojson_of_string _object_.handle);
         Option.map
           (fun v -> "displayName", yojson_of_string v)
           _object_.displayName;
         Option.map (fun v -> "avatar", yojson_of_string v) _object_.avatar;
         Option.map
           (fun v -> "viewer", yojson_of_actor_viewerState v)
           _object_.viewer;
         Option.map
           (fun v -> "labels", (yojson_of_list yojson_of_label_label) v)
           _object_.labels;
       ])

let actor_profileViewDetailed_of_yojson json =
  let path_string = "app.bsky.actor.defs#profileViewDetailed" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let handle, kvs =
        find_required_field path_string "handle" kvs string_of_yojson
      in
      let displayName, kvs =
        find_optional_field "displayName" kvs string_of_yojson
      in
      let description, kvs =
        find_optional_field "description" kvs string_of_yojson
      in
      let avatar, kvs = find_optional_field "avatar" kvs string_of_yojson in
      let banner, kvs = find_optional_field "banner" kvs string_of_yojson in
      let followersCount, kvs =
        find_optional_field "followersCount" kvs int64_of_yojson
      in
      let followsCount, kvs =
        find_optional_field "followsCount" kvs int64_of_yojson
      in
      let postsCount, kvs =
        find_optional_field "postsCount" kvs int64_of_yojson
      in
      let indexedAt, kvs =
        find_optional_field "indexedAt" kvs string_of_yojson
      in
      let viewer, kvs =
        find_optional_field "viewer" kvs actor_viewerState_of_yojson
      in
      let labels, kvs =
        find_optional_field "labels" kvs (list_of_yojson label_label_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({
           did;
           handle;
           displayName;
           description;
           avatar;
           banner;
           followersCount;
           followsCount;
           postsCount;
           indexedAt;
           viewer;
           labels;
         }
          : actor_profileViewDetailed)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_profileViewDetailed (_object_ : actor_profileViewDetailed) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.defs#profileViewDetailed");
         Some ("did", yojson_of_string _object_.did);
         Some ("handle", yojson_of_string _object_.handle);
         Option.map
           (fun v -> "displayName", yojson_of_string v)
           _object_.displayName;
         Option.map
           (fun v -> "description", yojson_of_string v)
           _object_.description;
         Option.map (fun v -> "avatar", yojson_of_string v) _object_.avatar;
         Option.map (fun v -> "banner", yojson_of_string v) _object_.banner;
         Option.map
           (fun v -> "followersCount", yojson_of_int64 v)
           _object_.followersCount;
         Option.map
           (fun v -> "followsCount", yojson_of_int64 v)
           _object_.followsCount;
         Option.map
           (fun v -> "postsCount", yojson_of_int64 v)
           _object_.postsCount;
         Option.map
           (fun v -> "indexedAt", yojson_of_string v)
           _object_.indexedAt;
         Option.map
           (fun v -> "viewer", yojson_of_actor_viewerState v)
           _object_.viewer;
         Option.map
           (fun v -> "labels", (yojson_of_list yojson_of_label_label) v)
           _object_.labels;
       ])

let actor_getPreferences_output_of_yojson json =
  let path_string = "app.bsky.actor.getPreferences#main/output" in
  match json with
  | `Assoc kvs ->
      let preferences, kvs =
        find_required_field
          path_string
          "preferences"
          kvs
          actor_preferences_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({preferences} : actor_getPreferences_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_getPreferences_output
    (_object_ : actor_getPreferences_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.getPreferences#main/output");
         Some ("preferences", yojson_of_actor_preferences _object_.preferences);
       ])

let actor_getPreferences_parameters_of_yojson json =
  let path_string = "app.bsky.actor.getPreferences#main/parameters" in
  match json with
  | `Assoc kvs ->
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else (() : actor_getPreferences_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_getPreferences_parameters
    (_object_ : actor_getPreferences_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [Some ("$type", `String "app.bsky.actor.getPreferences#main/parameters")])

let at_identifier_of_yojson = string_of_yojson

let yojson_of_at_identifier = yojson_of_string

let actor_getProfile_parameters_of_yojson json =
  let path_string = "app.bsky.actor.getProfile#main/parameters" in
  match json with
  | `Assoc kvs ->
      let actor, kvs =
        find_required_field path_string "actor" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({actor} : actor_getProfile_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_getProfile_parameters
    (_object_ : actor_getProfile_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.getProfile#main/parameters");
         Some ("actor", yojson_of_string _object_.actor);
       ])

let actor_getProfiles_output_of_yojson json =
  let path_string = "app.bsky.actor.getProfiles#main/output" in
  match json with
  | `Assoc kvs ->
      let profiles, kvs =
        find_required_field
          path_string
          "profiles"
          kvs
          (list_of_yojson actor_profileViewDetailed_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({profiles} : actor_getProfiles_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_getProfiles_output (_object_ : actor_getProfiles_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.getProfiles#main/output");
         Some
           ( "profiles",
             (yojson_of_list yojson_of_actor_profileViewDetailed)
               _object_.profiles );
       ])

let actor_getProfiles_parameters_of_yojson json =
  let path_string = "app.bsky.actor.getProfiles#main/parameters" in
  match json with
  | `Assoc kvs ->
      let actors, kvs =
        find_required_field
          path_string
          "actors"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({actors} : actor_getProfiles_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_getProfiles_parameters
    (_object_ : actor_getProfiles_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.getProfiles#main/parameters");
         Some ("actors", (yojson_of_list yojson_of_string) _object_.actors);
       ])

let actor_getSuggestions_output_of_yojson json =
  let path_string = "app.bsky.actor.getSuggestions#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let actors, kvs =
        find_required_field
          path_string
          "actors"
          kvs
          (list_of_yojson actor_profileView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; actors} : actor_getSuggestions_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_getSuggestions_output
    (_object_ : actor_getSuggestions_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.getSuggestions#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ( "actors",
             (yojson_of_list yojson_of_actor_profileView) _object_.actors );
       ])

let actor_getSuggestions_parameters_of_yojson json =
  let path_string = "app.bsky.actor.getSuggestions#main/parameters" in
  match json with
  | `Assoc kvs ->
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({limit; cursor} : actor_getSuggestions_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_getSuggestions_parameters
    (_object_ : actor_getSuggestions_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.getSuggestions#main/parameters");
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let actor_profile_of_yojson json =
  let path_string = "app.bsky.actor.profile" in
  match json with
  | `Assoc kvs ->
      let displayName, kvs =
        find_optional_field "displayName" kvs string_of_yojson
      in
      let description, kvs =
        find_optional_field "description" kvs string_of_yojson
      in
      let avatar, kvs = find_optional_field "avatar" kvs bytes_of_yojson in
      let banner, kvs = find_optional_field "banner" kvs bytes_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({displayName; description; avatar; banner} : actor_profile)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_profile (_object_ : actor_profile) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.profile");
         Option.map
           (fun v -> "displayName", yojson_of_string v)
           _object_.displayName;
         Option.map
           (fun v -> "description", yojson_of_string v)
           _object_.description;
         Option.map (fun v -> "avatar", yojson_of_bytes v) _object_.avatar;
         Option.map (fun v -> "banner", yojson_of_bytes v) _object_.banner;
       ])

let actor_putPreferences_input_of_yojson json =
  let path_string = "app.bsky.actor.putPreferences#main/input" in
  match json with
  | `Assoc kvs ->
      let preferences, kvs =
        find_required_field
          path_string
          "preferences"
          kvs
          actor_preferences_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({preferences} : actor_putPreferences_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_putPreferences_input (_object_ : actor_putPreferences_input)
    =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.putPreferences#main/input");
         Some ("preferences", yojson_of_actor_preferences _object_.preferences);
       ])

let actor_searchActors_output_of_yojson json =
  let path_string = "app.bsky.actor.searchActors#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let actors, kvs =
        find_required_field
          path_string
          "actors"
          kvs
          (list_of_yojson actor_profileView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; actors} : actor_searchActors_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_searchActors_output (_object_ : actor_searchActors_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.searchActors#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ( "actors",
             (yojson_of_list yojson_of_actor_profileView) _object_.actors );
       ])

let actor_searchActors_parameters_of_yojson json =
  let path_string = "app.bsky.actor.searchActors#main/parameters" in
  match json with
  | `Assoc kvs ->
      let term, kvs = find_optional_field "term" kvs string_of_yojson in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({term; limit; cursor} : actor_searchActors_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_searchActors_parameters
    (_object_ : actor_searchActors_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.actor.searchActors#main/parameters");
         Option.map (fun v -> "term", yojson_of_string v) _object_.term;
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let actor_searchActorsTypeahead_output_of_yojson json =
  let path_string = "app.bsky.actor.searchActorsTypeahead#main/output" in
  match json with
  | `Assoc kvs ->
      let actors, kvs =
        find_required_field
          path_string
          "actors"
          kvs
          (list_of_yojson actor_profileViewBasic_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({actors} : actor_searchActorsTypeahead_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_searchActorsTypeahead_output
    (_object_ : actor_searchActorsTypeahead_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "app.bsky.actor.searchActorsTypeahead#main/output");
         Some
           ( "actors",
             (yojson_of_list yojson_of_actor_profileViewBasic) _object_.actors
           );
       ])

let actor_searchActorsTypeahead_parameters_of_yojson json =
  let path_string = "app.bsky.actor.searchActorsTypeahead#main/parameters" in
  match json with
  | `Assoc kvs ->
      let term, kvs = find_optional_field "term" kvs string_of_yojson in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({term; limit} : actor_searchActorsTypeahead_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_actor_searchActorsTypeahead_parameters
    (_object_ : actor_searchActorsTypeahead_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "app.bsky.actor.searchActorsTypeahead#main/parameters" );
         Option.map (fun v -> "term", yojson_of_string v) _object_.term;
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
       ])

let embed_external_external_of_yojson json =
  let path_string = "app.bsky.embed.external#external" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let title, kvs =
        find_required_field path_string "title" kvs string_of_yojson
      in
      let description, kvs =
        find_required_field path_string "description" kvs string_of_yojson
      in
      let thumb, kvs = find_optional_field "thumb" kvs bytes_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri; title; description; thumb} : embed_external_external)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_embed_external_external (_object_ : embed_external_external) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.embed.external#external");
         Some ("uri", yojson_of_string _object_.uri);
         Some ("title", yojson_of_string _object_.title);
         Some ("description", yojson_of_string _object_.description);
         Option.map (fun v -> "thumb", yojson_of_bytes v) _object_.thumb;
       ])

let embed_external_of_yojson json =
  let path_string = "app.bsky.embed.external" in
  match json with
  | `Assoc kvs ->
      let external_, kvs =
        find_required_field
          path_string
          "external"
          kvs
          embed_external_external_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({external_} : embed_external)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_embed_external (_object_ : embed_external) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.embed.external");
         Some ("external", yojson_of_embed_external_external _object_.external_);
       ])

let embed_external_viewExternal_of_yojson json =
  let path_string = "app.bsky.embed.external#viewExternal" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let title, kvs =
        find_required_field path_string "title" kvs string_of_yojson
      in
      let description, kvs =
        find_required_field path_string "description" kvs string_of_yojson
      in
      let thumb, kvs = find_optional_field "thumb" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri; title; description; thumb} : embed_external_viewExternal)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_embed_external_viewExternal
    (_object_ : embed_external_viewExternal) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.embed.external#viewExternal");
         Some ("uri", yojson_of_string _object_.uri);
         Some ("title", yojson_of_string _object_.title);
         Some ("description", yojson_of_string _object_.description);
         Option.map (fun v -> "thumb", yojson_of_string v) _object_.thumb;
       ])

let embed_external_view_of_yojson json =
  let path_string = "app.bsky.embed.external#view" in
  match json with
  | `Assoc kvs ->
      let external_, kvs =
        find_required_field
          path_string
          "external"
          kvs
          embed_external_viewExternal_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({external_} : embed_external_view)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_embed_external_view (_object_ : embed_external_view) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.embed.external#view");
         Some
           ("external", yojson_of_embed_external_viewExternal _object_.external_);
       ])

let embed_images_image_of_yojson json =
  let path_string = "app.bsky.embed.images#image" in
  match json with
  | `Assoc kvs ->
      let image, kvs =
        find_required_field path_string "image" kvs bytes_of_yojson
      in
      let alt, kvs =
        find_required_field path_string "alt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({image; alt} : embed_images_image)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_embed_images_image (_object_ : embed_images_image) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.embed.images#image");
         Some ("image", yojson_of_bytes _object_.image);
         Some ("alt", yojson_of_string _object_.alt);
       ])

let embed_images_of_yojson json =
  let path_string = "app.bsky.embed.images" in
  match json with
  | `Assoc kvs ->
      let images, kvs =
        find_required_field
          path_string
          "images"
          kvs
          (list_of_yojson embed_images_image_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({images} : embed_images)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_embed_images (_object_ : embed_images) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.embed.images");
         Some
           ( "images",
             (yojson_of_list yojson_of_embed_images_image) _object_.images );
       ])

let embed_images_viewImage_of_yojson json =
  let path_string = "app.bsky.embed.images#viewImage" in
  match json with
  | `Assoc kvs ->
      let thumb, kvs =
        find_required_field path_string "thumb" kvs string_of_yojson
      in
      let fullsize, kvs =
        find_required_field path_string "fullsize" kvs string_of_yojson
      in
      let alt, kvs =
        find_required_field path_string "alt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({thumb; fullsize; alt} : embed_images_viewImage)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_embed_images_viewImage (_object_ : embed_images_viewImage) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.embed.images#viewImage");
         Some ("thumb", yojson_of_string _object_.thumb);
         Some ("fullsize", yojson_of_string _object_.fullsize);
         Some ("alt", yojson_of_string _object_.alt);
       ])

let embed_images_view_of_yojson json =
  let path_string = "app.bsky.embed.images#view" in
  match json with
  | `Assoc kvs ->
      let images, kvs =
        find_required_field
          path_string
          "images"
          kvs
          (list_of_yojson embed_images_viewImage_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({images} : embed_images_view)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_embed_images_view (_object_ : embed_images_view) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.embed.images#view");
         Some
           ( "images",
             (yojson_of_list yojson_of_embed_images_viewImage) _object_.images
           );
       ])

let repo_strongRef_of_yojson json =
  let path_string = "com.atproto.repo.strongRef" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs =
        find_required_field path_string "cid" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri; cid} : repo_strongRef)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_strongRef (_object_ : repo_strongRef) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.strongRef");
         Some ("uri", yojson_of_string _object_.uri);
         Some ("cid", yojson_of_string _object_.cid);
       ])

let embed_record_of_yojson json =
  let path_string = "app.bsky.embed.record" in
  match json with
  | `Assoc kvs ->
      let record, kvs =
        find_required_field path_string "record" kvs repo_strongRef_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({record} : embed_record)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_embed_record (_object_ : embed_record) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.embed.record");
         Some ("record", yojson_of_repo_strongRef _object_.record);
       ])

let richtext_facet_mention_of_yojson json =
  let path_string = "app.bsky.richtext.facet#mention" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did} : richtext_facet_mention)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_richtext_facet_mention (_object_ : richtext_facet_mention) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.richtext.facet#mention");
         Some ("did", yojson_of_string _object_.did);
       ])

let richtext_facet_link_of_yojson json =
  let path_string = "app.bsky.richtext.facet#link" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri} : richtext_facet_link)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_richtext_facet_link (_object_ : richtext_facet_link) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.richtext.facet#link");
         Some ("uri", yojson_of_string _object_.uri);
       ])

let richtext_facet_features_item_of_yojson json =
  let path_string = "app.bsky.richtext.facet#main/features/item" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "app.bsky.richtext.facet#mention" ->
           Mention (richtext_facet_mention_of_yojson json)
       | "app.bsky.richtext.facet#link" ->
           Link (richtext_facet_link_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : richtext_facet_features_item)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_richtext_facet_features_item
    (union : richtext_facet_features_item) =
  match union with
  | Mention x -> yojson_of_richtext_facet_mention x
  | Link x -> yojson_of_richtext_facet_link x

let richtext_facet_byteSlice_of_yojson json =
  let path_string = "app.bsky.richtext.facet#byteSlice" in
  match json with
  | `Assoc kvs ->
      let byteStart, kvs =
        find_required_field path_string "byteStart" kvs int64_of_yojson
      in
      let byteEnd, kvs =
        find_required_field path_string "byteEnd" kvs int64_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({byteStart; byteEnd} : richtext_facet_byteSlice)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_richtext_facet_byteSlice (_object_ : richtext_facet_byteSlice) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.richtext.facet#byteSlice");
         Some ("byteStart", yojson_of_int64 _object_.byteStart);
         Some ("byteEnd", yojson_of_int64 _object_.byteEnd);
       ])

let richtext_facet_of_yojson json =
  let path_string = "app.bsky.richtext.facet" in
  match json with
  | `Assoc kvs ->
      let index, kvs =
        find_required_field
          path_string
          "index"
          kvs
          richtext_facet_byteSlice_of_yojson
      in
      let features, kvs =
        find_required_field
          path_string
          "features"
          kvs
          (list_of_yojson richtext_facet_features_item_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({index; features} : richtext_facet)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_richtext_facet (_object_ : richtext_facet) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.richtext.facet");
         Some ("index", yojson_of_richtext_facet_byteSlice _object_.index);
         Some
           ( "features",
             (yojson_of_list yojson_of_richtext_facet_features_item)
               _object_.features );
       ])

let graph_listView_of_yojson json =
  let path_string = "app.bsky.graph.defs#listView" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs =
        find_required_field path_string "cid" kvs string_of_yojson
      in
      let creator, kvs =
        find_required_field
          path_string
          "creator"
          kvs
          actor_profileView_of_yojson
      in
      let name, kvs =
        find_required_field path_string "name" kvs string_of_yojson
      in
      let purpose, kvs =
        find_required_field
          path_string
          "purpose"
          kvs
          graph_listPurpose_of_yojson
      in
      let description, kvs =
        find_optional_field "description" kvs string_of_yojson
      in
      let descriptionFacets, kvs =
        find_optional_field
          "descriptionFacets"
          kvs
          (list_of_yojson richtext_facet_of_yojson)
      in
      let avatar, kvs = find_optional_field "avatar" kvs string_of_yojson in
      let viewer, kvs =
        find_optional_field "viewer" kvs graph_listViewerState_of_yojson
      in
      let indexedAt, kvs =
        find_required_field path_string "indexedAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({
           uri;
           cid;
           creator;
           name;
           purpose;
           description;
           descriptionFacets;
           avatar;
           viewer;
           indexedAt;
         }
          : graph_listView)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_listView (_object_ : graph_listView) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.defs#listView");
         Some ("uri", yojson_of_string _object_.uri);
         Some ("cid", yojson_of_string _object_.cid);
         Some ("creator", yojson_of_actor_profileView _object_.creator);
         Some ("name", yojson_of_string _object_.name);
         Some ("purpose", yojson_of_graph_listPurpose _object_.purpose);
         Option.map
           (fun v -> "description", yojson_of_string v)
           _object_.description;
         Option.map
           (fun v ->
             "descriptionFacets", (yojson_of_list yojson_of_richtext_facet) v)
           _object_.descriptionFacets;
         Option.map (fun v -> "avatar", yojson_of_string v) _object_.avatar;
         Option.map
           (fun v -> "viewer", yojson_of_graph_listViewerState v)
           _object_.viewer;
         Some ("indexedAt", yojson_of_string _object_.indexedAt);
       ])

let feed_generatorViewerState_of_yojson json =
  let path_string = "app.bsky.feed.defs#generatorViewerState" in
  match json with
  | `Assoc kvs ->
      let like, kvs = find_optional_field "like" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({like} : feed_generatorViewerState)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_generatorViewerState (_object_ : feed_generatorViewerState) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.defs#generatorViewerState");
         Option.map (fun v -> "like", yojson_of_string v) _object_.like;
       ])

let feed_generatorView_of_yojson json =
  let path_string = "app.bsky.feed.defs#generatorView" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs =
        find_required_field path_string "cid" kvs string_of_yojson
      in
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let creator, kvs =
        find_required_field
          path_string
          "creator"
          kvs
          actor_profileView_of_yojson
      in
      let displayName, kvs =
        find_required_field path_string "displayName" kvs string_of_yojson
      in
      let description, kvs =
        find_optional_field "description" kvs string_of_yojson
      in
      let descriptionFacets, kvs =
        find_optional_field
          "descriptionFacets"
          kvs
          (list_of_yojson richtext_facet_of_yojson)
      in
      let avatar, kvs = find_optional_field "avatar" kvs string_of_yojson in
      let likeCount, kvs =
        find_optional_field "likeCount" kvs int64_of_yojson
      in
      let viewer, kvs =
        find_optional_field "viewer" kvs feed_generatorViewerState_of_yojson
      in
      let indexedAt, kvs =
        find_required_field path_string "indexedAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({
           uri;
           cid;
           did;
           creator;
           displayName;
           description;
           descriptionFacets;
           avatar;
           likeCount;
           viewer;
           indexedAt;
         }
          : feed_generatorView)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_generatorView (_object_ : feed_generatorView) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.defs#generatorView");
         Some ("uri", yojson_of_string _object_.uri);
         Some ("cid", yojson_of_string _object_.cid);
         Some ("did", yojson_of_string _object_.did);
         Some ("creator", yojson_of_actor_profileView _object_.creator);
         Some ("displayName", yojson_of_string _object_.displayName);
         Option.map
           (fun v -> "description", yojson_of_string v)
           _object_.description;
         Option.map
           (fun v ->
             "descriptionFacets", (yojson_of_list yojson_of_richtext_facet) v)
           _object_.descriptionFacets;
         Option.map (fun v -> "avatar", yojson_of_string v) _object_.avatar;
         Option.map (fun v -> "likeCount", yojson_of_int64 v) _object_.likeCount;
         Option.map
           (fun v -> "viewer", yojson_of_feed_generatorViewerState v)
           _object_.viewer;
         Some ("indexedAt", yojson_of_string _object_.indexedAt);
       ])

let embed_recordWithMedia_view_media_of_yojson json =
  let path_string = "app.bsky.embed.recordWithMedia#view/media" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "app.bsky.embed.images#view" ->
           Images (embed_images_view_of_yojson json)
       | "app.bsky.embed.external#view" ->
           External (embed_external_view_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : embed_recordWithMedia_view_media)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_embed_recordWithMedia_view_media
    (union : embed_recordWithMedia_view_media) =
  match union with
  | Images x -> yojson_of_embed_images_view x
  | External x -> yojson_of_embed_external_view x

let embed_record_viewNotFound_of_yojson json =
  let path_string = "app.bsky.embed.record#viewNotFound" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri} : embed_record_viewNotFound)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_embed_record_viewNotFound (_object_ : embed_record_viewNotFound) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.embed.record#viewNotFound");
         Some ("uri", yojson_of_string _object_.uri);
       ])

let embed_record_viewBlocked_of_yojson json =
  let path_string = "app.bsky.embed.record#viewBlocked" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri} : embed_record_viewBlocked)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_embed_record_viewBlocked (_object_ : embed_record_viewBlocked) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.embed.record#viewBlocked");
         Some ("uri", yojson_of_string _object_.uri);
       ])

let rec embed_recordWithMedia_view_of_yojson json =
  let path_string = "app.bsky.embed.recordWithMedia#view" in
  match json with
  | `Assoc kvs ->
      let record, kvs =
        find_required_field path_string "record" kvs embed_record_view_of_yojson
      in
      let media, kvs =
        find_required_field
          path_string
          "media"
          kvs
          embed_recordWithMedia_view_media_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({record; media} : embed_recordWithMedia_view)
  | _ -> fail_yojson path_string "Assoc expected" json

and embed_record_viewRecord_embeds_item_of_yojson json =
  let path_string = "app.bsky.embed.record#viewRecord/embeds/item" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "app.bsky.embed.images#view" ->
           Images (embed_images_view_of_yojson json)
       | "app.bsky.embed.external#view" ->
           External (embed_external_view_of_yojson json)
       | "app.bsky.embed.record#view" ->
           Record (embed_record_view_of_yojson json)
       | "app.bsky.embed.recordWithMedia#view" ->
           RecordWithMedia (embed_recordWithMedia_view_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : embed_record_viewRecord_embeds_item)
  | json -> fail_yojson path_string "Assoc expected" json

and embed_record_viewRecord_of_yojson json =
  let path_string = "app.bsky.embed.record#viewRecord" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs =
        find_required_field path_string "cid" kvs string_of_yojson
      in
      let author, kvs =
        find_required_field
          path_string
          "author"
          kvs
          actor_profileViewBasic_of_yojson
      in
      let value, kvs = find_required_field path_string "value" kvs Fun.id in
      let labels, kvs =
        find_optional_field "labels" kvs (list_of_yojson label_label_of_yojson)
      in
      let embeds, kvs =
        find_optional_field
          "embeds"
          kvs
          (list_of_yojson embed_record_viewRecord_embeds_item_of_yojson)
      in
      let indexedAt, kvs =
        find_required_field path_string "indexedAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({uri; cid; author; value; labels; embeds; indexedAt}
          : embed_record_viewRecord)
  | _ -> fail_yojson path_string "Assoc expected" json

and embed_record_view_record_of_yojson json =
  let path_string = "app.bsky.embed.record#view/record" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "app.bsky.embed.record#viewRecord" ->
           ViewRecord (embed_record_viewRecord_of_yojson json)
       | "app.bsky.embed.record#viewNotFound" ->
           ViewNotFound (embed_record_viewNotFound_of_yojson json)
       | "app.bsky.embed.record#viewBlocked" ->
           ViewBlocked (embed_record_viewBlocked_of_yojson json)
       | "app.bsky.feed.defs#generatorView" ->
           GeneratorView (feed_generatorView_of_yojson json)
       | "app.bsky.graph.defs#listView" ->
           ListView (graph_listView_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : embed_record_view_record)
  | json -> fail_yojson path_string "Assoc expected" json

and embed_record_view_of_yojson json =
  let path_string = "app.bsky.embed.record#view" in
  match json with
  | `Assoc kvs ->
      let record, kvs =
        find_required_field
          path_string
          "record"
          kvs
          embed_record_view_record_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({record} : embed_record_view)
  | _ -> fail_yojson path_string "Assoc expected" json

let rec yojson_of_embed_recordWithMedia_view
    (_object_ : embed_recordWithMedia_view) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.embed.recordWithMedia#view");
         Some ("record", yojson_of_embed_record_view _object_.record);
         Some
           ("media", yojson_of_embed_recordWithMedia_view_media _object_.media);
       ])

and yojson_of_embed_record_viewRecord_embeds_item
    (union : embed_record_viewRecord_embeds_item) =
  match union with
  | Images x -> yojson_of_embed_images_view x
  | External x -> yojson_of_embed_external_view x
  | Record x -> yojson_of_embed_record_view x
  | RecordWithMedia x -> yojson_of_embed_recordWithMedia_view x

and yojson_of_embed_record_viewRecord (_object_ : embed_record_viewRecord) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.embed.record#viewRecord");
         Some ("uri", yojson_of_string _object_.uri);
         Some ("cid", yojson_of_string _object_.cid);
         Some ("author", yojson_of_actor_profileViewBasic _object_.author);
         Some ("value", Fun.id _object_.value);
         Option.map
           (fun v -> "labels", (yojson_of_list yojson_of_label_label) v)
           _object_.labels;
         Option.map
           (fun v ->
             ( "embeds",
               (yojson_of_list yojson_of_embed_record_viewRecord_embeds_item) v
             ))
           _object_.embeds;
         Some ("indexedAt", yojson_of_string _object_.indexedAt);
       ])

and yojson_of_embed_record_view_record (union : embed_record_view_record) =
  match union with
  | ViewRecord x -> yojson_of_embed_record_viewRecord x
  | ViewNotFound x -> yojson_of_embed_record_viewNotFound x
  | ViewBlocked x -> yojson_of_embed_record_viewBlocked x
  | GeneratorView x -> yojson_of_feed_generatorView x
  | ListView x -> yojson_of_graph_listView x

and yojson_of_embed_record_view (_object_ : embed_record_view) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.embed.record#view");
         Some ("record", yojson_of_embed_record_view_record _object_.record);
       ])

let embed_recordWithMedia_media_of_yojson json =
  let path_string = "app.bsky.embed.recordWithMedia#main/media" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "app.bsky.embed.images" -> Images (embed_images_of_yojson json)
       | "app.bsky.embed.external" -> External (embed_external_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : embed_recordWithMedia_media)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_embed_recordWithMedia_media (union : embed_recordWithMedia_media)
    =
  match union with
  | Images x -> yojson_of_embed_images x
  | External x -> yojson_of_embed_external x

let embed_recordWithMedia_of_yojson json =
  let path_string = "app.bsky.embed.recordWithMedia" in
  match json with
  | `Assoc kvs ->
      let record, kvs =
        find_required_field path_string "record" kvs embed_record_of_yojson
      in
      let media, kvs =
        find_required_field
          path_string
          "media"
          kvs
          embed_recordWithMedia_media_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({record; media} : embed_recordWithMedia)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_embed_recordWithMedia (_object_ : embed_recordWithMedia) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.embed.recordWithMedia");
         Some ("record", yojson_of_embed_record _object_.record);
         Some ("media", yojson_of_embed_recordWithMedia_media _object_.media);
       ])

let feed_blockedPost_of_yojson json =
  let path_string = "app.bsky.feed.defs#blockedPost" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let blocked, kvs =
        find_required_field path_string "blocked" kvs bool_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri; blocked} : feed_blockedPost)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_blockedPost (_object_ : feed_blockedPost) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.defs#blockedPost");
         Some ("uri", yojson_of_string _object_.uri);
         Some ("blocked", yojson_of_bool _object_.blocked);
       ])

let feed_viewerState_of_yojson json =
  let path_string = "app.bsky.feed.defs#viewerState" in
  match json with
  | `Assoc kvs ->
      let repost, kvs = find_optional_field "repost" kvs string_of_yojson in
      let like, kvs = find_optional_field "like" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({repost; like} : feed_viewerState)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_viewerState (_object_ : feed_viewerState) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.defs#viewerState");
         Option.map (fun v -> "repost", yojson_of_string v) _object_.repost;
         Option.map (fun v -> "like", yojson_of_string v) _object_.like;
       ])

let feed_postView_embed_of_yojson json =
  let path_string = "app.bsky.feed.defs#postView/embed" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "app.bsky.embed.images#view" ->
           Images (embed_images_view_of_yojson json)
       | "app.bsky.embed.external#view" ->
           External (embed_external_view_of_yojson json)
       | "app.bsky.embed.record#view" ->
           Record (embed_record_view_of_yojson json)
       | "app.bsky.embed.recordWithMedia#view" ->
           RecordWithMedia (embed_recordWithMedia_view_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : feed_postView_embed)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_postView_embed (union : feed_postView_embed) =
  match union with
  | Images x -> yojson_of_embed_images_view x
  | External x -> yojson_of_embed_external_view x
  | Record x -> yojson_of_embed_record_view x
  | RecordWithMedia x -> yojson_of_embed_recordWithMedia_view x

let feed_postView_of_yojson json =
  let path_string = "app.bsky.feed.defs#postView" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs =
        find_required_field path_string "cid" kvs string_of_yojson
      in
      let author, kvs =
        find_required_field
          path_string
          "author"
          kvs
          actor_profileViewBasic_of_yojson
      in
      let record, kvs = find_required_field path_string "record" kvs Fun.id in
      let embed, kvs =
        find_optional_field "embed" kvs feed_postView_embed_of_yojson
      in
      let replyCount, kvs =
        find_optional_field "replyCount" kvs int64_of_yojson
      in
      let repostCount, kvs =
        find_optional_field "repostCount" kvs int64_of_yojson
      in
      let likeCount, kvs =
        find_optional_field "likeCount" kvs int64_of_yojson
      in
      let indexedAt, kvs =
        find_required_field path_string "indexedAt" kvs string_of_yojson
      in
      let viewer, kvs =
        find_optional_field "viewer" kvs feed_viewerState_of_yojson
      in
      let labels, kvs =
        find_optional_field "labels" kvs (list_of_yojson label_label_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({
           uri;
           cid;
           author;
           record;
           embed;
           replyCount;
           repostCount;
           likeCount;
           indexedAt;
           viewer;
           labels;
         }
          : feed_postView)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_postView (_object_ : feed_postView) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.defs#postView");
         Some ("uri", yojson_of_string _object_.uri);
         Some ("cid", yojson_of_string _object_.cid);
         Some ("author", yojson_of_actor_profileViewBasic _object_.author);
         Some ("record", Fun.id _object_.record);
         Option.map
           (fun v -> "embed", yojson_of_feed_postView_embed v)
           _object_.embed;
         Option.map
           (fun v -> "replyCount", yojson_of_int64 v)
           _object_.replyCount;
         Option.map
           (fun v -> "repostCount", yojson_of_int64 v)
           _object_.repostCount;
         Option.map (fun v -> "likeCount", yojson_of_int64 v) _object_.likeCount;
         Some ("indexedAt", yojson_of_string _object_.indexedAt);
         Option.map
           (fun v -> "viewer", yojson_of_feed_viewerState v)
           _object_.viewer;
         Option.map
           (fun v -> "labels", (yojson_of_list yojson_of_label_label) v)
           _object_.labels;
       ])

let feed_notFoundPost_of_yojson json =
  let path_string = "app.bsky.feed.defs#notFoundPost" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let notFound, kvs =
        find_required_field path_string "notFound" kvs bool_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri; notFound} : feed_notFoundPost)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_notFoundPost (_object_ : feed_notFoundPost) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.defs#notFoundPost");
         Some ("uri", yojson_of_string _object_.uri);
         Some ("notFound", yojson_of_bool _object_.notFound);
       ])

let feed_replyRef_root_of_yojson json =
  let path_string = "app.bsky.feed.defs#replyRef/root" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "app.bsky.feed.defs#postView" ->
           PostView (feed_postView_of_yojson json)
       | "app.bsky.feed.defs#notFoundPost" ->
           NotFoundPost (feed_notFoundPost_of_yojson json)
       | "app.bsky.feed.defs#blockedPost" ->
           BlockedPost (feed_blockedPost_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : feed_replyRef_root)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_replyRef_root (union : feed_replyRef_root) =
  match union with
  | PostView x -> yojson_of_feed_postView x
  | NotFoundPost x -> yojson_of_feed_notFoundPost x
  | BlockedPost x -> yojson_of_feed_blockedPost x

let feed_replyRef_parent_of_yojson json =
  let path_string = "app.bsky.feed.defs#replyRef/parent" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "app.bsky.feed.defs#postView" ->
           PostView (feed_postView_of_yojson json)
       | "app.bsky.feed.defs#notFoundPost" ->
           NotFoundPost (feed_notFoundPost_of_yojson json)
       | "app.bsky.feed.defs#blockedPost" ->
           BlockedPost (feed_blockedPost_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : feed_replyRef_parent)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_replyRef_parent (union : feed_replyRef_parent) =
  match union with
  | PostView x -> yojson_of_feed_postView x
  | NotFoundPost x -> yojson_of_feed_notFoundPost x
  | BlockedPost x -> yojson_of_feed_blockedPost x

let feed_replyRef_of_yojson json =
  let path_string = "app.bsky.feed.defs#replyRef" in
  match json with
  | `Assoc kvs ->
      let root, kvs =
        find_required_field path_string "root" kvs feed_replyRef_root_of_yojson
      in
      let parent, kvs =
        find_required_field
          path_string
          "parent"
          kvs
          feed_replyRef_parent_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({root; parent} : feed_replyRef)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_replyRef (_object_ : feed_replyRef) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.defs#replyRef");
         Some ("root", yojson_of_feed_replyRef_root _object_.root);
         Some ("parent", yojson_of_feed_replyRef_parent _object_.parent);
       ])

let feed_reasonRepost_of_yojson json =
  let path_string = "app.bsky.feed.defs#reasonRepost" in
  match json with
  | `Assoc kvs ->
      let by, kvs =
        find_required_field
          path_string
          "by"
          kvs
          actor_profileViewBasic_of_yojson
      in
      let indexedAt, kvs =
        find_required_field path_string "indexedAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({by; indexedAt} : feed_reasonRepost)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_reasonRepost (_object_ : feed_reasonRepost) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.defs#reasonRepost");
         Some ("by", yojson_of_actor_profileViewBasic _object_.by);
         Some ("indexedAt", yojson_of_string _object_.indexedAt);
       ])

let feed_feedViewPost_reason_of_yojson json =
  let path_string = "app.bsky.feed.defs#feedViewPost/reason" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "app.bsky.feed.defs#reasonRepost" ->
           Feed (feed_reasonRepost_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : feed_feedViewPost_reason)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_feedViewPost_reason (union : feed_feedViewPost_reason) =
  match union with Feed x -> yojson_of_feed_reasonRepost x

let feed_feedViewPost_of_yojson json =
  let path_string = "app.bsky.feed.defs#feedViewPost" in
  match json with
  | `Assoc kvs ->
      let post, kvs =
        find_required_field path_string "post" kvs feed_postView_of_yojson
      in
      let reply, kvs =
        find_optional_field "reply" kvs feed_replyRef_of_yojson
      in
      let reason, kvs =
        find_optional_field "reason" kvs feed_feedViewPost_reason_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({post; reply; reason} : feed_feedViewPost)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_feedViewPost (_object_ : feed_feedViewPost) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.defs#feedViewPost");
         Some ("post", yojson_of_feed_postView _object_.post);
         Option.map (fun v -> "reply", yojson_of_feed_replyRef v) _object_.reply;
         Option.map
           (fun v -> "reason", yojson_of_feed_feedViewPost_reason v)
           _object_.reason;
       ])

let feed_skeletonReasonRepost_of_yojson json =
  let path_string = "app.bsky.feed.defs#skeletonReasonRepost" in
  match json with
  | `Assoc kvs ->
      let repost, kvs =
        find_required_field path_string "repost" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({repost} : feed_skeletonReasonRepost)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_skeletonReasonRepost (_object_ : feed_skeletonReasonRepost) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.defs#skeletonReasonRepost");
         Some ("repost", yojson_of_string _object_.repost);
       ])

let feed_skeletonFeedPost_reason_of_yojson json =
  let path_string = "app.bsky.feed.defs#skeletonFeedPost/reason" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "app.bsky.feed.defs#skeletonReasonRepost" ->
           Feed (feed_skeletonReasonRepost_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : feed_skeletonFeedPost_reason)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_skeletonFeedPost_reason
    (union : feed_skeletonFeedPost_reason) =
  match union with Feed x -> yojson_of_feed_skeletonReasonRepost x

let feed_skeletonFeedPost_of_yojson json =
  let path_string = "app.bsky.feed.defs#skeletonFeedPost" in
  match json with
  | `Assoc kvs ->
      let post, kvs =
        find_required_field path_string "post" kvs string_of_yojson
      in
      let reason, kvs =
        find_optional_field "reason" kvs feed_skeletonFeedPost_reason_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({post; reason} : feed_skeletonFeedPost)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_skeletonFeedPost (_object_ : feed_skeletonFeedPost) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.defs#skeletonFeedPost");
         Some ("post", yojson_of_string _object_.post);
         Option.map
           (fun v -> "reason", yojson_of_feed_skeletonFeedPost_reason v)
           _object_.reason;
       ])

let rec feed_threadViewPost_replies_item_of_yojson json =
  let path_string = "app.bsky.feed.defs#threadViewPost/replies/item" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "app.bsky.feed.defs#threadViewPost" ->
           ThreadViewPost (feed_threadViewPost_of_yojson json)
       | "app.bsky.feed.defs#notFoundPost" ->
           NotFoundPost (feed_notFoundPost_of_yojson json)
       | "app.bsky.feed.defs#blockedPost" ->
           BlockedPost (feed_blockedPost_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : feed_threadViewPost_replies_item)
  | json -> fail_yojson path_string "Assoc expected" json

and feed_threadViewPost_parent_of_yojson json =
  let path_string = "app.bsky.feed.defs#threadViewPost/parent" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "app.bsky.feed.defs#threadViewPost" ->
           ThreadViewPost (feed_threadViewPost_of_yojson json)
       | "app.bsky.feed.defs#notFoundPost" ->
           NotFoundPost (feed_notFoundPost_of_yojson json)
       | "app.bsky.feed.defs#blockedPost" ->
           BlockedPost (feed_blockedPost_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : feed_threadViewPost_parent)
  | json -> fail_yojson path_string "Assoc expected" json

and feed_threadViewPost_of_yojson json =
  let path_string = "app.bsky.feed.defs#threadViewPost" in
  match json with
  | `Assoc kvs ->
      let post, kvs =
        find_required_field path_string "post" kvs feed_postView_of_yojson
      in
      let parent, kvs =
        find_optional_field "parent" kvs feed_threadViewPost_parent_of_yojson
      in
      let replies, kvs =
        find_optional_field
          "replies"
          kvs
          (list_of_yojson feed_threadViewPost_replies_item_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({post; parent; replies} : feed_threadViewPost)
  | _ -> fail_yojson path_string "Assoc expected" json

let rec yojson_of_feed_threadViewPost_replies_item
    (union : feed_threadViewPost_replies_item) =
  match union with
  | ThreadViewPost x -> yojson_of_feed_threadViewPost x
  | NotFoundPost x -> yojson_of_feed_notFoundPost x
  | BlockedPost x -> yojson_of_feed_blockedPost x

and yojson_of_feed_threadViewPost_parent (union : feed_threadViewPost_parent) =
  match union with
  | ThreadViewPost x -> yojson_of_feed_threadViewPost x
  | NotFoundPost x -> yojson_of_feed_notFoundPost x
  | BlockedPost x -> yojson_of_feed_blockedPost x

and yojson_of_feed_threadViewPost (_object_ : feed_threadViewPost) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.defs#threadViewPost");
         Some ("post", yojson_of_feed_postView _object_.post);
         Option.map
           (fun v -> "parent", yojson_of_feed_threadViewPost_parent v)
           _object_.parent;
         Option.map
           (fun v ->
             ( "replies",
               (yojson_of_list yojson_of_feed_threadViewPost_replies_item) v ))
           _object_.replies;
       ])

let feed_describeFeedGenerator_feed_of_yojson json =
  let path_string = "app.bsky.feed.describeFeedGenerator#feed" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri} : feed_describeFeedGenerator_feed)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_describeFeedGenerator_feed
    (_object_ : feed_describeFeedGenerator_feed) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.describeFeedGenerator#feed");
         Some ("uri", yojson_of_string _object_.uri);
       ])

let feed_describeFeedGenerator_links_of_yojson json =
  let path_string = "app.bsky.feed.describeFeedGenerator#links" in
  match json with
  | `Assoc kvs ->
      let privacyPolicy, kvs =
        find_optional_field "privacyPolicy" kvs string_of_yojson
      in
      let termsOfService, kvs =
        find_optional_field "termsOfService" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({privacyPolicy; termsOfService} : feed_describeFeedGenerator_links)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_describeFeedGenerator_links
    (_object_ : feed_describeFeedGenerator_links) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.describeFeedGenerator#links");
         Option.map
           (fun v -> "privacyPolicy", yojson_of_string v)
           _object_.privacyPolicy;
         Option.map
           (fun v -> "termsOfService", yojson_of_string v)
           _object_.termsOfService;
       ])

let feed_describeFeedGenerator_output_of_yojson json =
  let path_string = "app.bsky.feed.describeFeedGenerator#main/output" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let feeds, kvs =
        find_required_field
          path_string
          "feeds"
          kvs
          (list_of_yojson feed_describeFeedGenerator_feed_of_yojson)
      in
      let links, kvs =
        find_optional_field
          "links"
          kvs
          feed_describeFeedGenerator_links_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did; feeds; links} : feed_describeFeedGenerator_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_describeFeedGenerator_output
    (_object_ : feed_describeFeedGenerator_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "app.bsky.feed.describeFeedGenerator#main/output");
         Some ("did", yojson_of_string _object_.did);
         Some
           ( "feeds",
             (yojson_of_list yojson_of_feed_describeFeedGenerator_feed)
               _object_.feeds );
         Option.map
           (fun v -> "links", yojson_of_feed_describeFeedGenerator_links v)
           _object_.links;
       ])

let feed_generator_of_yojson json =
  let path_string = "app.bsky.feed.generator" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let displayName, kvs =
        find_required_field path_string "displayName" kvs string_of_yojson
      in
      let description, kvs =
        find_optional_field "description" kvs string_of_yojson
      in
      let descriptionFacets, kvs =
        find_optional_field
          "descriptionFacets"
          kvs
          (list_of_yojson richtext_facet_of_yojson)
      in
      let avatar, kvs = find_optional_field "avatar" kvs bytes_of_yojson in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({did; displayName; description; descriptionFacets; avatar; createdAt}
          : feed_generator)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_generator (_object_ : feed_generator) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.generator");
         Some ("did", yojson_of_string _object_.did);
         Some ("displayName", yojson_of_string _object_.displayName);
         Option.map
           (fun v -> "description", yojson_of_string v)
           _object_.description;
         Option.map
           (fun v ->
             "descriptionFacets", (yojson_of_list yojson_of_richtext_facet) v)
           _object_.descriptionFacets;
         Option.map (fun v -> "avatar", yojson_of_bytes v) _object_.avatar;
         Some ("createdAt", yojson_of_string _object_.createdAt);
       ])

let feed_getActorFeeds_output_of_yojson json =
  let path_string = "app.bsky.feed.getActorFeeds#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let feeds, kvs =
        find_required_field
          path_string
          "feeds"
          kvs
          (list_of_yojson feed_generatorView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; feeds} : feed_getActorFeeds_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getActorFeeds_output (_object_ : feed_getActorFeeds_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getActorFeeds#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ( "feeds",
             (yojson_of_list yojson_of_feed_generatorView) _object_.feeds );
       ])

let feed_getActorFeeds_parameters_of_yojson json =
  let path_string = "app.bsky.feed.getActorFeeds#main/parameters" in
  match json with
  | `Assoc kvs ->
      let actor, kvs =
        find_required_field path_string "actor" kvs string_of_yojson
      in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({actor; limit; cursor} : feed_getActorFeeds_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getActorFeeds_parameters
    (_object_ : feed_getActorFeeds_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getActorFeeds#main/parameters");
         Some ("actor", yojson_of_string _object_.actor);
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let feed_getAuthorFeed_output_of_yojson json =
  let path_string = "app.bsky.feed.getAuthorFeed#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let feed, kvs =
        find_required_field
          path_string
          "feed"
          kvs
          (list_of_yojson feed_feedViewPost_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; feed} : feed_getAuthorFeed_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getAuthorFeed_output (_object_ : feed_getAuthorFeed_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getAuthorFeed#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ("feed", (yojson_of_list yojson_of_feed_feedViewPost) _object_.feed);
       ])

let feed_getAuthorFeed_parameters_of_yojson json =
  let path_string = "app.bsky.feed.getAuthorFeed#main/parameters" in
  match json with
  | `Assoc kvs ->
      let actor, kvs =
        find_required_field path_string "actor" kvs string_of_yojson
      in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({actor; limit; cursor} : feed_getAuthorFeed_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getAuthorFeed_parameters
    (_object_ : feed_getAuthorFeed_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getAuthorFeed#main/parameters");
         Some ("actor", yojson_of_string _object_.actor);
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let feed_getFeed_output_of_yojson json =
  let path_string = "app.bsky.feed.getFeed#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let feed, kvs =
        find_required_field
          path_string
          "feed"
          kvs
          (list_of_yojson feed_feedViewPost_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; feed} : feed_getFeed_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getFeed_output (_object_ : feed_getFeed_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getFeed#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ("feed", (yojson_of_list yojson_of_feed_feedViewPost) _object_.feed);
       ])

let feed_getFeed_parameters_of_yojson json =
  let path_string = "app.bsky.feed.getFeed#main/parameters" in
  match json with
  | `Assoc kvs ->
      let feed, kvs =
        find_required_field path_string "feed" kvs string_of_yojson
      in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({feed; limit; cursor} : feed_getFeed_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getFeed_parameters (_object_ : feed_getFeed_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getFeed#main/parameters");
         Some ("feed", yojson_of_string _object_.feed);
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let feed_getFeedGenerator_output_of_yojson json =
  let path_string = "app.bsky.feed.getFeedGenerator#main/output" in
  match json with
  | `Assoc kvs ->
      let view, kvs =
        find_required_field path_string "view" kvs feed_generatorView_of_yojson
      in
      let isOnline, kvs =
        find_required_field path_string "isOnline" kvs bool_of_yojson
      in
      let isValid, kvs =
        find_required_field path_string "isValid" kvs bool_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({view; isOnline; isValid} : feed_getFeedGenerator_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getFeedGenerator_output
    (_object_ : feed_getFeedGenerator_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getFeedGenerator#main/output");
         Some ("view", yojson_of_feed_generatorView _object_.view);
         Some ("isOnline", yojson_of_bool _object_.isOnline);
         Some ("isValid", yojson_of_bool _object_.isValid);
       ])

let feed_getFeedGenerator_parameters_of_yojson json =
  let path_string = "app.bsky.feed.getFeedGenerator#main/parameters" in
  match json with
  | `Assoc kvs ->
      let feed, kvs =
        find_required_field path_string "feed" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({feed} : feed_getFeedGenerator_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getFeedGenerator_parameters
    (_object_ : feed_getFeedGenerator_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getFeedGenerator#main/parameters");
         Some ("feed", yojson_of_string _object_.feed);
       ])

let feed_getFeedGenerators_output_of_yojson json =
  let path_string = "app.bsky.feed.getFeedGenerators#main/output" in
  match json with
  | `Assoc kvs ->
      let feeds, kvs =
        find_required_field
          path_string
          "feeds"
          kvs
          (list_of_yojson feed_generatorView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({feeds} : feed_getFeedGenerators_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getFeedGenerators_output
    (_object_ : feed_getFeedGenerators_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getFeedGenerators#main/output");
         Some
           ( "feeds",
             (yojson_of_list yojson_of_feed_generatorView) _object_.feeds );
       ])

let feed_getFeedGenerators_parameters_of_yojson json =
  let path_string = "app.bsky.feed.getFeedGenerators#main/parameters" in
  match json with
  | `Assoc kvs ->
      let feeds, kvs =
        find_required_field
          path_string
          "feeds"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({feeds} : feed_getFeedGenerators_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getFeedGenerators_parameters
    (_object_ : feed_getFeedGenerators_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "app.bsky.feed.getFeedGenerators#main/parameters");
         Some ("feeds", (yojson_of_list yojson_of_string) _object_.feeds);
       ])

let feed_getFeedSkeleton_output_of_yojson json =
  let path_string = "app.bsky.feed.getFeedSkeleton#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let feed, kvs =
        find_required_field
          path_string
          "feed"
          kvs
          (list_of_yojson feed_skeletonFeedPost_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; feed} : feed_getFeedSkeleton_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getFeedSkeleton_output
    (_object_ : feed_getFeedSkeleton_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getFeedSkeleton#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ( "feed",
             (yojson_of_list yojson_of_feed_skeletonFeedPost) _object_.feed );
       ])

let feed_getFeedSkeleton_parameters_of_yojson json =
  let path_string = "app.bsky.feed.getFeedSkeleton#main/parameters" in
  match json with
  | `Assoc kvs ->
      let feed, kvs =
        find_required_field path_string "feed" kvs string_of_yojson
      in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({feed; limit; cursor} : feed_getFeedSkeleton_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getFeedSkeleton_parameters
    (_object_ : feed_getFeedSkeleton_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getFeedSkeleton#main/parameters");
         Some ("feed", yojson_of_string _object_.feed);
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let feed_getLikes_like_of_yojson json =
  let path_string = "app.bsky.feed.getLikes#like" in
  match json with
  | `Assoc kvs ->
      let indexedAt, kvs =
        find_required_field path_string "indexedAt" kvs string_of_yojson
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let actor, kvs =
        find_required_field path_string "actor" kvs actor_profileView_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({indexedAt; createdAt; actor} : feed_getLikes_like)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getLikes_like (_object_ : feed_getLikes_like) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getLikes#like");
         Some ("indexedAt", yojson_of_string _object_.indexedAt);
         Some ("createdAt", yojson_of_string _object_.createdAt);
         Some ("actor", yojson_of_actor_profileView _object_.actor);
       ])

let feed_getLikes_output_of_yojson json =
  let path_string = "app.bsky.feed.getLikes#main/output" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs = find_optional_field "cid" kvs string_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let likes, kvs =
        find_required_field
          path_string
          "likes"
          kvs
          (list_of_yojson feed_getLikes_like_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri; cid; cursor; likes} : feed_getLikes_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getLikes_output (_object_ : feed_getLikes_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getLikes#main/output");
         Some ("uri", yojson_of_string _object_.uri);
         Option.map (fun v -> "cid", yojson_of_string v) _object_.cid;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ( "likes",
             (yojson_of_list yojson_of_feed_getLikes_like) _object_.likes );
       ])

let feed_getLikes_parameters_of_yojson json =
  let path_string = "app.bsky.feed.getLikes#main/parameters" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs = find_optional_field "cid" kvs string_of_yojson in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri; cid; limit; cursor} : feed_getLikes_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getLikes_parameters (_object_ : feed_getLikes_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getLikes#main/parameters");
         Some ("uri", yojson_of_string _object_.uri);
         Option.map (fun v -> "cid", yojson_of_string v) _object_.cid;
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let feed_getPostThread_output_thread_of_yojson json =
  let path_string = "app.bsky.feed.getPostThread#main/output/thread" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "app.bsky.feed.defs#threadViewPost" ->
           ThreadViewPost (feed_threadViewPost_of_yojson json)
       | "app.bsky.feed.defs#notFoundPost" ->
           NotFoundPost (feed_notFoundPost_of_yojson json)
       | "app.bsky.feed.defs#blockedPost" ->
           BlockedPost (feed_blockedPost_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : feed_getPostThread_output_thread)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getPostThread_output_thread
    (union : feed_getPostThread_output_thread) =
  match union with
  | ThreadViewPost x -> yojson_of_feed_threadViewPost x
  | NotFoundPost x -> yojson_of_feed_notFoundPost x
  | BlockedPost x -> yojson_of_feed_blockedPost x

let feed_getPostThread_output_of_yojson json =
  let path_string = "app.bsky.feed.getPostThread#main/output" in
  match json with
  | `Assoc kvs ->
      let thread, kvs =
        find_required_field
          path_string
          "thread"
          kvs
          feed_getPostThread_output_thread_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({thread} : feed_getPostThread_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getPostThread_output (_object_ : feed_getPostThread_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getPostThread#main/output");
         Some
           ("thread", yojson_of_feed_getPostThread_output_thread _object_.thread);
       ])

let feed_getPostThread_parameters_of_yojson json =
  let path_string = "app.bsky.feed.getPostThread#main/parameters" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let depth, kvs = find_optional_field "depth" kvs int64_of_yojson in
      let parentHeight, kvs =
        find_optional_field "parentHeight" kvs int64_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri; depth; parentHeight} : feed_getPostThread_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getPostThread_parameters
    (_object_ : feed_getPostThread_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getPostThread#main/parameters");
         Some ("uri", yojson_of_string _object_.uri);
         Option.map (fun v -> "depth", yojson_of_int64 v) _object_.depth;
         Option.map
           (fun v -> "parentHeight", yojson_of_int64 v)
           _object_.parentHeight;
       ])

let feed_getPosts_output_of_yojson json =
  let path_string = "app.bsky.feed.getPosts#main/output" in
  match json with
  | `Assoc kvs ->
      let posts, kvs =
        find_required_field
          path_string
          "posts"
          kvs
          (list_of_yojson feed_postView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({posts} : feed_getPosts_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getPosts_output (_object_ : feed_getPosts_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getPosts#main/output");
         Some ("posts", (yojson_of_list yojson_of_feed_postView) _object_.posts);
       ])

let feed_getPosts_parameters_of_yojson json =
  let path_string = "app.bsky.feed.getPosts#main/parameters" in
  match json with
  | `Assoc kvs ->
      let uris, kvs =
        find_required_field
          path_string
          "uris"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uris} : feed_getPosts_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getPosts_parameters (_object_ : feed_getPosts_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getPosts#main/parameters");
         Some ("uris", (yojson_of_list yojson_of_string) _object_.uris);
       ])

let feed_getRepostedBy_output_of_yojson json =
  let path_string = "app.bsky.feed.getRepostedBy#main/output" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs = find_optional_field "cid" kvs string_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let repostedBy, kvs =
        find_required_field
          path_string
          "repostedBy"
          kvs
          (list_of_yojson actor_profileView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri; cid; cursor; repostedBy} : feed_getRepostedBy_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getRepostedBy_output (_object_ : feed_getRepostedBy_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getRepostedBy#main/output");
         Some ("uri", yojson_of_string _object_.uri);
         Option.map (fun v -> "cid", yojson_of_string v) _object_.cid;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ( "repostedBy",
             (yojson_of_list yojson_of_actor_profileView) _object_.repostedBy );
       ])

let feed_getRepostedBy_parameters_of_yojson json =
  let path_string = "app.bsky.feed.getRepostedBy#main/parameters" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs = find_optional_field "cid" kvs string_of_yojson in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri; cid; limit; cursor} : feed_getRepostedBy_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getRepostedBy_parameters
    (_object_ : feed_getRepostedBy_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getRepostedBy#main/parameters");
         Some ("uri", yojson_of_string _object_.uri);
         Option.map (fun v -> "cid", yojson_of_string v) _object_.cid;
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let feed_getTimeline_output_of_yojson json =
  let path_string = "app.bsky.feed.getTimeline#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let feed, kvs =
        find_required_field
          path_string
          "feed"
          kvs
          (list_of_yojson feed_feedViewPost_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; feed} : feed_getTimeline_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getTimeline_output (_object_ : feed_getTimeline_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getTimeline#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ("feed", (yojson_of_list yojson_of_feed_feedViewPost) _object_.feed);
       ])

let feed_getTimeline_parameters_of_yojson json =
  let path_string = "app.bsky.feed.getTimeline#main/parameters" in
  match json with
  | `Assoc kvs ->
      let algorithm, kvs =
        find_optional_field "algorithm" kvs string_of_yojson
      in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({algorithm; limit; cursor} : feed_getTimeline_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_getTimeline_parameters
    (_object_ : feed_getTimeline_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.getTimeline#main/parameters");
         Option.map
           (fun v -> "algorithm", yojson_of_string v)
           _object_.algorithm;
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let feed_like_of_yojson json =
  let path_string = "app.bsky.feed.like" in
  match json with
  | `Assoc kvs ->
      let subject, kvs =
        find_required_field path_string "subject" kvs repo_strongRef_of_yojson
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({subject; createdAt} : feed_like)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_like (_object_ : feed_like) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.like");
         Some ("subject", yojson_of_repo_strongRef _object_.subject);
         Some ("createdAt", yojson_of_string _object_.createdAt);
       ])

let feed_post_textSlice_of_yojson json =
  let path_string = "app.bsky.feed.post#textSlice" in
  match json with
  | `Assoc kvs ->
      let start, kvs =
        find_required_field path_string "start" kvs int64_of_yojson
      in
      let end_, kvs =
        find_required_field path_string "end" kvs int64_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({start; end_} : feed_post_textSlice)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_post_textSlice (_object_ : feed_post_textSlice) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.post#textSlice");
         Some ("start", yojson_of_int64 _object_.start);
         Some ("end", yojson_of_int64 _object_.end_);
       ])

let feed_post_entity_of_yojson json =
  let path_string = "app.bsky.feed.post#entity" in
  match json with
  | `Assoc kvs ->
      let index, kvs =
        find_required_field
          path_string
          "index"
          kvs
          feed_post_textSlice_of_yojson
      in
      let type_, kvs =
        find_required_field path_string "type" kvs string_of_yojson
      in
      let value, kvs =
        find_required_field path_string "value" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({index; type_; value} : feed_post_entity)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_post_entity (_object_ : feed_post_entity) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.post#entity");
         Some ("index", yojson_of_feed_post_textSlice _object_.index);
         Some ("type", yojson_of_string _object_.type_);
         Some ("value", yojson_of_string _object_.value);
       ])

let language_of_yojson = string_of_yojson

let yojson_of_language = yojson_of_string

let feed_post_replyRef_of_yojson json =
  let path_string = "app.bsky.feed.post#replyRef" in
  match json with
  | `Assoc kvs ->
      let root, kvs =
        find_required_field path_string "root" kvs repo_strongRef_of_yojson
      in
      let parent, kvs =
        find_required_field path_string "parent" kvs repo_strongRef_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({root; parent} : feed_post_replyRef)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_post_replyRef (_object_ : feed_post_replyRef) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.post#replyRef");
         Some ("root", yojson_of_repo_strongRef _object_.root);
         Some ("parent", yojson_of_repo_strongRef _object_.parent);
       ])

let feed_post_embed_of_yojson json =
  let path_string = "app.bsky.feed.post#main/embed" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "app.bsky.embed.images" -> Images (embed_images_of_yojson json)
       | "app.bsky.embed.external" -> External (embed_external_of_yojson json)
       | "app.bsky.embed.record" -> Record (embed_record_of_yojson json)
       | "app.bsky.embed.recordWithMedia" ->
           RecordWithMedia (embed_recordWithMedia_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : feed_post_embed)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_post_embed (union : feed_post_embed) =
  match union with
  | Images x -> yojson_of_embed_images x
  | External x -> yojson_of_embed_external x
  | Record x -> yojson_of_embed_record x
  | RecordWithMedia x -> yojson_of_embed_recordWithMedia x

let feed_post_of_yojson json =
  let path_string = "app.bsky.feed.post" in
  match json with
  | `Assoc kvs ->
      let text, kvs =
        find_required_field path_string "text" kvs string_of_yojson
      in
      let entities, kvs =
        find_optional_field
          "entities"
          kvs
          (list_of_yojson feed_post_entity_of_yojson)
      in
      let facets, kvs =
        find_optional_field
          "facets"
          kvs
          (list_of_yojson richtext_facet_of_yojson)
      in
      let reply, kvs =
        find_optional_field "reply" kvs feed_post_replyRef_of_yojson
      in
      let embed, kvs =
        find_optional_field "embed" kvs feed_post_embed_of_yojson
      in
      let langs, kvs =
        find_optional_field "langs" kvs (list_of_yojson string_of_yojson)
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({text; entities; facets; reply; embed; langs; createdAt} : feed_post)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_post (_object_ : feed_post) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.post");
         Some ("text", yojson_of_string _object_.text);
         Option.map
           (fun v -> "entities", (yojson_of_list yojson_of_feed_post_entity) v)
           _object_.entities;
         Option.map
           (fun v -> "facets", (yojson_of_list yojson_of_richtext_facet) v)
           _object_.facets;
         Option.map
           (fun v -> "reply", yojson_of_feed_post_replyRef v)
           _object_.reply;
         Option.map
           (fun v -> "embed", yojson_of_feed_post_embed v)
           _object_.embed;
         Option.map
           (fun v -> "langs", (yojson_of_list yojson_of_string) v)
           _object_.langs;
         Some ("createdAt", yojson_of_string _object_.createdAt);
       ])

let feed_repost_of_yojson json =
  let path_string = "app.bsky.feed.repost" in
  match json with
  | `Assoc kvs ->
      let subject, kvs =
        find_required_field path_string "subject" kvs repo_strongRef_of_yojson
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({subject; createdAt} : feed_repost)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_feed_repost (_object_ : feed_repost) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.feed.repost");
         Some ("subject", yojson_of_repo_strongRef _object_.subject);
         Some ("createdAt", yojson_of_string _object_.createdAt);
       ])

let graph_block_of_yojson json =
  let path_string = "app.bsky.graph.block" in
  match json with
  | `Assoc kvs ->
      let subject, kvs =
        find_required_field path_string "subject" kvs string_of_yojson
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({subject; createdAt} : graph_block)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_block (_object_ : graph_block) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.block");
         Some ("subject", yojson_of_string _object_.subject);
         Some ("createdAt", yojson_of_string _object_.createdAt);
       ])

let graph_listItemView_of_yojson json =
  let path_string = "app.bsky.graph.defs#listItemView" in
  match json with
  | `Assoc kvs ->
      let subject, kvs =
        find_required_field
          path_string
          "subject"
          kvs
          actor_profileView_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({subject} : graph_listItemView)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_listItemView (_object_ : graph_listItemView) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.defs#listItemView");
         Some ("subject", yojson_of_actor_profileView _object_.subject);
       ])

let graph_modlist_of_yojson = string_of_yojson

let yojson_of_graph_modlist = yojson_of_string

let graph_follow_of_yojson json =
  let path_string = "app.bsky.graph.follow" in
  match json with
  | `Assoc kvs ->
      let subject, kvs =
        find_required_field path_string "subject" kvs string_of_yojson
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({subject; createdAt} : graph_follow)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_follow (_object_ : graph_follow) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.follow");
         Some ("subject", yojson_of_string _object_.subject);
         Some ("createdAt", yojson_of_string _object_.createdAt);
       ])

let graph_getBlocks_output_of_yojson json =
  let path_string = "app.bsky.graph.getBlocks#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let blocks, kvs =
        find_required_field
          path_string
          "blocks"
          kvs
          (list_of_yojson actor_profileView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; blocks} : graph_getBlocks_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_getBlocks_output (_object_ : graph_getBlocks_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.getBlocks#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ( "blocks",
             (yojson_of_list yojson_of_actor_profileView) _object_.blocks );
       ])

let graph_getBlocks_parameters_of_yojson json =
  let path_string = "app.bsky.graph.getBlocks#main/parameters" in
  match json with
  | `Assoc kvs ->
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({limit; cursor} : graph_getBlocks_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_getBlocks_parameters (_object_ : graph_getBlocks_parameters)
    =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.getBlocks#main/parameters");
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let graph_getFollowers_output_of_yojson json =
  let path_string = "app.bsky.graph.getFollowers#main/output" in
  match json with
  | `Assoc kvs ->
      let subject, kvs =
        find_required_field
          path_string
          "subject"
          kvs
          actor_profileView_of_yojson
      in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let followers, kvs =
        find_required_field
          path_string
          "followers"
          kvs
          (list_of_yojson actor_profileView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({subject; cursor; followers} : graph_getFollowers_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_getFollowers_output (_object_ : graph_getFollowers_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.getFollowers#main/output");
         Some ("subject", yojson_of_actor_profileView _object_.subject);
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ( "followers",
             (yojson_of_list yojson_of_actor_profileView) _object_.followers );
       ])

let graph_getFollowers_parameters_of_yojson json =
  let path_string = "app.bsky.graph.getFollowers#main/parameters" in
  match json with
  | `Assoc kvs ->
      let actor, kvs =
        find_required_field path_string "actor" kvs string_of_yojson
      in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({actor; limit; cursor} : graph_getFollowers_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_getFollowers_parameters
    (_object_ : graph_getFollowers_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.getFollowers#main/parameters");
         Some ("actor", yojson_of_string _object_.actor);
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let graph_getFollows_output_of_yojson json =
  let path_string = "app.bsky.graph.getFollows#main/output" in
  match json with
  | `Assoc kvs ->
      let subject, kvs =
        find_required_field
          path_string
          "subject"
          kvs
          actor_profileView_of_yojson
      in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let follows, kvs =
        find_required_field
          path_string
          "follows"
          kvs
          (list_of_yojson actor_profileView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({subject; cursor; follows} : graph_getFollows_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_getFollows_output (_object_ : graph_getFollows_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.getFollows#main/output");
         Some ("subject", yojson_of_actor_profileView _object_.subject);
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ( "follows",
             (yojson_of_list yojson_of_actor_profileView) _object_.follows );
       ])

let graph_getFollows_parameters_of_yojson json =
  let path_string = "app.bsky.graph.getFollows#main/parameters" in
  match json with
  | `Assoc kvs ->
      let actor, kvs =
        find_required_field path_string "actor" kvs string_of_yojson
      in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({actor; limit; cursor} : graph_getFollows_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_getFollows_parameters
    (_object_ : graph_getFollows_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.getFollows#main/parameters");
         Some ("actor", yojson_of_string _object_.actor);
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let graph_getList_output_of_yojson json =
  let path_string = "app.bsky.graph.getList#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let list, kvs =
        find_required_field path_string "list" kvs graph_listView_of_yojson
      in
      let items, kvs =
        find_required_field
          path_string
          "items"
          kvs
          (list_of_yojson graph_listItemView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; list; items} : graph_getList_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_getList_output (_object_ : graph_getList_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.getList#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some ("list", yojson_of_graph_listView _object_.list);
         Some
           ( "items",
             (yojson_of_list yojson_of_graph_listItemView) _object_.items );
       ])

let graph_getList_parameters_of_yojson json =
  let path_string = "app.bsky.graph.getList#main/parameters" in
  match json with
  | `Assoc kvs ->
      let list, kvs =
        find_required_field path_string "list" kvs string_of_yojson
      in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({list; limit; cursor} : graph_getList_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_getList_parameters (_object_ : graph_getList_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.getList#main/parameters");
         Some ("list", yojson_of_string _object_.list);
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let graph_getListMutes_output_of_yojson json =
  let path_string = "app.bsky.graph.getListMutes#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let lists, kvs =
        find_required_field
          path_string
          "lists"
          kvs
          (list_of_yojson graph_listView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; lists} : graph_getListMutes_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_getListMutes_output (_object_ : graph_getListMutes_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.getListMutes#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some ("lists", (yojson_of_list yojson_of_graph_listView) _object_.lists);
       ])

let graph_getListMutes_parameters_of_yojson json =
  let path_string = "app.bsky.graph.getListMutes#main/parameters" in
  match json with
  | `Assoc kvs ->
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({limit; cursor} : graph_getListMutes_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_getListMutes_parameters
    (_object_ : graph_getListMutes_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.getListMutes#main/parameters");
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let graph_getLists_output_of_yojson json =
  let path_string = "app.bsky.graph.getLists#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let lists, kvs =
        find_required_field
          path_string
          "lists"
          kvs
          (list_of_yojson graph_listView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; lists} : graph_getLists_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_getLists_output (_object_ : graph_getLists_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.getLists#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some ("lists", (yojson_of_list yojson_of_graph_listView) _object_.lists);
       ])

let graph_getLists_parameters_of_yojson json =
  let path_string = "app.bsky.graph.getLists#main/parameters" in
  match json with
  | `Assoc kvs ->
      let actor, kvs =
        find_required_field path_string "actor" kvs string_of_yojson
      in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({actor; limit; cursor} : graph_getLists_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_getLists_parameters (_object_ : graph_getLists_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.getLists#main/parameters");
         Some ("actor", yojson_of_string _object_.actor);
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let graph_getMutes_output_of_yojson json =
  let path_string = "app.bsky.graph.getMutes#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let mutes, kvs =
        find_required_field
          path_string
          "mutes"
          kvs
          (list_of_yojson actor_profileView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; mutes} : graph_getMutes_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_getMutes_output (_object_ : graph_getMutes_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.getMutes#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ("mutes", (yojson_of_list yojson_of_actor_profileView) _object_.mutes);
       ])

let graph_getMutes_parameters_of_yojson json =
  let path_string = "app.bsky.graph.getMutes#main/parameters" in
  match json with
  | `Assoc kvs ->
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({limit; cursor} : graph_getMutes_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_getMutes_parameters (_object_ : graph_getMutes_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.getMutes#main/parameters");
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let graph_list_of_yojson json =
  let path_string = "app.bsky.graph.list" in
  match json with
  | `Assoc kvs ->
      let purpose, kvs =
        find_required_field
          path_string
          "purpose"
          kvs
          graph_listPurpose_of_yojson
      in
      let name, kvs =
        find_required_field path_string "name" kvs string_of_yojson
      in
      let description, kvs =
        find_optional_field "description" kvs string_of_yojson
      in
      let descriptionFacets, kvs =
        find_optional_field
          "descriptionFacets"
          kvs
          (list_of_yojson richtext_facet_of_yojson)
      in
      let avatar, kvs = find_optional_field "avatar" kvs bytes_of_yojson in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({purpose; name; description; descriptionFacets; avatar; createdAt}
          : graph_list)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_list (_object_ : graph_list) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.list");
         Some ("purpose", yojson_of_graph_listPurpose _object_.purpose);
         Some ("name", yojson_of_string _object_.name);
         Option.map
           (fun v -> "description", yojson_of_string v)
           _object_.description;
         Option.map
           (fun v ->
             "descriptionFacets", (yojson_of_list yojson_of_richtext_facet) v)
           _object_.descriptionFacets;
         Option.map (fun v -> "avatar", yojson_of_bytes v) _object_.avatar;
         Some ("createdAt", yojson_of_string _object_.createdAt);
       ])

let graph_listitem_of_yojson json =
  let path_string = "app.bsky.graph.listitem" in
  match json with
  | `Assoc kvs ->
      let subject, kvs =
        find_required_field path_string "subject" kvs string_of_yojson
      in
      let list, kvs =
        find_required_field path_string "list" kvs string_of_yojson
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({subject; list; createdAt} : graph_listitem)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_listitem (_object_ : graph_listitem) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.listitem");
         Some ("subject", yojson_of_string _object_.subject);
         Some ("list", yojson_of_string _object_.list);
         Some ("createdAt", yojson_of_string _object_.createdAt);
       ])

let graph_muteActor_input_of_yojson json =
  let path_string = "app.bsky.graph.muteActor#main/input" in
  match json with
  | `Assoc kvs ->
      let actor, kvs =
        find_required_field path_string "actor" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({actor} : graph_muteActor_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_muteActor_input (_object_ : graph_muteActor_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.muteActor#main/input");
         Some ("actor", yojson_of_string _object_.actor);
       ])

let graph_muteActorList_input_of_yojson json =
  let path_string = "app.bsky.graph.muteActorList#main/input" in
  match json with
  | `Assoc kvs ->
      let list, kvs =
        find_required_field path_string "list" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({list} : graph_muteActorList_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_muteActorList_input (_object_ : graph_muteActorList_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.muteActorList#main/input");
         Some ("list", yojson_of_string _object_.list);
       ])

let graph_unmuteActor_input_of_yojson json =
  let path_string = "app.bsky.graph.unmuteActor#main/input" in
  match json with
  | `Assoc kvs ->
      let actor, kvs =
        find_required_field path_string "actor" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({actor} : graph_unmuteActor_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_unmuteActor_input (_object_ : graph_unmuteActor_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.unmuteActor#main/input");
         Some ("actor", yojson_of_string _object_.actor);
       ])

let graph_unmuteActorList_input_of_yojson json =
  let path_string = "app.bsky.graph.unmuteActorList#main/input" in
  match json with
  | `Assoc kvs ->
      let list, kvs =
        find_required_field path_string "list" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({list} : graph_unmuteActorList_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_graph_unmuteActorList_input
    (_object_ : graph_unmuteActorList_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.graph.unmuteActorList#main/input");
         Some ("list", yojson_of_string _object_.list);
       ])

let notification_getUnreadCount_output_of_yojson json =
  let path_string = "app.bsky.notification.getUnreadCount#main/output" in
  match json with
  | `Assoc kvs ->
      let count, kvs =
        find_required_field path_string "count" kvs int64_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({count} : notification_getUnreadCount_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_notification_getUnreadCount_output
    (_object_ : notification_getUnreadCount_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "app.bsky.notification.getUnreadCount#main/output");
         Some ("count", yojson_of_int64 _object_.count);
       ])

let notification_getUnreadCount_parameters_of_yojson json =
  let path_string = "app.bsky.notification.getUnreadCount#main/parameters" in
  match json with
  | `Assoc kvs ->
      let seenAt, kvs = find_optional_field "seenAt" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({seenAt} : notification_getUnreadCount_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_notification_getUnreadCount_parameters
    (_object_ : notification_getUnreadCount_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "app.bsky.notification.getUnreadCount#main/parameters" );
         Option.map (fun v -> "seenAt", yojson_of_string v) _object_.seenAt;
       ])

let notification_listNotifications_notification_of_yojson json =
  let path_string = "app.bsky.notification.listNotifications#notification" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs =
        find_required_field path_string "cid" kvs string_of_yojson
      in
      let author, kvs =
        find_required_field path_string "author" kvs actor_profileView_of_yojson
      in
      let reason, kvs =
        find_required_field path_string "reason" kvs string_of_yojson
      in
      let reasonSubject, kvs =
        find_optional_field "reasonSubject" kvs string_of_yojson
      in
      let record, kvs = find_required_field path_string "record" kvs Fun.id in
      let isRead, kvs =
        find_required_field path_string "isRead" kvs bool_of_yojson
      in
      let indexedAt, kvs =
        find_required_field path_string "indexedAt" kvs string_of_yojson
      in
      let labels, kvs =
        find_optional_field "labels" kvs (list_of_yojson label_label_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({
           uri;
           cid;
           author;
           reason;
           reasonSubject;
           record;
           isRead;
           indexedAt;
           labels;
         }
          : notification_listNotifications_notification)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_notification_listNotifications_notification
    (_object_ : notification_listNotifications_notification) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "app.bsky.notification.listNotifications#notification" );
         Some ("uri", yojson_of_string _object_.uri);
         Some ("cid", yojson_of_string _object_.cid);
         Some ("author", yojson_of_actor_profileView _object_.author);
         Some ("reason", yojson_of_string _object_.reason);
         Option.map
           (fun v -> "reasonSubject", yojson_of_string v)
           _object_.reasonSubject;
         Some ("record", Fun.id _object_.record);
         Some ("isRead", yojson_of_bool _object_.isRead);
         Some ("indexedAt", yojson_of_string _object_.indexedAt);
         Option.map
           (fun v -> "labels", (yojson_of_list yojson_of_label_label) v)
           _object_.labels;
       ])

let notification_listNotifications_output_of_yojson json =
  let path_string = "app.bsky.notification.listNotifications#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let notifications, kvs =
        find_required_field
          path_string
          "notifications"
          kvs
          (list_of_yojson notification_listNotifications_notification_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; notifications} : notification_listNotifications_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_notification_listNotifications_output
    (_object_ : notification_listNotifications_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "app.bsky.notification.listNotifications#main/output" );
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ( "notifications",
             (yojson_of_list
                yojson_of_notification_listNotifications_notification)
               _object_.notifications );
       ])

let notification_listNotifications_parameters_of_yojson json =
  let path_string = "app.bsky.notification.listNotifications#main/parameters" in
  match json with
  | `Assoc kvs ->
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let seenAt, kvs = find_optional_field "seenAt" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({limit; cursor; seenAt} : notification_listNotifications_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_notification_listNotifications_parameters
    (_object_ : notification_listNotifications_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "app.bsky.notification.listNotifications#main/parameters"
           );
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Option.map (fun v -> "seenAt", yojson_of_string v) _object_.seenAt;
       ])

let notification_updateSeen_input_of_yojson json =
  let path_string = "app.bsky.notification.updateSeen#main/input" in
  match json with
  | `Assoc kvs ->
      let seenAt, kvs =
        find_required_field path_string "seenAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({seenAt} : notification_updateSeen_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_notification_updateSeen_input
    (_object_ : notification_updateSeen_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.notification.updateSeen#main/input");
         Some ("seenAt", yojson_of_string _object_.seenAt);
       ])

let unspecced_getPopular_output_of_yojson json =
  let path_string = "app.bsky.unspecced.getPopular#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let feed, kvs =
        find_required_field
          path_string
          "feed"
          kvs
          (list_of_yojson feed_feedViewPost_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; feed} : unspecced_getPopular_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_unspecced_getPopular_output
    (_object_ : unspecced_getPopular_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.unspecced.getPopular#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ("feed", (yojson_of_list yojson_of_feed_feedViewPost) _object_.feed);
       ])

let unspecced_getPopular_parameters_of_yojson json =
  let path_string = "app.bsky.unspecced.getPopular#main/parameters" in
  match json with
  | `Assoc kvs ->
      let includeNsfw, kvs =
        find_optional_field "includeNsfw" kvs bool_of_yojson
      in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({includeNsfw; limit; cursor} : unspecced_getPopular_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_unspecced_getPopular_parameters
    (_object_ : unspecced_getPopular_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "app.bsky.unspecced.getPopular#main/parameters");
         Option.map
           (fun v -> "includeNsfw", yojson_of_bool v)
           _object_.includeNsfw;
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let unspecced_getPopularFeedGenerators_output_of_yojson json =
  let path_string = "app.bsky.unspecced.getPopularFeedGenerators#main/output" in
  match json with
  | `Assoc kvs ->
      let feeds, kvs =
        find_required_field
          path_string
          "feeds"
          kvs
          (list_of_yojson feed_generatorView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({feeds} : unspecced_getPopularFeedGenerators_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_unspecced_getPopularFeedGenerators_output
    (_object_ : unspecced_getPopularFeedGenerators_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "app.bsky.unspecced.getPopularFeedGenerators#main/output"
           );
         Some
           ( "feeds",
             (yojson_of_list yojson_of_feed_generatorView) _object_.feeds );
       ])

let unspecced_getTimelineSkeleton_output_of_yojson json =
  let path_string = "app.bsky.unspecced.getTimelineSkeleton#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let feed, kvs =
        find_required_field
          path_string
          "feed"
          kvs
          (list_of_yojson feed_skeletonFeedPost_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; feed} : unspecced_getTimelineSkeleton_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_unspecced_getTimelineSkeleton_output
    (_object_ : unspecced_getTimelineSkeleton_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "app.bsky.unspecced.getTimelineSkeleton#main/output" );
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ( "feed",
             (yojson_of_list yojson_of_feed_skeletonFeedPost) _object_.feed );
       ])

let unspecced_getTimelineSkeleton_parameters_of_yojson json =
  let path_string = "app.bsky.unspecced.getTimelineSkeleton#main/parameters" in
  match json with
  | `Assoc kvs ->
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({limit; cursor} : unspecced_getTimelineSkeleton_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_unspecced_getTimelineSkeleton_parameters
    (_object_ : unspecced_getTimelineSkeleton_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "app.bsky.unspecced.getTimelineSkeleton#main/parameters" );
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let admin_acknowledge_of_yojson = string_of_yojson

let yojson_of_admin_acknowledge = yojson_of_string

let admin_actionReversal_of_yojson json =
  let path_string = "com.atproto.admin.defs#actionReversal" in
  match json with
  | `Assoc kvs ->
      let reason, kvs =
        find_required_field path_string "reason" kvs string_of_yojson
      in
      let createdBy, kvs =
        find_required_field path_string "createdBy" kvs string_of_yojson
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({reason; createdBy; createdAt} : admin_actionReversal)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_actionReversal (_object_ : admin_actionReversal) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#actionReversal");
         Some ("reason", yojson_of_string _object_.reason);
         Some ("createdBy", yojson_of_string _object_.createdBy);
         Some ("createdAt", yojson_of_string _object_.createdAt);
       ])

let admin_actionType_of_yojson = string_of_yojson

let yojson_of_admin_actionType = yojson_of_string

let admin_repoRef_of_yojson json =
  let path_string = "com.atproto.admin.defs#repoRef" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did} : admin_repoRef)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_repoRef (_object_ : admin_repoRef) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#repoRef");
         Some ("did", yojson_of_string _object_.did);
       ])

let admin_actionView_subject_of_yojson json =
  let path_string = "com.atproto.admin.defs#actionView/subject" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "com.atproto.admin.defs#repoRef" ->
           RepoRef (admin_repoRef_of_yojson json)
       | "com.atproto.repo.strongRef" ->
           StrongRef (repo_strongRef_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : admin_actionView_subject)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_actionView_subject (union : admin_actionView_subject) =
  match union with
  | RepoRef x -> yojson_of_admin_repoRef x
  | StrongRef x -> yojson_of_repo_strongRef x

let admin_actionView_of_yojson json =
  let path_string = "com.atproto.admin.defs#actionView" in
  match json with
  | `Assoc kvs ->
      let id, kvs = find_required_field path_string "id" kvs int64_of_yojson in
      let action, kvs =
        find_required_field path_string "action" kvs admin_actionType_of_yojson
      in
      let subject, kvs =
        find_required_field
          path_string
          "subject"
          kvs
          admin_actionView_subject_of_yojson
      in
      let subjectBlobCids, kvs =
        find_required_field
          path_string
          "subjectBlobCids"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let createLabelVals, kvs =
        find_optional_field
          "createLabelVals"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let negateLabelVals, kvs =
        find_optional_field
          "negateLabelVals"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let reason, kvs =
        find_required_field path_string "reason" kvs string_of_yojson
      in
      let createdBy, kvs =
        find_required_field path_string "createdBy" kvs string_of_yojson
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let reversal, kvs =
        find_optional_field "reversal" kvs admin_actionReversal_of_yojson
      in
      let resolvedReportIds, kvs =
        find_required_field
          path_string
          "resolvedReportIds"
          kvs
          (list_of_yojson int64_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({
           id;
           action;
           subject;
           subjectBlobCids;
           createLabelVals;
           negateLabelVals;
           reason;
           createdBy;
           createdAt;
           reversal;
           resolvedReportIds;
         }
          : admin_actionView)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_actionView (_object_ : admin_actionView) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#actionView");
         Some ("id", yojson_of_int64 _object_.id);
         Some ("action", yojson_of_admin_actionType _object_.action);
         Some ("subject", yojson_of_admin_actionView_subject _object_.subject);
         Some
           ( "subjectBlobCids",
             (yojson_of_list yojson_of_string) _object_.subjectBlobCids );
         Option.map
           (fun v -> "createLabelVals", (yojson_of_list yojson_of_string) v)
           _object_.createLabelVals;
         Option.map
           (fun v -> "negateLabelVals", (yojson_of_list yojson_of_string) v)
           _object_.negateLabelVals;
         Some ("reason", yojson_of_string _object_.reason);
         Some ("createdBy", yojson_of_string _object_.createdBy);
         Some ("createdAt", yojson_of_string _object_.createdAt);
         Option.map
           (fun v -> "reversal", yojson_of_admin_actionReversal v)
           _object_.reversal;
         Some
           ( "resolvedReportIds",
             (yojson_of_list yojson_of_int64) _object_.resolvedReportIds );
       ])

let admin_actionViewCurrent_of_yojson json =
  let path_string = "com.atproto.admin.defs#actionViewCurrent" in
  match json with
  | `Assoc kvs ->
      let id, kvs = find_required_field path_string "id" kvs int64_of_yojson in
      let action, kvs =
        find_required_field path_string "action" kvs admin_actionType_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({id; action} : admin_actionViewCurrent)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_actionViewCurrent (_object_ : admin_actionViewCurrent) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#actionViewCurrent");
         Some ("id", yojson_of_int64 _object_.id);
         Some ("action", yojson_of_admin_actionType _object_.action);
       ])

let moderation_reasonType_of_yojson = string_of_yojson

let yojson_of_moderation_reasonType = yojson_of_string

let admin_reportView_subject_of_yojson json =
  let path_string = "com.atproto.admin.defs#reportView/subject" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "com.atproto.admin.defs#repoRef" ->
           RepoRef (admin_repoRef_of_yojson json)
       | "com.atproto.repo.strongRef" ->
           StrongRef (repo_strongRef_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : admin_reportView_subject)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_reportView_subject (union : admin_reportView_subject) =
  match union with
  | RepoRef x -> yojson_of_admin_repoRef x
  | StrongRef x -> yojson_of_repo_strongRef x

let admin_reportView_of_yojson json =
  let path_string = "com.atproto.admin.defs#reportView" in
  match json with
  | `Assoc kvs ->
      let id, kvs = find_required_field path_string "id" kvs int64_of_yojson in
      let reasonType, kvs =
        find_required_field
          path_string
          "reasonType"
          kvs
          moderation_reasonType_of_yojson
      in
      let reason, kvs = find_optional_field "reason" kvs string_of_yojson in
      let subjectRepoHandle, kvs =
        find_optional_field "subjectRepoHandle" kvs string_of_yojson
      in
      let subject, kvs =
        find_required_field
          path_string
          "subject"
          kvs
          admin_reportView_subject_of_yojson
      in
      let reportedBy, kvs =
        find_required_field path_string "reportedBy" kvs string_of_yojson
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let resolvedByActionIds, kvs =
        find_required_field
          path_string
          "resolvedByActionIds"
          kvs
          (list_of_yojson int64_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({
           id;
           reasonType;
           reason;
           subjectRepoHandle;
           subject;
           reportedBy;
           createdAt;
           resolvedByActionIds;
         }
          : admin_reportView)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_reportView (_object_ : admin_reportView) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#reportView");
         Some ("id", yojson_of_int64 _object_.id);
         Some ("reasonType", yojson_of_moderation_reasonType _object_.reasonType);
         Option.map (fun v -> "reason", yojson_of_string v) _object_.reason;
         Option.map
           (fun v -> "subjectRepoHandle", yojson_of_string v)
           _object_.subjectRepoHandle;
         Some ("subject", yojson_of_admin_reportView_subject _object_.subject);
         Some ("reportedBy", yojson_of_string _object_.reportedBy);
         Some ("createdAt", yojson_of_string _object_.createdAt);
         Some
           ( "resolvedByActionIds",
             (yojson_of_list yojson_of_int64) _object_.resolvedByActionIds );
       ])

let admin_moderation_of_yojson json =
  let path_string = "com.atproto.admin.defs#moderation" in
  match json with
  | `Assoc kvs ->
      let currentAction, kvs =
        find_optional_field
          "currentAction"
          kvs
          admin_actionViewCurrent_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({currentAction} : admin_moderation)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_moderation (_object_ : admin_moderation) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#moderation");
         Option.map
           (fun v -> "currentAction", yojson_of_admin_actionViewCurrent v)
           _object_.currentAction;
       ])

let admin_videoDetails_of_yojson json =
  let path_string = "com.atproto.admin.defs#videoDetails" in
  match json with
  | `Assoc kvs ->
      let width, kvs =
        find_required_field path_string "width" kvs int64_of_yojson
      in
      let height, kvs =
        find_required_field path_string "height" kvs int64_of_yojson
      in
      let length, kvs =
        find_required_field path_string "length" kvs int64_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({width; height; length} : admin_videoDetails)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_videoDetails (_object_ : admin_videoDetails) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#videoDetails");
         Some ("width", yojson_of_int64 _object_.width);
         Some ("height", yojson_of_int64 _object_.height);
         Some ("length", yojson_of_int64 _object_.length);
       ])

let admin_imageDetails_of_yojson json =
  let path_string = "com.atproto.admin.defs#imageDetails" in
  match json with
  | `Assoc kvs ->
      let width, kvs =
        find_required_field path_string "width" kvs int64_of_yojson
      in
      let height, kvs =
        find_required_field path_string "height" kvs int64_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({width; height} : admin_imageDetails)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_imageDetails (_object_ : admin_imageDetails) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#imageDetails");
         Some ("width", yojson_of_int64 _object_.width);
         Some ("height", yojson_of_int64 _object_.height);
       ])

let admin_blobView_details_of_yojson json =
  let path_string = "com.atproto.admin.defs#blobView/details" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "com.atproto.admin.defs#imageDetails" ->
           ImageDetails (admin_imageDetails_of_yojson json)
       | "com.atproto.admin.defs#videoDetails" ->
           VideoDetails (admin_videoDetails_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : admin_blobView_details)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_blobView_details (union : admin_blobView_details) =
  match union with
  | ImageDetails x -> yojson_of_admin_imageDetails x
  | VideoDetails x -> yojson_of_admin_videoDetails x

let admin_blobView_of_yojson json =
  let path_string = "com.atproto.admin.defs#blobView" in
  match json with
  | `Assoc kvs ->
      let cid, kvs =
        find_required_field path_string "cid" kvs string_of_yojson
      in
      let mimeType, kvs =
        find_required_field path_string "mimeType" kvs string_of_yojson
      in
      let size, kvs =
        find_required_field path_string "size" kvs int64_of_yojson
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let details, kvs =
        find_optional_field "details" kvs admin_blobView_details_of_yojson
      in
      let moderation, kvs =
        find_optional_field "moderation" kvs admin_moderation_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({cid; mimeType; size; createdAt; details; moderation} : admin_blobView)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_blobView (_object_ : admin_blobView) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#blobView");
         Some ("cid", yojson_of_string _object_.cid);
         Some ("mimeType", yojson_of_string _object_.mimeType);
         Some ("size", yojson_of_int64 _object_.size);
         Some ("createdAt", yojson_of_string _object_.createdAt);
         Option.map
           (fun v -> "details", yojson_of_admin_blobView_details v)
           _object_.details;
         Option.map
           (fun v -> "moderation", yojson_of_admin_moderation v)
           _object_.moderation;
       ])

let admin_repoViewNotFound_of_yojson json =
  let path_string = "com.atproto.admin.defs#repoViewNotFound" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did} : admin_repoViewNotFound)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_repoViewNotFound (_object_ : admin_repoViewNotFound) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#repoViewNotFound");
         Some ("did", yojson_of_string _object_.did);
       ])

let server_inviteCodeUse_of_yojson json =
  let path_string = "com.atproto.server.defs#inviteCodeUse" in
  match json with
  | `Assoc kvs ->
      let usedBy, kvs =
        find_required_field path_string "usedBy" kvs string_of_yojson
      in
      let usedAt, kvs =
        find_required_field path_string "usedAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({usedBy; usedAt} : server_inviteCodeUse)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_inviteCodeUse (_object_ : server_inviteCodeUse) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.server.defs#inviteCodeUse");
         Some ("usedBy", yojson_of_string _object_.usedBy);
         Some ("usedAt", yojson_of_string _object_.usedAt);
       ])

let server_inviteCode_of_yojson json =
  let path_string = "com.atproto.server.defs#inviteCode" in
  match json with
  | `Assoc kvs ->
      let code, kvs =
        find_required_field path_string "code" kvs string_of_yojson
      in
      let available, kvs =
        find_required_field path_string "available" kvs int64_of_yojson
      in
      let disabled, kvs =
        find_required_field path_string "disabled" kvs bool_of_yojson
      in
      let forAccount, kvs =
        find_required_field path_string "forAccount" kvs string_of_yojson
      in
      let createdBy, kvs =
        find_required_field path_string "createdBy" kvs string_of_yojson
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let uses, kvs =
        find_required_field
          path_string
          "uses"
          kvs
          (list_of_yojson server_inviteCodeUse_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({code; available; disabled; forAccount; createdBy; createdAt; uses}
          : server_inviteCode)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_inviteCode (_object_ : server_inviteCode) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.server.defs#inviteCode");
         Some ("code", yojson_of_string _object_.code);
         Some ("available", yojson_of_int64 _object_.available);
         Some ("disabled", yojson_of_bool _object_.disabled);
         Some ("forAccount", yojson_of_string _object_.forAccount);
         Some ("createdBy", yojson_of_string _object_.createdBy);
         Some ("createdAt", yojson_of_string _object_.createdAt);
         Some
           ( "uses",
             (yojson_of_list yojson_of_server_inviteCodeUse) _object_.uses );
       ])

let admin_repoView_of_yojson json =
  let path_string = "com.atproto.admin.defs#repoView" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let handle, kvs =
        find_required_field path_string "handle" kvs string_of_yojson
      in
      let email, kvs = find_optional_field "email" kvs string_of_yojson in
      let relatedRecords, kvs =
        find_required_field
          path_string
          "relatedRecords"
          kvs
          (list_of_yojson Fun.id)
      in
      let indexedAt, kvs =
        find_required_field path_string "indexedAt" kvs string_of_yojson
      in
      let moderation, kvs =
        find_required_field
          path_string
          "moderation"
          kvs
          admin_moderation_of_yojson
      in
      let invitedBy, kvs =
        find_optional_field "invitedBy" kvs server_inviteCode_of_yojson
      in
      let invitesDisabled, kvs =
        find_optional_field "invitesDisabled" kvs bool_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({
           did;
           handle;
           email;
           relatedRecords;
           indexedAt;
           moderation;
           invitedBy;
           invitesDisabled;
         }
          : admin_repoView)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_repoView (_object_ : admin_repoView) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#repoView");
         Some ("did", yojson_of_string _object_.did);
         Some ("handle", yojson_of_string _object_.handle);
         Option.map (fun v -> "email", yojson_of_string v) _object_.email;
         Some ("relatedRecords", (yojson_of_list Fun.id) _object_.relatedRecords);
         Some ("indexedAt", yojson_of_string _object_.indexedAt);
         Some ("moderation", yojson_of_admin_moderation _object_.moderation);
         Option.map
           (fun v -> "invitedBy", yojson_of_server_inviteCode v)
           _object_.invitedBy;
         Option.map
           (fun v -> "invitesDisabled", yojson_of_bool v)
           _object_.invitesDisabled;
       ])

let admin_recordViewNotFound_of_yojson json =
  let path_string = "com.atproto.admin.defs#recordViewNotFound" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri} : admin_recordViewNotFound)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_recordViewNotFound (_object_ : admin_recordViewNotFound) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#recordViewNotFound");
         Some ("uri", yojson_of_string _object_.uri);
       ])

let admin_recordView_of_yojson json =
  let path_string = "com.atproto.admin.defs#recordView" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs =
        find_required_field path_string "cid" kvs string_of_yojson
      in
      let value, kvs = find_required_field path_string "value" kvs Fun.id in
      let blobCids, kvs =
        find_required_field
          path_string
          "blobCids"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let indexedAt, kvs =
        find_required_field path_string "indexedAt" kvs string_of_yojson
      in
      let moderation, kvs =
        find_required_field
          path_string
          "moderation"
          kvs
          admin_moderation_of_yojson
      in
      let repo, kvs =
        find_required_field path_string "repo" kvs admin_repoView_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({uri; cid; value; blobCids; indexedAt; moderation; repo}
          : admin_recordView)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_recordView (_object_ : admin_recordView) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#recordView");
         Some ("uri", yojson_of_string _object_.uri);
         Some ("cid", yojson_of_string _object_.cid);
         Some ("value", Fun.id _object_.value);
         Some ("blobCids", (yojson_of_list yojson_of_string) _object_.blobCids);
         Some ("indexedAt", yojson_of_string _object_.indexedAt);
         Some ("moderation", yojson_of_admin_moderation _object_.moderation);
         Some ("repo", yojson_of_admin_repoView _object_.repo);
       ])

let admin_actionViewDetail_subject_of_yojson json =
  let path_string = "com.atproto.admin.defs#actionViewDetail/subject" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "com.atproto.admin.defs#repoView" ->
           RepoView (admin_repoView_of_yojson json)
       | "com.atproto.admin.defs#repoViewNotFound" ->
           RepoViewNotFound (admin_repoViewNotFound_of_yojson json)
       | "com.atproto.admin.defs#recordView" ->
           RecordView (admin_recordView_of_yojson json)
       | "com.atproto.admin.defs#recordViewNotFound" ->
           RecordViewNotFound (admin_recordViewNotFound_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : admin_actionViewDetail_subject)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_actionViewDetail_subject
    (union : admin_actionViewDetail_subject) =
  match union with
  | RepoView x -> yojson_of_admin_repoView x
  | RepoViewNotFound x -> yojson_of_admin_repoViewNotFound x
  | RecordView x -> yojson_of_admin_recordView x
  | RecordViewNotFound x -> yojson_of_admin_recordViewNotFound x

let admin_actionViewDetail_of_yojson json =
  let path_string = "com.atproto.admin.defs#actionViewDetail" in
  match json with
  | `Assoc kvs ->
      let id, kvs = find_required_field path_string "id" kvs int64_of_yojson in
      let action, kvs =
        find_required_field path_string "action" kvs admin_actionType_of_yojson
      in
      let subject, kvs =
        find_required_field
          path_string
          "subject"
          kvs
          admin_actionViewDetail_subject_of_yojson
      in
      let subjectBlobs, kvs =
        find_required_field
          path_string
          "subjectBlobs"
          kvs
          (list_of_yojson admin_blobView_of_yojson)
      in
      let createLabelVals, kvs =
        find_optional_field
          "createLabelVals"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let negateLabelVals, kvs =
        find_optional_field
          "negateLabelVals"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let reason, kvs =
        find_required_field path_string "reason" kvs string_of_yojson
      in
      let createdBy, kvs =
        find_required_field path_string "createdBy" kvs string_of_yojson
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let reversal, kvs =
        find_optional_field "reversal" kvs admin_actionReversal_of_yojson
      in
      let resolvedReports, kvs =
        find_required_field
          path_string
          "resolvedReports"
          kvs
          (list_of_yojson admin_reportView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({
           id;
           action;
           subject;
           subjectBlobs;
           createLabelVals;
           negateLabelVals;
           reason;
           createdBy;
           createdAt;
           reversal;
           resolvedReports;
         }
          : admin_actionViewDetail)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_actionViewDetail (_object_ : admin_actionViewDetail) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#actionViewDetail");
         Some ("id", yojson_of_int64 _object_.id);
         Some ("action", yojson_of_admin_actionType _object_.action);
         Some
           ("subject", yojson_of_admin_actionViewDetail_subject _object_.subject);
         Some
           ( "subjectBlobs",
             (yojson_of_list yojson_of_admin_blobView) _object_.subjectBlobs );
         Option.map
           (fun v -> "createLabelVals", (yojson_of_list yojson_of_string) v)
           _object_.createLabelVals;
         Option.map
           (fun v -> "negateLabelVals", (yojson_of_list yojson_of_string) v)
           _object_.negateLabelVals;
         Some ("reason", yojson_of_string _object_.reason);
         Some ("createdBy", yojson_of_string _object_.createdBy);
         Some ("createdAt", yojson_of_string _object_.createdAt);
         Option.map
           (fun v -> "reversal", yojson_of_admin_actionReversal v)
           _object_.reversal;
         Some
           ( "resolvedReports",
             (yojson_of_list yojson_of_admin_reportView)
               _object_.resolvedReports );
       ])

let admin_escalate_of_yojson = string_of_yojson

let yojson_of_admin_escalate = yojson_of_string

let admin_flag_of_yojson = string_of_yojson

let yojson_of_admin_flag = yojson_of_string

let admin_moderationDetail_of_yojson json =
  let path_string = "com.atproto.admin.defs#moderationDetail" in
  match json with
  | `Assoc kvs ->
      let currentAction, kvs =
        find_optional_field
          "currentAction"
          kvs
          admin_actionViewCurrent_of_yojson
      in
      let actions, kvs =
        find_required_field
          path_string
          "actions"
          kvs
          (list_of_yojson admin_actionView_of_yojson)
      in
      let reports, kvs =
        find_required_field
          path_string
          "reports"
          kvs
          (list_of_yojson admin_reportView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({currentAction; actions; reports} : admin_moderationDetail)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_moderationDetail (_object_ : admin_moderationDetail) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#moderationDetail");
         Option.map
           (fun v -> "currentAction", yojson_of_admin_actionViewCurrent v)
           _object_.currentAction;
         Some
           ( "actions",
             (yojson_of_list yojson_of_admin_actionView) _object_.actions );
         Some
           ( "reports",
             (yojson_of_list yojson_of_admin_reportView) _object_.reports );
       ])

let admin_recordViewDetail_of_yojson json =
  let path_string = "com.atproto.admin.defs#recordViewDetail" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs =
        find_required_field path_string "cid" kvs string_of_yojson
      in
      let value, kvs = find_required_field path_string "value" kvs Fun.id in
      let blobs, kvs =
        find_required_field
          path_string
          "blobs"
          kvs
          (list_of_yojson admin_blobView_of_yojson)
      in
      let labels, kvs =
        find_optional_field "labels" kvs (list_of_yojson label_label_of_yojson)
      in
      let indexedAt, kvs =
        find_required_field path_string "indexedAt" kvs string_of_yojson
      in
      let moderation, kvs =
        find_required_field
          path_string
          "moderation"
          kvs
          admin_moderationDetail_of_yojson
      in
      let repo, kvs =
        find_required_field path_string "repo" kvs admin_repoView_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({uri; cid; value; blobs; labels; indexedAt; moderation; repo}
          : admin_recordViewDetail)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_recordViewDetail (_object_ : admin_recordViewDetail) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#recordViewDetail");
         Some ("uri", yojson_of_string _object_.uri);
         Some ("cid", yojson_of_string _object_.cid);
         Some ("value", Fun.id _object_.value);
         Some ("blobs", (yojson_of_list yojson_of_admin_blobView) _object_.blobs);
         Option.map
           (fun v -> "labels", (yojson_of_list yojson_of_label_label) v)
           _object_.labels;
         Some ("indexedAt", yojson_of_string _object_.indexedAt);
         Some
           ("moderation", yojson_of_admin_moderationDetail _object_.moderation);
         Some ("repo", yojson_of_admin_repoView _object_.repo);
       ])

let admin_repoViewDetail_of_yojson json =
  let path_string = "com.atproto.admin.defs#repoViewDetail" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let handle, kvs =
        find_required_field path_string "handle" kvs string_of_yojson
      in
      let email, kvs = find_optional_field "email" kvs string_of_yojson in
      let relatedRecords, kvs =
        find_required_field
          path_string
          "relatedRecords"
          kvs
          (list_of_yojson Fun.id)
      in
      let indexedAt, kvs =
        find_required_field path_string "indexedAt" kvs string_of_yojson
      in
      let moderation, kvs =
        find_required_field
          path_string
          "moderation"
          kvs
          admin_moderationDetail_of_yojson
      in
      let labels, kvs =
        find_optional_field "labels" kvs (list_of_yojson label_label_of_yojson)
      in
      let invitedBy, kvs =
        find_optional_field "invitedBy" kvs server_inviteCode_of_yojson
      in
      let invites, kvs =
        find_optional_field
          "invites"
          kvs
          (list_of_yojson server_inviteCode_of_yojson)
      in
      let invitesDisabled, kvs =
        find_optional_field "invitesDisabled" kvs bool_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({
           did;
           handle;
           email;
           relatedRecords;
           indexedAt;
           moderation;
           labels;
           invitedBy;
           invites;
           invitesDisabled;
         }
          : admin_repoViewDetail)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_repoViewDetail (_object_ : admin_repoViewDetail) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#repoViewDetail");
         Some ("did", yojson_of_string _object_.did);
         Some ("handle", yojson_of_string _object_.handle);
         Option.map (fun v -> "email", yojson_of_string v) _object_.email;
         Some ("relatedRecords", (yojson_of_list Fun.id) _object_.relatedRecords);
         Some ("indexedAt", yojson_of_string _object_.indexedAt);
         Some
           ("moderation", yojson_of_admin_moderationDetail _object_.moderation);
         Option.map
           (fun v -> "labels", (yojson_of_list yojson_of_label_label) v)
           _object_.labels;
         Option.map
           (fun v -> "invitedBy", yojson_of_server_inviteCode v)
           _object_.invitedBy;
         Option.map
           (fun v -> "invites", (yojson_of_list yojson_of_server_inviteCode) v)
           _object_.invites;
         Option.map
           (fun v -> "invitesDisabled", yojson_of_bool v)
           _object_.invitesDisabled;
       ])

let admin_reportViewDetail_subject_of_yojson json =
  let path_string = "com.atproto.admin.defs#reportViewDetail/subject" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "com.atproto.admin.defs#repoView" ->
           RepoView (admin_repoView_of_yojson json)
       | "com.atproto.admin.defs#repoViewNotFound" ->
           RepoViewNotFound (admin_repoViewNotFound_of_yojson json)
       | "com.atproto.admin.defs#recordView" ->
           RecordView (admin_recordView_of_yojson json)
       | "com.atproto.admin.defs#recordViewNotFound" ->
           RecordViewNotFound (admin_recordViewNotFound_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : admin_reportViewDetail_subject)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_reportViewDetail_subject
    (union : admin_reportViewDetail_subject) =
  match union with
  | RepoView x -> yojson_of_admin_repoView x
  | RepoViewNotFound x -> yojson_of_admin_repoViewNotFound x
  | RecordView x -> yojson_of_admin_recordView x
  | RecordViewNotFound x -> yojson_of_admin_recordViewNotFound x

let admin_reportViewDetail_of_yojson json =
  let path_string = "com.atproto.admin.defs#reportViewDetail" in
  match json with
  | `Assoc kvs ->
      let id, kvs = find_required_field path_string "id" kvs int64_of_yojson in
      let reasonType, kvs =
        find_required_field
          path_string
          "reasonType"
          kvs
          moderation_reasonType_of_yojson
      in
      let reason, kvs = find_optional_field "reason" kvs string_of_yojson in
      let subject, kvs =
        find_required_field
          path_string
          "subject"
          kvs
          admin_reportViewDetail_subject_of_yojson
      in
      let reportedBy, kvs =
        find_required_field path_string "reportedBy" kvs string_of_yojson
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let resolvedByActions, kvs =
        find_required_field
          path_string
          "resolvedByActions"
          kvs
          (list_of_yojson admin_actionView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({
           id;
           reasonType;
           reason;
           subject;
           reportedBy;
           createdAt;
           resolvedByActions;
         }
          : admin_reportViewDetail)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_reportViewDetail (_object_ : admin_reportViewDetail) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.defs#reportViewDetail");
         Some ("id", yojson_of_int64 _object_.id);
         Some ("reasonType", yojson_of_moderation_reasonType _object_.reasonType);
         Option.map (fun v -> "reason", yojson_of_string v) _object_.reason;
         Some
           ("subject", yojson_of_admin_reportViewDetail_subject _object_.subject);
         Some ("reportedBy", yojson_of_string _object_.reportedBy);
         Some ("createdAt", yojson_of_string _object_.createdAt);
         Some
           ( "resolvedByActions",
             (yojson_of_list yojson_of_admin_actionView)
               _object_.resolvedByActions );
       ])

let admin_takedown_of_yojson = string_of_yojson

let yojson_of_admin_takedown = yojson_of_string

let admin_disableAccountInvites_input_of_yojson json =
  let path_string = "com.atproto.admin.disableAccountInvites#main/input" in
  match json with
  | `Assoc kvs ->
      let account, kvs =
        find_required_field path_string "account" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({account} : admin_disableAccountInvites_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_disableAccountInvites_input
    (_object_ : admin_disableAccountInvites_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "com.atproto.admin.disableAccountInvites#main/input" );
         Some ("account", yojson_of_string _object_.account);
       ])

let admin_disableInviteCodes_input_of_yojson json =
  let path_string = "com.atproto.admin.disableInviteCodes#main/input" in
  match json with
  | `Assoc kvs ->
      let codes, kvs =
        find_optional_field "codes" kvs (list_of_yojson string_of_yojson)
      in
      let accounts, kvs =
        find_optional_field "accounts" kvs (list_of_yojson string_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({codes; accounts} : admin_disableInviteCodes_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_disableInviteCodes_input
    (_object_ : admin_disableInviteCodes_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.admin.disableInviteCodes#main/input");
         Option.map
           (fun v -> "codes", (yojson_of_list yojson_of_string) v)
           _object_.codes;
         Option.map
           (fun v -> "accounts", (yojson_of_list yojson_of_string) v)
           _object_.accounts;
       ])

let admin_enableAccountInvites_input_of_yojson json =
  let path_string = "com.atproto.admin.enableAccountInvites#main/input" in
  match json with
  | `Assoc kvs ->
      let account, kvs =
        find_required_field path_string "account" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({account} : admin_enableAccountInvites_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_enableAccountInvites_input
    (_object_ : admin_enableAccountInvites_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.admin.enableAccountInvites#main/input");
         Some ("account", yojson_of_string _object_.account);
       ])

let admin_getInviteCodes_output_of_yojson json =
  let path_string = "com.atproto.admin.getInviteCodes#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let codes, kvs =
        find_required_field
          path_string
          "codes"
          kvs
          (list_of_yojson server_inviteCode_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; codes} : admin_getInviteCodes_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_getInviteCodes_output
    (_object_ : admin_getInviteCodes_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.getInviteCodes#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ("codes", (yojson_of_list yojson_of_server_inviteCode) _object_.codes);
       ])

let admin_getInviteCodes_parameters_of_yojson json =
  let path_string = "com.atproto.admin.getInviteCodes#main/parameters" in
  match json with
  | `Assoc kvs ->
      let sort, kvs = find_optional_field "sort" kvs string_of_yojson in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({sort; limit; cursor} : admin_getInviteCodes_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_getInviteCodes_parameters
    (_object_ : admin_getInviteCodes_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.admin.getInviteCodes#main/parameters");
         Option.map (fun v -> "sort", yojson_of_string v) _object_.sort;
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let admin_getModerationAction_parameters_of_yojson json =
  let path_string = "com.atproto.admin.getModerationAction#main/parameters" in
  match json with
  | `Assoc kvs ->
      let id, kvs = find_required_field path_string "id" kvs int64_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({id} : admin_getModerationAction_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_getModerationAction_parameters
    (_object_ : admin_getModerationAction_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "com.atproto.admin.getModerationAction#main/parameters" );
         Some ("id", yojson_of_int64 _object_.id);
       ])

let admin_getModerationActions_output_of_yojson json =
  let path_string = "com.atproto.admin.getModerationActions#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let actions, kvs =
        find_required_field
          path_string
          "actions"
          kvs
          (list_of_yojson admin_actionView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; actions} : admin_getModerationActions_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_getModerationActions_output
    (_object_ : admin_getModerationActions_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "com.atproto.admin.getModerationActions#main/output" );
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ( "actions",
             (yojson_of_list yojson_of_admin_actionView) _object_.actions );
       ])

let admin_getModerationActions_parameters_of_yojson json =
  let path_string = "com.atproto.admin.getModerationActions#main/parameters" in
  match json with
  | `Assoc kvs ->
      let subject, kvs = find_optional_field "subject" kvs string_of_yojson in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({subject; limit; cursor} : admin_getModerationActions_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_getModerationActions_parameters
    (_object_ : admin_getModerationActions_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "com.atproto.admin.getModerationActions#main/parameters" );
         Option.map (fun v -> "subject", yojson_of_string v) _object_.subject;
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let admin_getModerationReport_parameters_of_yojson json =
  let path_string = "com.atproto.admin.getModerationReport#main/parameters" in
  match json with
  | `Assoc kvs ->
      let id, kvs = find_required_field path_string "id" kvs int64_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({id} : admin_getModerationReport_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_getModerationReport_parameters
    (_object_ : admin_getModerationReport_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "com.atproto.admin.getModerationReport#main/parameters" );
         Some ("id", yojson_of_int64 _object_.id);
       ])

let admin_getModerationReports_output_of_yojson json =
  let path_string = "com.atproto.admin.getModerationReports#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let reports, kvs =
        find_required_field
          path_string
          "reports"
          kvs
          (list_of_yojson admin_reportView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; reports} : admin_getModerationReports_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_getModerationReports_output
    (_object_ : admin_getModerationReports_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "com.atproto.admin.getModerationReports#main/output" );
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ( "reports",
             (yojson_of_list yojson_of_admin_reportView) _object_.reports );
       ])

let admin_getModerationReports_parameters_of_yojson json =
  let path_string = "com.atproto.admin.getModerationReports#main/parameters" in
  match json with
  | `Assoc kvs ->
      let subject, kvs = find_optional_field "subject" kvs string_of_yojson in
      let ignoreSubjects, kvs =
        find_optional_field
          "ignoreSubjects"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let reporters, kvs =
        find_optional_field "reporters" kvs (list_of_yojson string_of_yojson)
      in
      let resolved, kvs = find_optional_field "resolved" kvs bool_of_yojson in
      let actionType, kvs =
        find_optional_field "actionType" kvs string_of_yojson
      in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let reverse, kvs = find_optional_field "reverse" kvs bool_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({
           subject;
           ignoreSubjects;
           reporters;
           resolved;
           actionType;
           limit;
           cursor;
           reverse;
         }
          : admin_getModerationReports_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_getModerationReports_parameters
    (_object_ : admin_getModerationReports_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "com.atproto.admin.getModerationReports#main/parameters" );
         Option.map (fun v -> "subject", yojson_of_string v) _object_.subject;
         Option.map
           (fun v -> "ignoreSubjects", (yojson_of_list yojson_of_string) v)
           _object_.ignoreSubjects;
         Option.map
           (fun v -> "reporters", (yojson_of_list yojson_of_string) v)
           _object_.reporters;
         Option.map (fun v -> "resolved", yojson_of_bool v) _object_.resolved;
         Option.map
           (fun v -> "actionType", yojson_of_string v)
           _object_.actionType;
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Option.map (fun v -> "reverse", yojson_of_bool v) _object_.reverse;
       ])

let admin_getRecord_parameters_of_yojson json =
  let path_string = "com.atproto.admin.getRecord#main/parameters" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs = find_optional_field "cid" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri; cid} : admin_getRecord_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_getRecord_parameters (_object_ : admin_getRecord_parameters)
    =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.getRecord#main/parameters");
         Some ("uri", yojson_of_string _object_.uri);
         Option.map (fun v -> "cid", yojson_of_string v) _object_.cid;
       ])

let admin_getRepo_parameters_of_yojson json =
  let path_string = "com.atproto.admin.getRepo#main/parameters" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did} : admin_getRepo_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_getRepo_parameters (_object_ : admin_getRepo_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.getRepo#main/parameters");
         Some ("did", yojson_of_string _object_.did);
       ])

let admin_rebaseRepo_input_of_yojson json =
  let path_string = "com.atproto.admin.rebaseRepo#main/input" in
  match json with
  | `Assoc kvs ->
      let repo, kvs =
        find_required_field path_string "repo" kvs string_of_yojson
      in
      let swapCommit, kvs =
        find_optional_field "swapCommit" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({repo; swapCommit} : admin_rebaseRepo_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_rebaseRepo_input (_object_ : admin_rebaseRepo_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.rebaseRepo#main/input");
         Some ("repo", yojson_of_string _object_.repo);
         Option.map
           (fun v -> "swapCommit", yojson_of_string v)
           _object_.swapCommit;
       ])

let admin_resolveModerationReports_input_of_yojson json =
  let path_string = "com.atproto.admin.resolveModerationReports#main/input" in
  match json with
  | `Assoc kvs ->
      let actionId, kvs =
        find_required_field path_string "actionId" kvs int64_of_yojson
      in
      let reportIds, kvs =
        find_required_field
          path_string
          "reportIds"
          kvs
          (list_of_yojson int64_of_yojson)
      in
      let createdBy, kvs =
        find_required_field path_string "createdBy" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({actionId; reportIds; createdBy}
          : admin_resolveModerationReports_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_resolveModerationReports_input
    (_object_ : admin_resolveModerationReports_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "com.atproto.admin.resolveModerationReports#main/input" );
         Some ("actionId", yojson_of_int64 _object_.actionId);
         Some ("reportIds", (yojson_of_list yojson_of_int64) _object_.reportIds);
         Some ("createdBy", yojson_of_string _object_.createdBy);
       ])

let admin_reverseModerationAction_input_of_yojson json =
  let path_string = "com.atproto.admin.reverseModerationAction#main/input" in
  match json with
  | `Assoc kvs ->
      let id, kvs = find_required_field path_string "id" kvs int64_of_yojson in
      let reason, kvs =
        find_required_field path_string "reason" kvs string_of_yojson
      in
      let createdBy, kvs =
        find_required_field path_string "createdBy" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({id; reason; createdBy} : admin_reverseModerationAction_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_reverseModerationAction_input
    (_object_ : admin_reverseModerationAction_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "com.atproto.admin.reverseModerationAction#main/input" );
         Some ("id", yojson_of_int64 _object_.id);
         Some ("reason", yojson_of_string _object_.reason);
         Some ("createdBy", yojson_of_string _object_.createdBy);
       ])

let admin_searchRepos_output_of_yojson json =
  let path_string = "com.atproto.admin.searchRepos#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let repos, kvs =
        find_required_field
          path_string
          "repos"
          kvs
          (list_of_yojson admin_repoView_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; repos} : admin_searchRepos_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_searchRepos_output (_object_ : admin_searchRepos_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.searchRepos#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some ("repos", (yojson_of_list yojson_of_admin_repoView) _object_.repos);
       ])

let admin_searchRepos_parameters_of_yojson json =
  let path_string = "com.atproto.admin.searchRepos#main/parameters" in
  match json with
  | `Assoc kvs ->
      let term, kvs = find_optional_field "term" kvs string_of_yojson in
      let invitedBy, kvs =
        find_optional_field "invitedBy" kvs string_of_yojson
      in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({term; invitedBy; limit; cursor} : admin_searchRepos_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_searchRepos_parameters
    (_object_ : admin_searchRepos_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.admin.searchRepos#main/parameters");
         Option.map (fun v -> "term", yojson_of_string v) _object_.term;
         Option.map
           (fun v -> "invitedBy", yojson_of_string v)
           _object_.invitedBy;
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let admin_takeModerationAction_input_subject_of_yojson json =
  let path_string =
    "com.atproto.admin.takeModerationAction#main/input/subject"
  in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "com.atproto.admin.defs#repoRef" ->
           RepoRef (admin_repoRef_of_yojson json)
       | "com.atproto.repo.strongRef" ->
           StrongRef (repo_strongRef_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : admin_takeModerationAction_input_subject)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_takeModerationAction_input_subject
    (union : admin_takeModerationAction_input_subject) =
  match union with
  | RepoRef x -> yojson_of_admin_repoRef x
  | StrongRef x -> yojson_of_repo_strongRef x

let admin_takeModerationAction_input_of_yojson json =
  let path_string = "com.atproto.admin.takeModerationAction#main/input" in
  match json with
  | `Assoc kvs ->
      let action, kvs =
        find_required_field path_string "action" kvs string_of_yojson
      in
      let subject, kvs =
        find_required_field
          path_string
          "subject"
          kvs
          admin_takeModerationAction_input_subject_of_yojson
      in
      let subjectBlobCids, kvs =
        find_optional_field
          "subjectBlobCids"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let createLabelVals, kvs =
        find_optional_field
          "createLabelVals"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let negateLabelVals, kvs =
        find_optional_field
          "negateLabelVals"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let reason, kvs =
        find_required_field path_string "reason" kvs string_of_yojson
      in
      let createdBy, kvs =
        find_required_field path_string "createdBy" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({
           action;
           subject;
           subjectBlobCids;
           createLabelVals;
           negateLabelVals;
           reason;
           createdBy;
         }
          : admin_takeModerationAction_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_takeModerationAction_input
    (_object_ : admin_takeModerationAction_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.admin.takeModerationAction#main/input");
         Some ("action", yojson_of_string _object_.action);
         Some
           ( "subject",
             yojson_of_admin_takeModerationAction_input_subject _object_.subject
           );
         Option.map
           (fun v -> "subjectBlobCids", (yojson_of_list yojson_of_string) v)
           _object_.subjectBlobCids;
         Option.map
           (fun v -> "createLabelVals", (yojson_of_list yojson_of_string) v)
           _object_.createLabelVals;
         Option.map
           (fun v -> "negateLabelVals", (yojson_of_list yojson_of_string) v)
           _object_.negateLabelVals;
         Some ("reason", yojson_of_string _object_.reason);
         Some ("createdBy", yojson_of_string _object_.createdBy);
       ])

let admin_updateAccountEmail_input_of_yojson json =
  let path_string = "com.atproto.admin.updateAccountEmail#main/input" in
  match json with
  | `Assoc kvs ->
      let account, kvs =
        find_required_field path_string "account" kvs string_of_yojson
      in
      let email, kvs =
        find_required_field path_string "email" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({account; email} : admin_updateAccountEmail_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_updateAccountEmail_input
    (_object_ : admin_updateAccountEmail_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.admin.updateAccountEmail#main/input");
         Some ("account", yojson_of_string _object_.account);
         Some ("email", yojson_of_string _object_.email);
       ])

let admin_updateAccountHandle_input_of_yojson json =
  let path_string = "com.atproto.admin.updateAccountHandle#main/input" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let handle, kvs =
        find_required_field path_string "handle" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did; handle} : admin_updateAccountHandle_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_admin_updateAccountHandle_input
    (_object_ : admin_updateAccountHandle_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.admin.updateAccountHandle#main/input");
         Some ("did", yojson_of_string _object_.did);
         Some ("handle", yojson_of_string _object_.handle);
       ])

let identity_resolveHandle_output_of_yojson json =
  let path_string = "com.atproto.identity.resolveHandle#main/output" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did} : identity_resolveHandle_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_identity_resolveHandle_output
    (_object_ : identity_resolveHandle_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.identity.resolveHandle#main/output");
         Some ("did", yojson_of_string _object_.did);
       ])

let identity_resolveHandle_parameters_of_yojson json =
  let path_string = "com.atproto.identity.resolveHandle#main/parameters" in
  match json with
  | `Assoc kvs ->
      let handle, kvs =
        find_required_field path_string "handle" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({handle} : identity_resolveHandle_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_identity_resolveHandle_parameters
    (_object_ : identity_resolveHandle_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "com.atproto.identity.resolveHandle#main/parameters" );
         Some ("handle", yojson_of_string _object_.handle);
       ])

let identity_updateHandle_input_of_yojson json =
  let path_string = "com.atproto.identity.updateHandle#main/input" in
  match json with
  | `Assoc kvs ->
      let handle, kvs =
        find_required_field path_string "handle" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({handle} : identity_updateHandle_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_identity_updateHandle_input
    (_object_ : identity_updateHandle_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.identity.updateHandle#main/input");
         Some ("handle", yojson_of_string _object_.handle);
       ])

let label_queryLabels_output_of_yojson json =
  let path_string = "com.atproto.label.queryLabels#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let labels, kvs =
        find_required_field
          path_string
          "labels"
          kvs
          (list_of_yojson label_label_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; labels} : label_queryLabels_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_label_queryLabels_output (_object_ : label_queryLabels_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.label.queryLabels#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some ("labels", (yojson_of_list yojson_of_label_label) _object_.labels);
       ])

let label_queryLabels_parameters_of_yojson json =
  let path_string = "com.atproto.label.queryLabels#main/parameters" in
  match json with
  | `Assoc kvs ->
      let uriPatterns, kvs =
        find_required_field
          path_string
          "uriPatterns"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let sources, kvs =
        find_optional_field "sources" kvs (list_of_yojson string_of_yojson)
      in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({uriPatterns; sources; limit; cursor} : label_queryLabels_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_label_queryLabels_parameters
    (_object_ : label_queryLabels_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.label.queryLabels#main/parameters");
         Some
           ( "uriPatterns",
             (yojson_of_list yojson_of_string) _object_.uriPatterns );
         Option.map
           (fun v -> "sources", (yojson_of_list yojson_of_string) v)
           _object_.sources;
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let label_subscribeLabels_info_of_yojson json =
  let path_string = "com.atproto.label.subscribeLabels#info" in
  match json with
  | `Assoc kvs ->
      let name, kvs =
        find_required_field path_string "name" kvs string_of_yojson
      in
      let message, kvs = find_optional_field "message" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({name; message} : label_subscribeLabels_info)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_label_subscribeLabels_info (_object_ : label_subscribeLabels_info)
    =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.label.subscribeLabels#info");
         Some ("name", yojson_of_string _object_.name);
         Option.map (fun v -> "message", yojson_of_string v) _object_.message;
       ])

let label_subscribeLabels_labels_of_yojson json =
  let path_string = "com.atproto.label.subscribeLabels#labels" in
  match json with
  | `Assoc kvs ->
      let seq, kvs =
        find_required_field path_string "seq" kvs int64_of_yojson
      in
      let labels, kvs =
        find_required_field
          path_string
          "labels"
          kvs
          (list_of_yojson label_label_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({seq; labels} : label_subscribeLabels_labels)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_label_subscribeLabels_labels
    (_object_ : label_subscribeLabels_labels) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.label.subscribeLabels#labels");
         Some ("seq", yojson_of_int64 _object_.seq);
         Some ("labels", (yojson_of_list yojson_of_label_label) _object_.labels);
       ])

let label_subscribeLabels_message_of_yojson json =
  let path_string = "com.atproto.label.subscribeLabels#main/message" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "com.atproto.label.subscribeLabels#labels" ->
           Labels (label_subscribeLabels_labels_of_yojson json)
       | "com.atproto.label.subscribeLabels#info" ->
           Info (label_subscribeLabels_info_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : label_subscribeLabels_message)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_label_subscribeLabels_message
    (union : label_subscribeLabels_message) =
  match union with
  | Labels x -> yojson_of_label_subscribeLabels_labels x
  | Info x -> yojson_of_label_subscribeLabels_info x

let label_subscribeLabels_parameters_of_yojson json =
  let path_string = "com.atproto.label.subscribeLabels#main/parameters" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs int64_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor} : label_subscribeLabels_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_label_subscribeLabels_parameters
    (_object_ : label_subscribeLabels_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.label.subscribeLabels#main/parameters");
         Option.map (fun v -> "cursor", yojson_of_int64 v) _object_.cursor;
       ])

let moderation_createReport_input_subject_of_yojson json =
  let path_string = "com.atproto.moderation.createReport#main/input/subject" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "com.atproto.admin.defs#repoRef" ->
           RepoRef (admin_repoRef_of_yojson json)
       | "com.atproto.repo.strongRef" ->
           StrongRef (repo_strongRef_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : moderation_createReport_input_subject)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_moderation_createReport_input_subject
    (union : moderation_createReport_input_subject) =
  match union with
  | RepoRef x -> yojson_of_admin_repoRef x
  | StrongRef x -> yojson_of_repo_strongRef x

let moderation_createReport_input_of_yojson json =
  let path_string = "com.atproto.moderation.createReport#main/input" in
  match json with
  | `Assoc kvs ->
      let reasonType, kvs =
        find_required_field
          path_string
          "reasonType"
          kvs
          moderation_reasonType_of_yojson
      in
      let reason, kvs = find_optional_field "reason" kvs string_of_yojson in
      let subject, kvs =
        find_required_field
          path_string
          "subject"
          kvs
          moderation_createReport_input_subject_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({reasonType; reason; subject} : moderation_createReport_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_moderation_createReport_input
    (_object_ : moderation_createReport_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.moderation.createReport#main/input");
         Some ("reasonType", yojson_of_moderation_reasonType _object_.reasonType);
         Option.map (fun v -> "reason", yojson_of_string v) _object_.reason;
         Some
           ( "subject",
             yojson_of_moderation_createReport_input_subject _object_.subject );
       ])

let moderation_createReport_output_subject_of_yojson json =
  let path_string = "com.atproto.moderation.createReport#main/output/subject" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "com.atproto.admin.defs#repoRef" ->
           RepoRef (admin_repoRef_of_yojson json)
       | "com.atproto.repo.strongRef" ->
           StrongRef (repo_strongRef_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : moderation_createReport_output_subject)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_moderation_createReport_output_subject
    (union : moderation_createReport_output_subject) =
  match union with
  | RepoRef x -> yojson_of_admin_repoRef x
  | StrongRef x -> yojson_of_repo_strongRef x

let moderation_createReport_output_of_yojson json =
  let path_string = "com.atproto.moderation.createReport#main/output" in
  match json with
  | `Assoc kvs ->
      let id, kvs = find_required_field path_string "id" kvs int64_of_yojson in
      let reasonType, kvs =
        find_required_field
          path_string
          "reasonType"
          kvs
          moderation_reasonType_of_yojson
      in
      let reason, kvs = find_optional_field "reason" kvs string_of_yojson in
      let subject, kvs =
        find_required_field
          path_string
          "subject"
          kvs
          moderation_createReport_output_subject_of_yojson
      in
      let reportedBy, kvs =
        find_required_field path_string "reportedBy" kvs string_of_yojson
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({id; reasonType; reason; subject; reportedBy; createdAt}
          : moderation_createReport_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_moderation_createReport_output
    (_object_ : moderation_createReport_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.moderation.createReport#main/output");
         Some ("id", yojson_of_int64 _object_.id);
         Some ("reasonType", yojson_of_moderation_reasonType _object_.reasonType);
         Option.map (fun v -> "reason", yojson_of_string v) _object_.reason;
         Some
           ( "subject",
             yojson_of_moderation_createReport_output_subject _object_.subject
           );
         Some ("reportedBy", yojson_of_string _object_.reportedBy);
         Some ("createdAt", yojson_of_string _object_.createdAt);
       ])

let moderation_reasonMisleading_of_yojson = string_of_yojson

let yojson_of_moderation_reasonMisleading = yojson_of_string

let moderation_reasonOther_of_yojson = string_of_yojson

let yojson_of_moderation_reasonOther = yojson_of_string

let moderation_reasonRude_of_yojson = string_of_yojson

let yojson_of_moderation_reasonRude = yojson_of_string

let moderation_reasonSexual_of_yojson = string_of_yojson

let yojson_of_moderation_reasonSexual = yojson_of_string

let moderation_reasonSpam_of_yojson = string_of_yojson

let yojson_of_moderation_reasonSpam = yojson_of_string

let moderation_reasonViolation_of_yojson = string_of_yojson

let yojson_of_moderation_reasonViolation = yojson_of_string

let nsid_of_yojson = string_of_yojson

let yojson_of_nsid = yojson_of_string

let repo_applyWrites_create_of_yojson json =
  let path_string = "com.atproto.repo.applyWrites#create" in
  match json with
  | `Assoc kvs ->
      let collection, kvs =
        find_required_field path_string "collection" kvs string_of_yojson
      in
      let rkey, kvs = find_optional_field "rkey" kvs string_of_yojson in
      let value, kvs = find_required_field path_string "value" kvs Fun.id in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({collection; rkey; value} : repo_applyWrites_create)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_applyWrites_create (_object_ : repo_applyWrites_create) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.applyWrites#create");
         Some ("collection", yojson_of_string _object_.collection);
         Option.map (fun v -> "rkey", yojson_of_string v) _object_.rkey;
         Some ("value", Fun.id _object_.value);
       ])

let repo_applyWrites_delete_of_yojson json =
  let path_string = "com.atproto.repo.applyWrites#delete" in
  match json with
  | `Assoc kvs ->
      let collection, kvs =
        find_required_field path_string "collection" kvs string_of_yojson
      in
      let rkey, kvs =
        find_required_field path_string "rkey" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({collection; rkey} : repo_applyWrites_delete)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_applyWrites_delete (_object_ : repo_applyWrites_delete) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.applyWrites#delete");
         Some ("collection", yojson_of_string _object_.collection);
         Some ("rkey", yojson_of_string _object_.rkey);
       ])

let repo_applyWrites_update_of_yojson json =
  let path_string = "com.atproto.repo.applyWrites#update" in
  match json with
  | `Assoc kvs ->
      let collection, kvs =
        find_required_field path_string "collection" kvs string_of_yojson
      in
      let rkey, kvs =
        find_required_field path_string "rkey" kvs string_of_yojson
      in
      let value, kvs = find_required_field path_string "value" kvs Fun.id in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({collection; rkey; value} : repo_applyWrites_update)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_applyWrites_update (_object_ : repo_applyWrites_update) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.applyWrites#update");
         Some ("collection", yojson_of_string _object_.collection);
         Some ("rkey", yojson_of_string _object_.rkey);
         Some ("value", Fun.id _object_.value);
       ])

let repo_applyWrites_input_writes_item_of_yojson json =
  let path_string = "com.atproto.repo.applyWrites#main/input/writes/item" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "com.atproto.repo.applyWrites#create" ->
           Create (repo_applyWrites_create_of_yojson json)
       | "com.atproto.repo.applyWrites#update" ->
           Update (repo_applyWrites_update_of_yojson json)
       | "com.atproto.repo.applyWrites#delete" ->
           Delete (repo_applyWrites_delete_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : repo_applyWrites_input_writes_item)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_applyWrites_input_writes_item
    (union : repo_applyWrites_input_writes_item) =
  match union with
  | Create x -> yojson_of_repo_applyWrites_create x
  | Update x -> yojson_of_repo_applyWrites_update x
  | Delete x -> yojson_of_repo_applyWrites_delete x

let repo_applyWrites_input_of_yojson json =
  let path_string = "com.atproto.repo.applyWrites#main/input" in
  match json with
  | `Assoc kvs ->
      let repo, kvs =
        find_required_field path_string "repo" kvs string_of_yojson
      in
      let validate, kvs = find_optional_field "validate" kvs bool_of_yojson in
      let writes, kvs =
        find_required_field
          path_string
          "writes"
          kvs
          (list_of_yojson repo_applyWrites_input_writes_item_of_yojson)
      in
      let swapCommit, kvs =
        find_optional_field "swapCommit" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({repo; validate; writes; swapCommit} : repo_applyWrites_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_applyWrites_input (_object_ : repo_applyWrites_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.applyWrites#main/input");
         Some ("repo", yojson_of_string _object_.repo);
         Option.map (fun v -> "validate", yojson_of_bool v) _object_.validate;
         Some
           ( "writes",
             (yojson_of_list yojson_of_repo_applyWrites_input_writes_item)
               _object_.writes );
         Option.map
           (fun v -> "swapCommit", yojson_of_string v)
           _object_.swapCommit;
       ])

let repo_createRecord_input_of_yojson json =
  let path_string = "com.atproto.repo.createRecord#main/input" in
  match json with
  | `Assoc kvs ->
      let repo, kvs =
        find_required_field path_string "repo" kvs string_of_yojson
      in
      let collection, kvs =
        find_required_field path_string "collection" kvs string_of_yojson
      in
      let rkey, kvs = find_optional_field "rkey" kvs string_of_yojson in
      let validate, kvs = find_optional_field "validate" kvs bool_of_yojson in
      let record, kvs = find_required_field path_string "record" kvs Fun.id in
      let swapCommit, kvs =
        find_optional_field "swapCommit" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({repo; collection; rkey; validate; record; swapCommit}
          : repo_createRecord_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_createRecord_input (_object_ : repo_createRecord_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.createRecord#main/input");
         Some ("repo", yojson_of_string _object_.repo);
         Some ("collection", yojson_of_string _object_.collection);
         Option.map (fun v -> "rkey", yojson_of_string v) _object_.rkey;
         Option.map (fun v -> "validate", yojson_of_bool v) _object_.validate;
         Some ("record", Fun.id _object_.record);
         Option.map
           (fun v -> "swapCommit", yojson_of_string v)
           _object_.swapCommit;
       ])

let repo_createRecord_output_of_yojson json =
  let path_string = "com.atproto.repo.createRecord#main/output" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs =
        find_required_field path_string "cid" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri; cid} : repo_createRecord_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_createRecord_output (_object_ : repo_createRecord_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.createRecord#main/output");
         Some ("uri", yojson_of_string _object_.uri);
         Some ("cid", yojson_of_string _object_.cid);
       ])

let repo_deleteRecord_input_of_yojson json =
  let path_string = "com.atproto.repo.deleteRecord#main/input" in
  match json with
  | `Assoc kvs ->
      let repo, kvs =
        find_required_field path_string "repo" kvs string_of_yojson
      in
      let collection, kvs =
        find_required_field path_string "collection" kvs string_of_yojson
      in
      let rkey, kvs =
        find_required_field path_string "rkey" kvs string_of_yojson
      in
      let swapRecord, kvs =
        find_optional_field "swapRecord" kvs string_of_yojson
      in
      let swapCommit, kvs =
        find_optional_field "swapCommit" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({repo; collection; rkey; swapRecord; swapCommit}
          : repo_deleteRecord_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_deleteRecord_input (_object_ : repo_deleteRecord_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.deleteRecord#main/input");
         Some ("repo", yojson_of_string _object_.repo);
         Some ("collection", yojson_of_string _object_.collection);
         Some ("rkey", yojson_of_string _object_.rkey);
         Option.map
           (fun v -> "swapRecord", yojson_of_string v)
           _object_.swapRecord;
         Option.map
           (fun v -> "swapCommit", yojson_of_string v)
           _object_.swapCommit;
       ])

let repo_describeRepo_output_of_yojson json =
  let path_string = "com.atproto.repo.describeRepo#main/output" in
  match json with
  | `Assoc kvs ->
      let handle, kvs =
        find_required_field path_string "handle" kvs string_of_yojson
      in
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let didDoc, kvs = find_required_field path_string "didDoc" kvs Fun.id in
      let collections, kvs =
        find_required_field
          path_string
          "collections"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let handleIsCorrect, kvs =
        find_required_field path_string "handleIsCorrect" kvs bool_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({handle; did; didDoc; collections; handleIsCorrect}
          : repo_describeRepo_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_describeRepo_output (_object_ : repo_describeRepo_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.describeRepo#main/output");
         Some ("handle", yojson_of_string _object_.handle);
         Some ("did", yojson_of_string _object_.did);
         Some ("didDoc", Fun.id _object_.didDoc);
         Some
           ( "collections",
             (yojson_of_list yojson_of_string) _object_.collections );
         Some ("handleIsCorrect", yojson_of_bool _object_.handleIsCorrect);
       ])

let repo_describeRepo_parameters_of_yojson json =
  let path_string = "com.atproto.repo.describeRepo#main/parameters" in
  match json with
  | `Assoc kvs ->
      let repo, kvs =
        find_required_field path_string "repo" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({repo} : repo_describeRepo_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_describeRepo_parameters
    (_object_ : repo_describeRepo_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.describeRepo#main/parameters");
         Some ("repo", yojson_of_string _object_.repo);
       ])

let repo_getRecord_output_of_yojson json =
  let path_string = "com.atproto.repo.getRecord#main/output" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs = find_optional_field "cid" kvs string_of_yojson in
      let value, kvs = find_required_field path_string "value" kvs Fun.id in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri; cid; value} : repo_getRecord_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_getRecord_output (_object_ : repo_getRecord_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.getRecord#main/output");
         Some ("uri", yojson_of_string _object_.uri);
         Option.map (fun v -> "cid", yojson_of_string v) _object_.cid;
         Some ("value", Fun.id _object_.value);
       ])

let repo_getRecord_parameters_of_yojson json =
  let path_string = "com.atproto.repo.getRecord#main/parameters" in
  match json with
  | `Assoc kvs ->
      let repo, kvs =
        find_required_field path_string "repo" kvs string_of_yojson
      in
      let collection, kvs =
        find_required_field path_string "collection" kvs string_of_yojson
      in
      let rkey, kvs =
        find_required_field path_string "rkey" kvs string_of_yojson
      in
      let cid, kvs = find_optional_field "cid" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({repo; collection; rkey; cid} : repo_getRecord_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_getRecord_parameters (_object_ : repo_getRecord_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.getRecord#main/parameters");
         Some ("repo", yojson_of_string _object_.repo);
         Some ("collection", yojson_of_string _object_.collection);
         Some ("rkey", yojson_of_string _object_.rkey);
         Option.map (fun v -> "cid", yojson_of_string v) _object_.cid;
       ])

let repo_listRecords_record_of_yojson json =
  let path_string = "com.atproto.repo.listRecords#record" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs =
        find_required_field path_string "cid" kvs string_of_yojson
      in
      let value, kvs = find_required_field path_string "value" kvs Fun.id in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri; cid; value} : repo_listRecords_record)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_listRecords_record (_object_ : repo_listRecords_record) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.listRecords#record");
         Some ("uri", yojson_of_string _object_.uri);
         Some ("cid", yojson_of_string _object_.cid);
         Some ("value", Fun.id _object_.value);
       ])

let repo_listRecords_output_of_yojson json =
  let path_string = "com.atproto.repo.listRecords#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let records, kvs =
        find_required_field
          path_string
          "records"
          kvs
          (list_of_yojson repo_listRecords_record_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; records} : repo_listRecords_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_listRecords_output (_object_ : repo_listRecords_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.listRecords#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ( "records",
             (yojson_of_list yojson_of_repo_listRecords_record) _object_.records
           );
       ])

let repo_listRecords_parameters_of_yojson json =
  let path_string = "com.atproto.repo.listRecords#main/parameters" in
  match json with
  | `Assoc kvs ->
      let repo, kvs =
        find_required_field path_string "repo" kvs string_of_yojson
      in
      let collection, kvs =
        find_required_field path_string "collection" kvs string_of_yojson
      in
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let rkeyStart, kvs =
        find_optional_field "rkeyStart" kvs string_of_yojson
      in
      let rkeyEnd, kvs = find_optional_field "rkeyEnd" kvs string_of_yojson in
      let reverse, kvs = find_optional_field "reverse" kvs bool_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({repo; collection; limit; cursor; rkeyStart; rkeyEnd; reverse}
          : repo_listRecords_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_listRecords_parameters
    (_object_ : repo_listRecords_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.listRecords#main/parameters");
         Some ("repo", yojson_of_string _object_.repo);
         Some ("collection", yojson_of_string _object_.collection);
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Option.map
           (fun v -> "rkeyStart", yojson_of_string v)
           _object_.rkeyStart;
         Option.map (fun v -> "rkeyEnd", yojson_of_string v) _object_.rkeyEnd;
         Option.map (fun v -> "reverse", yojson_of_bool v) _object_.reverse;
       ])

let repo_putRecord_input_of_yojson json =
  let path_string = "com.atproto.repo.putRecord#main/input" in
  match json with
  | `Assoc kvs ->
      let repo, kvs =
        find_required_field path_string "repo" kvs string_of_yojson
      in
      let collection, kvs =
        find_required_field path_string "collection" kvs string_of_yojson
      in
      let rkey, kvs =
        find_required_field path_string "rkey" kvs string_of_yojson
      in
      let validate, kvs = find_optional_field "validate" kvs bool_of_yojson in
      let record, kvs = find_required_field path_string "record" kvs Fun.id in
      let swapRecord, kvs =
        find_optional_nullable_field "swapRecord" kvs string_of_yojson
      in
      let swapCommit, kvs =
        find_optional_field "swapCommit" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({repo; collection; rkey; validate; record; swapRecord; swapCommit}
          : repo_putRecord_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_putRecord_input (_object_ : repo_putRecord_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.putRecord#main/input");
         Some ("repo", yojson_of_string _object_.repo);
         Some ("collection", yojson_of_string _object_.collection);
         Some ("rkey", yojson_of_string _object_.rkey);
         Option.map (fun v -> "validate", yojson_of_bool v) _object_.validate;
         Some ("record", Fun.id _object_.record);
         Option.map
           (fun v -> "swapRecord", yojson_of_string v)
           _object_.swapRecord;
         Option.map
           (fun v -> "swapCommit", yojson_of_string v)
           _object_.swapCommit;
       ])

let repo_putRecord_output_of_yojson json =
  let path_string = "com.atproto.repo.putRecord#main/output" in
  match json with
  | `Assoc kvs ->
      let uri, kvs =
        find_required_field path_string "uri" kvs string_of_yojson
      in
      let cid, kvs =
        find_required_field path_string "cid" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({uri; cid} : repo_putRecord_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_putRecord_output (_object_ : repo_putRecord_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.putRecord#main/output");
         Some ("uri", yojson_of_string _object_.uri);
         Some ("cid", yojson_of_string _object_.cid);
       ])

let repo_rebaseRepo_input_of_yojson json =
  let path_string = "com.atproto.repo.rebaseRepo#main/input" in
  match json with
  | `Assoc kvs ->
      let repo, kvs =
        find_required_field path_string "repo" kvs string_of_yojson
      in
      let swapCommit, kvs =
        find_optional_field "swapCommit" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({repo; swapCommit} : repo_rebaseRepo_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_rebaseRepo_input (_object_ : repo_rebaseRepo_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.rebaseRepo#main/input");
         Some ("repo", yojson_of_string _object_.repo);
         Option.map
           (fun v -> "swapCommit", yojson_of_string v)
           _object_.swapCommit;
       ])

let repo_uploadBlob_output_of_yojson json =
  let path_string = "com.atproto.repo.uploadBlob#main/output" in
  match json with
  | `Assoc kvs ->
      let blob, kvs =
        find_required_field path_string "blob" kvs bytes_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({blob} : repo_uploadBlob_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_repo_uploadBlob_output (_object_ : repo_uploadBlob_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.repo.uploadBlob#main/output");
         Some ("blob", yojson_of_bytes _object_.blob);
       ])

let server_createAccount_input_of_yojson json =
  let path_string = "com.atproto.server.createAccount#main/input" in
  match json with
  | `Assoc kvs ->
      let email, kvs =
        find_required_field path_string "email" kvs string_of_yojson
      in
      let handle, kvs =
        find_required_field path_string "handle" kvs string_of_yojson
      in
      let did, kvs = find_optional_field "did" kvs string_of_yojson in
      let inviteCode, kvs =
        find_optional_field "inviteCode" kvs string_of_yojson
      in
      let password, kvs =
        find_required_field path_string "password" kvs string_of_yojson
      in
      let recoveryKey, kvs =
        find_optional_field "recoveryKey" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({email; handle; did; inviteCode; password; recoveryKey}
          : server_createAccount_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_createAccount_input (_object_ : server_createAccount_input)
    =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.server.createAccount#main/input");
         Some ("email", yojson_of_string _object_.email);
         Some ("handle", yojson_of_string _object_.handle);
         Option.map (fun v -> "did", yojson_of_string v) _object_.did;
         Option.map
           (fun v -> "inviteCode", yojson_of_string v)
           _object_.inviteCode;
         Some ("password", yojson_of_string _object_.password);
         Option.map
           (fun v -> "recoveryKey", yojson_of_string v)
           _object_.recoveryKey;
       ])

let server_createAccount_output_of_yojson json =
  let path_string = "com.atproto.server.createAccount#main/output" in
  match json with
  | `Assoc kvs ->
      let accessJwt, kvs =
        find_required_field path_string "accessJwt" kvs string_of_yojson
      in
      let refreshJwt, kvs =
        find_required_field path_string "refreshJwt" kvs string_of_yojson
      in
      let handle, kvs =
        find_required_field path_string "handle" kvs string_of_yojson
      in
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({accessJwt; refreshJwt; handle; did} : server_createAccount_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_createAccount_output
    (_object_ : server_createAccount_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.server.createAccount#main/output");
         Some ("accessJwt", yojson_of_string _object_.accessJwt);
         Some ("refreshJwt", yojson_of_string _object_.refreshJwt);
         Some ("handle", yojson_of_string _object_.handle);
         Some ("did", yojson_of_string _object_.did);
       ])

let server_createAppPassword_appPassword_of_yojson json =
  let path_string = "com.atproto.server.createAppPassword#appPassword" in
  match json with
  | `Assoc kvs ->
      let name, kvs =
        find_required_field path_string "name" kvs string_of_yojson
      in
      let password, kvs =
        find_required_field path_string "password" kvs string_of_yojson
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({name; password; createdAt} : server_createAppPassword_appPassword)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_createAppPassword_appPassword
    (_object_ : server_createAppPassword_appPassword) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.server.createAppPassword#appPassword");
         Some ("name", yojson_of_string _object_.name);
         Some ("password", yojson_of_string _object_.password);
         Some ("createdAt", yojson_of_string _object_.createdAt);
       ])

let server_createAppPassword_input_of_yojson json =
  let path_string = "com.atproto.server.createAppPassword#main/input" in
  match json with
  | `Assoc kvs ->
      let name, kvs =
        find_required_field path_string "name" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({name} : server_createAppPassword_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_createAppPassword_input
    (_object_ : server_createAppPassword_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.server.createAppPassword#main/input");
         Some ("name", yojson_of_string _object_.name);
       ])

let server_createInviteCode_input_of_yojson json =
  let path_string = "com.atproto.server.createInviteCode#main/input" in
  match json with
  | `Assoc kvs ->
      let useCount, kvs =
        find_required_field path_string "useCount" kvs int64_of_yojson
      in
      let forAccount, kvs =
        find_optional_field "forAccount" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({useCount; forAccount} : server_createInviteCode_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_createInviteCode_input
    (_object_ : server_createInviteCode_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.server.createInviteCode#main/input");
         Some ("useCount", yojson_of_int64 _object_.useCount);
         Option.map
           (fun v -> "forAccount", yojson_of_string v)
           _object_.forAccount;
       ])

let server_createInviteCode_output_of_yojson json =
  let path_string = "com.atproto.server.createInviteCode#main/output" in
  match json with
  | `Assoc kvs ->
      let code, kvs =
        find_required_field path_string "code" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({code} : server_createInviteCode_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_createInviteCode_output
    (_object_ : server_createInviteCode_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.server.createInviteCode#main/output");
         Some ("code", yojson_of_string _object_.code);
       ])

let server_createInviteCodes_accountCodes_of_yojson json =
  let path_string = "com.atproto.server.createInviteCodes#accountCodes" in
  match json with
  | `Assoc kvs ->
      let account, kvs =
        find_required_field path_string "account" kvs string_of_yojson
      in
      let codes, kvs =
        find_required_field
          path_string
          "codes"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({account; codes} : server_createInviteCodes_accountCodes)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_createInviteCodes_accountCodes
    (_object_ : server_createInviteCodes_accountCodes) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.server.createInviteCodes#accountCodes");
         Some ("account", yojson_of_string _object_.account);
         Some ("codes", (yojson_of_list yojson_of_string) _object_.codes);
       ])

let server_createInviteCodes_input_of_yojson json =
  let path_string = "com.atproto.server.createInviteCodes#main/input" in
  match json with
  | `Assoc kvs ->
      let codeCount, kvs =
        find_required_field path_string "codeCount" kvs int64_of_yojson
      in
      let useCount, kvs =
        find_required_field path_string "useCount" kvs int64_of_yojson
      in
      let forAccounts, kvs =
        find_optional_field "forAccounts" kvs (list_of_yojson string_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({codeCount; useCount; forAccounts} : server_createInviteCodes_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_createInviteCodes_input
    (_object_ : server_createInviteCodes_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.server.createInviteCodes#main/input");
         Some ("codeCount", yojson_of_int64 _object_.codeCount);
         Some ("useCount", yojson_of_int64 _object_.useCount);
         Option.map
           (fun v -> "forAccounts", (yojson_of_list yojson_of_string) v)
           _object_.forAccounts;
       ])

let server_createInviteCodes_output_of_yojson json =
  let path_string = "com.atproto.server.createInviteCodes#main/output" in
  match json with
  | `Assoc kvs ->
      let codes, kvs =
        find_required_field
          path_string
          "codes"
          kvs
          (list_of_yojson server_createInviteCodes_accountCodes_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({codes} : server_createInviteCodes_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_createInviteCodes_output
    (_object_ : server_createInviteCodes_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.server.createInviteCodes#main/output");
         Some
           ( "codes",
             (yojson_of_list yojson_of_server_createInviteCodes_accountCodes)
               _object_.codes );
       ])

let server_createSession_input_of_yojson json =
  let path_string = "com.atproto.server.createSession#main/input" in
  match json with
  | `Assoc kvs ->
      let identifier, kvs =
        find_required_field path_string "identifier" kvs string_of_yojson
      in
      let password, kvs =
        find_required_field path_string "password" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({identifier; password} : server_createSession_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_createSession_input (_object_ : server_createSession_input)
    =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.server.createSession#main/input");
         Some ("identifier", yojson_of_string _object_.identifier);
         Some ("password", yojson_of_string _object_.password);
       ])

let server_createSession_output_of_yojson json =
  let path_string = "com.atproto.server.createSession#main/output" in
  match json with
  | `Assoc kvs ->
      let accessJwt, kvs =
        find_required_field path_string "accessJwt" kvs string_of_yojson
      in
      let refreshJwt, kvs =
        find_required_field path_string "refreshJwt" kvs string_of_yojson
      in
      let handle, kvs =
        find_required_field path_string "handle" kvs string_of_yojson
      in
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let email, kvs = find_optional_field "email" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({accessJwt; refreshJwt; handle; did; email}
          : server_createSession_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_createSession_output
    (_object_ : server_createSession_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.server.createSession#main/output");
         Some ("accessJwt", yojson_of_string _object_.accessJwt);
         Some ("refreshJwt", yojson_of_string _object_.refreshJwt);
         Some ("handle", yojson_of_string _object_.handle);
         Some ("did", yojson_of_string _object_.did);
         Option.map (fun v -> "email", yojson_of_string v) _object_.email;
       ])

let server_deleteAccount_input_of_yojson json =
  let path_string = "com.atproto.server.deleteAccount#main/input" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let password, kvs =
        find_required_field path_string "password" kvs string_of_yojson
      in
      let token, kvs =
        find_required_field path_string "token" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did; password; token} : server_deleteAccount_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_deleteAccount_input (_object_ : server_deleteAccount_input)
    =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.server.deleteAccount#main/input");
         Some ("did", yojson_of_string _object_.did);
         Some ("password", yojson_of_string _object_.password);
         Some ("token", yojson_of_string _object_.token);
       ])

let server_describeServer_links_of_yojson json =
  let path_string = "com.atproto.server.describeServer#links" in
  match json with
  | `Assoc kvs ->
      let privacyPolicy, kvs =
        find_optional_field "privacyPolicy" kvs string_of_yojson
      in
      let termsOfService, kvs =
        find_optional_field "termsOfService" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({privacyPolicy; termsOfService} : server_describeServer_links)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_describeServer_links
    (_object_ : server_describeServer_links) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.server.describeServer#links");
         Option.map
           (fun v -> "privacyPolicy", yojson_of_string v)
           _object_.privacyPolicy;
         Option.map
           (fun v -> "termsOfService", yojson_of_string v)
           _object_.termsOfService;
       ])

let server_describeServer_output_of_yojson json =
  let path_string = "com.atproto.server.describeServer#main/output" in
  match json with
  | `Assoc kvs ->
      let inviteCodeRequired, kvs =
        find_optional_field "inviteCodeRequired" kvs bool_of_yojson
      in
      let availableUserDomains, kvs =
        find_required_field
          path_string
          "availableUserDomains"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let links, kvs =
        find_optional_field "links" kvs server_describeServer_links_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({inviteCodeRequired; availableUserDomains; links}
          : server_describeServer_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_describeServer_output
    (_object_ : server_describeServer_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.server.describeServer#main/output");
         Option.map
           (fun v -> "inviteCodeRequired", yojson_of_bool v)
           _object_.inviteCodeRequired;
         Some
           ( "availableUserDomains",
             (yojson_of_list yojson_of_string) _object_.availableUserDomains );
         Option.map
           (fun v -> "links", yojson_of_server_describeServer_links v)
           _object_.links;
       ])

let server_getAccountInviteCodes_output_of_yojson json =
  let path_string = "com.atproto.server.getAccountInviteCodes#main/output" in
  match json with
  | `Assoc kvs ->
      let codes, kvs =
        find_required_field
          path_string
          "codes"
          kvs
          (list_of_yojson server_inviteCode_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({codes} : server_getAccountInviteCodes_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_getAccountInviteCodes_output
    (_object_ : server_getAccountInviteCodes_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "com.atproto.server.getAccountInviteCodes#main/output" );
         Some
           ("codes", (yojson_of_list yojson_of_server_inviteCode) _object_.codes);
       ])

let server_getAccountInviteCodes_parameters_of_yojson json =
  let path_string =
    "com.atproto.server.getAccountInviteCodes#main/parameters"
  in
  match json with
  | `Assoc kvs ->
      let includeUsed, kvs =
        find_optional_field "includeUsed" kvs bool_of_yojson
      in
      let createAvailable, kvs =
        find_optional_field "createAvailable" kvs bool_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({includeUsed; createAvailable}
          : server_getAccountInviteCodes_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_getAccountInviteCodes_parameters
    (_object_ : server_getAccountInviteCodes_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "com.atproto.server.getAccountInviteCodes#main/parameters"
           );
         Option.map
           (fun v -> "includeUsed", yojson_of_bool v)
           _object_.includeUsed;
         Option.map
           (fun v -> "createAvailable", yojson_of_bool v)
           _object_.createAvailable;
       ])

let server_getSession_output_of_yojson json =
  let path_string = "com.atproto.server.getSession#main/output" in
  match json with
  | `Assoc kvs ->
      let handle, kvs =
        find_required_field path_string "handle" kvs string_of_yojson
      in
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let email, kvs = find_optional_field "email" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({handle; did; email} : server_getSession_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_getSession_output (_object_ : server_getSession_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.server.getSession#main/output");
         Some ("handle", yojson_of_string _object_.handle);
         Some ("did", yojson_of_string _object_.did);
         Option.map (fun v -> "email", yojson_of_string v) _object_.email;
       ])

let server_listAppPasswords_appPassword_of_yojson json =
  let path_string = "com.atproto.server.listAppPasswords#appPassword" in
  match json with
  | `Assoc kvs ->
      let name, kvs =
        find_required_field path_string "name" kvs string_of_yojson
      in
      let createdAt, kvs =
        find_required_field path_string "createdAt" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({name; createdAt} : server_listAppPasswords_appPassword)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_listAppPasswords_appPassword
    (_object_ : server_listAppPasswords_appPassword) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.server.listAppPasswords#appPassword");
         Some ("name", yojson_of_string _object_.name);
         Some ("createdAt", yojson_of_string _object_.createdAt);
       ])

let server_listAppPasswords_output_of_yojson json =
  let path_string = "com.atproto.server.listAppPasswords#main/output" in
  match json with
  | `Assoc kvs ->
      let passwords, kvs =
        find_required_field
          path_string
          "passwords"
          kvs
          (list_of_yojson server_listAppPasswords_appPassword_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({passwords} : server_listAppPasswords_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_listAppPasswords_output
    (_object_ : server_listAppPasswords_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.server.listAppPasswords#main/output");
         Some
           ( "passwords",
             (yojson_of_list yojson_of_server_listAppPasswords_appPassword)
               _object_.passwords );
       ])

let server_refreshSession_output_of_yojson json =
  let path_string = "com.atproto.server.refreshSession#main/output" in
  match json with
  | `Assoc kvs ->
      let accessJwt, kvs =
        find_required_field path_string "accessJwt" kvs string_of_yojson
      in
      let refreshJwt, kvs =
        find_required_field path_string "refreshJwt" kvs string_of_yojson
      in
      let handle, kvs =
        find_required_field path_string "handle" kvs string_of_yojson
      in
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({accessJwt; refreshJwt; handle; did} : server_refreshSession_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_refreshSession_output
    (_object_ : server_refreshSession_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.server.refreshSession#main/output");
         Some ("accessJwt", yojson_of_string _object_.accessJwt);
         Some ("refreshJwt", yojson_of_string _object_.refreshJwt);
         Some ("handle", yojson_of_string _object_.handle);
         Some ("did", yojson_of_string _object_.did);
       ])

let server_requestPasswordReset_input_of_yojson json =
  let path_string = "com.atproto.server.requestPasswordReset#main/input" in
  match json with
  | `Assoc kvs ->
      let email, kvs =
        find_required_field path_string "email" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({email} : server_requestPasswordReset_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_requestPasswordReset_input
    (_object_ : server_requestPasswordReset_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ( "$type",
             `String "com.atproto.server.requestPasswordReset#main/input" );
         Some ("email", yojson_of_string _object_.email);
       ])

let server_resetPassword_input_of_yojson json =
  let path_string = "com.atproto.server.resetPassword#main/input" in
  match json with
  | `Assoc kvs ->
      let token, kvs =
        find_required_field path_string "token" kvs string_of_yojson
      in
      let password, kvs =
        find_required_field path_string "password" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({token; password} : server_resetPassword_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_resetPassword_input (_object_ : server_resetPassword_input)
    =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.server.resetPassword#main/input");
         Some ("token", yojson_of_string _object_.token);
         Some ("password", yojson_of_string _object_.password);
       ])

let server_revokeAppPassword_input_of_yojson json =
  let path_string = "com.atproto.server.revokeAppPassword#main/input" in
  match json with
  | `Assoc kvs ->
      let name, kvs =
        find_required_field path_string "name" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({name} : server_revokeAppPassword_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_server_revokeAppPassword_input
    (_object_ : server_revokeAppPassword_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.server.revokeAppPassword#main/input");
         Some ("name", yojson_of_string _object_.name);
       ])

let sync_getBlob_parameters_of_yojson json =
  let path_string = "com.atproto.sync.getBlob#main/parameters" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let cid, kvs =
        find_required_field path_string "cid" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did; cid} : sync_getBlob_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_getBlob_parameters (_object_ : sync_getBlob_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.getBlob#main/parameters");
         Some ("did", yojson_of_string _object_.did);
         Some ("cid", yojson_of_string _object_.cid);
       ])

let sync_getBlocks_parameters_of_yojson json =
  let path_string = "com.atproto.sync.getBlocks#main/parameters" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let cids, kvs =
        find_required_field
          path_string
          "cids"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did; cids} : sync_getBlocks_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_getBlocks_parameters (_object_ : sync_getBlocks_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.getBlocks#main/parameters");
         Some ("did", yojson_of_string _object_.did);
         Some ("cids", (yojson_of_list yojson_of_string) _object_.cids);
       ])

let sync_getCheckout_parameters_of_yojson json =
  let path_string = "com.atproto.sync.getCheckout#main/parameters" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let commit, kvs = find_optional_field "commit" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did; commit} : sync_getCheckout_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_getCheckout_parameters
    (_object_ : sync_getCheckout_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.getCheckout#main/parameters");
         Some ("did", yojson_of_string _object_.did);
         Option.map (fun v -> "commit", yojson_of_string v) _object_.commit;
       ])

let sync_getCommitPath_output_of_yojson json =
  let path_string = "com.atproto.sync.getCommitPath#main/output" in
  match json with
  | `Assoc kvs ->
      let commits, kvs =
        find_required_field
          path_string
          "commits"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({commits} : sync_getCommitPath_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_getCommitPath_output (_object_ : sync_getCommitPath_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.getCommitPath#main/output");
         Some ("commits", (yojson_of_list yojson_of_string) _object_.commits);
       ])

let sync_getCommitPath_parameters_of_yojson json =
  let path_string = "com.atproto.sync.getCommitPath#main/parameters" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let latest, kvs = find_optional_field "latest" kvs string_of_yojson in
      let earliest, kvs = find_optional_field "earliest" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did; latest; earliest} : sync_getCommitPath_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_getCommitPath_parameters
    (_object_ : sync_getCommitPath_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.getCommitPath#main/parameters");
         Some ("did", yojson_of_string _object_.did);
         Option.map (fun v -> "latest", yojson_of_string v) _object_.latest;
         Option.map (fun v -> "earliest", yojson_of_string v) _object_.earliest;
       ])

let sync_getHead_output_of_yojson json =
  let path_string = "com.atproto.sync.getHead#main/output" in
  match json with
  | `Assoc kvs ->
      let root, kvs =
        find_required_field path_string "root" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({root} : sync_getHead_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_getHead_output (_object_ : sync_getHead_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.getHead#main/output");
         Some ("root", yojson_of_string _object_.root);
       ])

let sync_getHead_parameters_of_yojson json =
  let path_string = "com.atproto.sync.getHead#main/parameters" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did} : sync_getHead_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_getHead_parameters (_object_ : sync_getHead_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.getHead#main/parameters");
         Some ("did", yojson_of_string _object_.did);
       ])

let sync_getRecord_parameters_of_yojson json =
  let path_string = "com.atproto.sync.getRecord#main/parameters" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let collection, kvs =
        find_required_field path_string "collection" kvs string_of_yojson
      in
      let rkey, kvs =
        find_required_field path_string "rkey" kvs string_of_yojson
      in
      let commit, kvs = find_optional_field "commit" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did; collection; rkey; commit} : sync_getRecord_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_getRecord_parameters (_object_ : sync_getRecord_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.getRecord#main/parameters");
         Some ("did", yojson_of_string _object_.did);
         Some ("collection", yojson_of_string _object_.collection);
         Some ("rkey", yojson_of_string _object_.rkey);
         Option.map (fun v -> "commit", yojson_of_string v) _object_.commit;
       ])

let sync_getRepo_parameters_of_yojson json =
  let path_string = "com.atproto.sync.getRepo#main/parameters" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let earliest, kvs = find_optional_field "earliest" kvs string_of_yojson in
      let latest, kvs = find_optional_field "latest" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did; earliest; latest} : sync_getRepo_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_getRepo_parameters (_object_ : sync_getRepo_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.getRepo#main/parameters");
         Some ("did", yojson_of_string _object_.did);
         Option.map (fun v -> "earliest", yojson_of_string v) _object_.earliest;
         Option.map (fun v -> "latest", yojson_of_string v) _object_.latest;
       ])

let sync_listBlobs_output_of_yojson json =
  let path_string = "com.atproto.sync.listBlobs#main/output" in
  match json with
  | `Assoc kvs ->
      let cids, kvs =
        find_required_field
          path_string
          "cids"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cids} : sync_listBlobs_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_listBlobs_output (_object_ : sync_listBlobs_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.listBlobs#main/output");
         Some ("cids", (yojson_of_list yojson_of_string) _object_.cids);
       ])

let sync_listBlobs_parameters_of_yojson json =
  let path_string = "com.atproto.sync.listBlobs#main/parameters" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let latest, kvs = find_optional_field "latest" kvs string_of_yojson in
      let earliest, kvs = find_optional_field "earliest" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did; latest; earliest} : sync_listBlobs_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_listBlobs_parameters (_object_ : sync_listBlobs_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.listBlobs#main/parameters");
         Some ("did", yojson_of_string _object_.did);
         Option.map (fun v -> "latest", yojson_of_string v) _object_.latest;
         Option.map (fun v -> "earliest", yojson_of_string v) _object_.earliest;
       ])

let sync_listRepos_repo_of_yojson json =
  let path_string = "com.atproto.sync.listRepos#repo" in
  match json with
  | `Assoc kvs ->
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let head, kvs =
        find_required_field path_string "head" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({did; head} : sync_listRepos_repo)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_listRepos_repo (_object_ : sync_listRepos_repo) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.listRepos#repo");
         Some ("did", yojson_of_string _object_.did);
         Some ("head", yojson_of_string _object_.head);
       ])

let sync_listRepos_output_of_yojson json =
  let path_string = "com.atproto.sync.listRepos#main/output" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let repos, kvs =
        find_required_field
          path_string
          "repos"
          kvs
          (list_of_yojson sync_listRepos_repo_of_yojson)
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor; repos} : sync_listRepos_output)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_listRepos_output (_object_ : sync_listRepos_output) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.listRepos#main/output");
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
         Some
           ( "repos",
             (yojson_of_list yojson_of_sync_listRepos_repo) _object_.repos );
       ])

let sync_listRepos_parameters_of_yojson json =
  let path_string = "com.atproto.sync.listRepos#main/parameters" in
  match json with
  | `Assoc kvs ->
      let limit, kvs = find_optional_field "limit" kvs int64_of_yojson in
      let cursor, kvs = find_optional_field "cursor" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({limit; cursor} : sync_listRepos_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_listRepos_parameters (_object_ : sync_listRepos_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.listRepos#main/parameters");
         Option.map (fun v -> "limit", yojson_of_int64 v) _object_.limit;
         Option.map (fun v -> "cursor", yojson_of_string v) _object_.cursor;
       ])

let sync_notifyOfUpdate_input_of_yojson json =
  let path_string = "com.atproto.sync.notifyOfUpdate#main/input" in
  match json with
  | `Assoc kvs ->
      let hostname, kvs =
        find_required_field path_string "hostname" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({hostname} : sync_notifyOfUpdate_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_notifyOfUpdate_input (_object_ : sync_notifyOfUpdate_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.notifyOfUpdate#main/input");
         Some ("hostname", yojson_of_string _object_.hostname);
       ])

let sync_requestCrawl_input_of_yojson json =
  let path_string = "com.atproto.sync.requestCrawl#main/input" in
  match json with
  | `Assoc kvs ->
      let hostname, kvs =
        find_required_field path_string "hostname" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({hostname} : sync_requestCrawl_input)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_requestCrawl_input (_object_ : sync_requestCrawl_input) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.requestCrawl#main/input");
         Some ("hostname", yojson_of_string _object_.hostname);
       ])

let sync_subscribeRepos_repoOp_of_yojson json =
  let path_string = "com.atproto.sync.subscribeRepos#repoOp" in
  match json with
  | `Assoc kvs ->
      let action, kvs =
        find_required_field path_string "action" kvs string_of_yojson
      in
      let path, kvs =
        find_required_field path_string "path" kvs string_of_yojson
      in
      let cid, kvs =
        find_required_nullable_field path_string "cid" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({action; path; cid} : sync_subscribeRepos_repoOp)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_subscribeRepos_repoOp (_object_ : sync_subscribeRepos_repoOp)
    =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.subscribeRepos#repoOp");
         Some ("action", yojson_of_string _object_.action);
         Some ("path", yojson_of_string _object_.path);
         Some
           ( "cid",
             match _object_.cid with
             | None -> `Null
             | Some v -> yojson_of_string v );
       ])

let sync_subscribeRepos_commit_of_yojson json =
  let path_string = "com.atproto.sync.subscribeRepos#commit" in
  match json with
  | `Assoc kvs ->
      let seq, kvs =
        find_required_field path_string "seq" kvs int64_of_yojson
      in
      let rebase, kvs =
        find_required_field path_string "rebase" kvs bool_of_yojson
      in
      let tooBig, kvs =
        find_required_field path_string "tooBig" kvs bool_of_yojson
      in
      let repo, kvs =
        find_required_field path_string "repo" kvs string_of_yojson
      in
      let commit, kvs =
        find_required_field path_string "commit" kvs string_of_yojson
      in
      let prev, kvs =
        find_required_nullable_field path_string "prev" kvs string_of_yojson
      in
      let blocks, kvs =
        find_required_field path_string "blocks" kvs bytes_of_yojson
      in
      let ops, kvs =
        find_required_field
          path_string
          "ops"
          kvs
          (list_of_yojson sync_subscribeRepos_repoOp_of_yojson)
      in
      let blobs, kvs =
        find_required_field
          path_string
          "blobs"
          kvs
          (list_of_yojson string_of_yojson)
      in
      let time, kvs =
        find_required_field path_string "time" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else
        ({seq; rebase; tooBig; repo; commit; prev; blocks; ops; blobs; time}
          : sync_subscribeRepos_commit)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_subscribeRepos_commit (_object_ : sync_subscribeRepos_commit)
    =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.subscribeRepos#commit");
         Some ("seq", yojson_of_int64 _object_.seq);
         Some ("rebase", yojson_of_bool _object_.rebase);
         Some ("tooBig", yojson_of_bool _object_.tooBig);
         Some ("repo", yojson_of_string _object_.repo);
         Some ("commit", yojson_of_string _object_.commit);
         Some
           ( "prev",
             match _object_.prev with
             | None -> `Null
             | Some v -> yojson_of_string v );
         Some ("blocks", yojson_of_bytes _object_.blocks);
         Some
           ( "ops",
             (yojson_of_list yojson_of_sync_subscribeRepos_repoOp) _object_.ops
           );
         Some ("blobs", (yojson_of_list yojson_of_string) _object_.blobs);
         Some ("time", yojson_of_string _object_.time);
       ])

let sync_subscribeRepos_handle_of_yojson json =
  let path_string = "com.atproto.sync.subscribeRepos#handle" in
  match json with
  | `Assoc kvs ->
      let seq, kvs =
        find_required_field path_string "seq" kvs int64_of_yojson
      in
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let handle, kvs =
        find_required_field path_string "handle" kvs string_of_yojson
      in
      let time, kvs =
        find_required_field path_string "time" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({seq; did; handle; time} : sync_subscribeRepos_handle)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_subscribeRepos_handle (_object_ : sync_subscribeRepos_handle)
    =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.subscribeRepos#handle");
         Some ("seq", yojson_of_int64 _object_.seq);
         Some ("did", yojson_of_string _object_.did);
         Some ("handle", yojson_of_string _object_.handle);
         Some ("time", yojson_of_string _object_.time);
       ])

let sync_subscribeRepos_info_of_yojson json =
  let path_string = "com.atproto.sync.subscribeRepos#info" in
  match json with
  | `Assoc kvs ->
      let name, kvs =
        find_required_field path_string "name" kvs string_of_yojson
      in
      let message, kvs = find_optional_field "message" kvs string_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({name; message} : sync_subscribeRepos_info)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_subscribeRepos_info (_object_ : sync_subscribeRepos_info) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.subscribeRepos#info");
         Some ("name", yojson_of_string _object_.name);
         Option.map (fun v -> "message", yojson_of_string v) _object_.message;
       ])

let sync_subscribeRepos_tombstone_of_yojson json =
  let path_string = "com.atproto.sync.subscribeRepos#tombstone" in
  match json with
  | `Assoc kvs ->
      let seq, kvs =
        find_required_field path_string "seq" kvs int64_of_yojson
      in
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let time, kvs =
        find_required_field path_string "time" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({seq; did; time} : sync_subscribeRepos_tombstone)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_subscribeRepos_tombstone
    (_object_ : sync_subscribeRepos_tombstone) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.subscribeRepos#tombstone");
         Some ("seq", yojson_of_int64 _object_.seq);
         Some ("did", yojson_of_string _object_.did);
         Some ("time", yojson_of_string _object_.time);
       ])

let sync_subscribeRepos_migrate_of_yojson json =
  let path_string = "com.atproto.sync.subscribeRepos#migrate" in
  match json with
  | `Assoc kvs ->
      let seq, kvs =
        find_required_field path_string "seq" kvs int64_of_yojson
      in
      let did, kvs =
        find_required_field path_string "did" kvs string_of_yojson
      in
      let migrateTo, kvs =
        find_required_nullable_field
          path_string
          "migrateTo"
          kvs
          string_of_yojson
      in
      let time, kvs =
        find_required_field path_string "time" kvs string_of_yojson
      in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({seq; did; migrateTo; time} : sync_subscribeRepos_migrate)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_subscribeRepos_migrate
    (_object_ : sync_subscribeRepos_migrate) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some ("$type", `String "com.atproto.sync.subscribeRepos#migrate");
         Some ("seq", yojson_of_int64 _object_.seq);
         Some ("did", yojson_of_string _object_.did);
         Some
           ( "migrateTo",
             match _object_.migrateTo with
             | None -> `Null
             | Some v -> yojson_of_string v );
         Some ("time", yojson_of_string _object_.time);
       ])

let sync_subscribeRepos_message_of_yojson json =
  let path_string = "com.atproto.sync.subscribeRepos#main/message" in
  match json with
  | `Assoc kvs ->
      let type_, _rest =
        find_required_field path_string "$type" kvs string_of_yojson
      in
      (match type_ with
       | "com.atproto.sync.subscribeRepos#commit" ->
           Commit (sync_subscribeRepos_commit_of_yojson json)
       | "com.atproto.sync.subscribeRepos#handle" ->
           Handle (sync_subscribeRepos_handle_of_yojson json)
       | "com.atproto.sync.subscribeRepos#migrate" ->
           Migrate (sync_subscribeRepos_migrate_of_yojson json)
       | "com.atproto.sync.subscribeRepos#tombstone" ->
           Tombstone (sync_subscribeRepos_tombstone_of_yojson json)
       | "com.atproto.sync.subscribeRepos#info" ->
           Info (sync_subscribeRepos_info_of_yojson json)
       | _ -> fail_yojson path_string "Unexpected $type" json
        : sync_subscribeRepos_message)
  | json -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_subscribeRepos_message (union : sync_subscribeRepos_message)
    =
  match union with
  | Commit x -> yojson_of_sync_subscribeRepos_commit x
  | Handle x -> yojson_of_sync_subscribeRepos_handle x
  | Migrate x -> yojson_of_sync_subscribeRepos_migrate x
  | Tombstone x -> yojson_of_sync_subscribeRepos_tombstone x
  | Info x -> yojson_of_sync_subscribeRepos_info x

let sync_subscribeRepos_parameters_of_yojson json =
  let path_string = "com.atproto.sync.subscribeRepos#main/parameters" in
  match json with
  | `Assoc kvs ->
      let cursor, kvs = find_optional_field "cursor" kvs int64_of_yojson in
      let kvs = List.filter (function "$type", _ -> false | _ -> true) kvs in
      if kvs <> [] then
        fail_yojson
          path_string
          ("unexpected key(s): " ^ String.concat "," (List.map fst kvs))
          (`Assoc kvs)
      else ({cursor} : sync_subscribeRepos_parameters)
  | _ -> fail_yojson path_string "Assoc expected" json

let yojson_of_sync_subscribeRepos_parameters
    (_object_ : sync_subscribeRepos_parameters) =
  `Assoc
    (List.filter_map
       Fun.id
       [
         Some
           ("$type", `String "com.atproto.sync.subscribeRepos#main/parameters");
         Option.map (fun v -> "cursor", yojson_of_int64 v) _object_.cursor;
       ])
