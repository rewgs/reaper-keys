return {
  track_motion = {
    ["G"] = "LastTrack",
    ["gg"] = "FirstTrack",
    ["J"] = "NextFolderNear",
    ["K"] = "PrevFolderNear",
    ["/"] = "MatchedTrackForward",
    ["?"] = "MatchedTrackBackward",
    ["n"] = "NextTrackMatchForward",
    ["N"] = "NextTrackMatchBackward",
    [":"] = "TrackWithNumber",
    ["j"] = "NextTrack",
    ["k"] = "PrevTrack",
    ["<C-b>"] = "Prev10Track",
    ["<C-f>"] = "Next10Track",
    ["<C-d>"] = "Next5Track",
    ["<C-u>"] = "Prev5Track",
  },
  visual_track_command = {
    ["V"] = "SetModeNormal",
    ["<C-h>"] = "NudgeTrackPanLeft",
    ["<C-l>"] = "NudgeTrackPanRight",
    ["<C-H>"] = "NudgeTrackPanLeft10Times",
    ["<C-L>"] = "NudgeTrackPanRight10Times",
  },
  track_selector = {
    ["'"] = "MarkedTracks",
    ["F"] = "FolderParent",
    ["F"] = "Folder",
    ["i"] = {"+inner", {
               ["c"] = "InnerFolder",
               ["f"] = "InnerFolderAndParent",
               ["g"] = "AllTracks",
    }},
  },
  track_operator = {
    ['"'] = {"+snapshots", {
        ['s'] = "SaveTracksToCurrentSnapshot",
        ["c"] = "CreateNewSnapshotWithTracks",
        ["d"] = "DeleteTracksFromCurrentSnapshot",
    }},
    ["z"] = "ZoomTrackSelection",
    ["<TAB>"] = "MakeFolder",
    ["d"] = "CutTrack",
    ["a"] = "ArmTracks",
    ["s"] = "SelectTracks",
    ["S"] = "ToggleSolo",
    ["M"] = "ToggleMute",
    ["y"] = "CopyTrack",
    ["<M-C>"] = "ColorTrackGradient",
    ["<M-c>"] = "ColorTrack",
  },
  timeline_operator = {
    ["s"] = "SelectItemsAndSplit",
    ["<M-p>"] = "CopyAndFitByLooping",
    ["<M-s>"] = "SelectEnvelopePoints",
    ["d"] = "CutItems",
    ["y"] = "CopyItems",
    ["<C-c>"] = "CopyItems",
    ["<M-d>"] = "CutEnvelopePoints",
    ["<M-y>"] = "CopyEnvelopePoints",
    ["<C-D>"] = "DeleteTimeline",
    ["g"] = "GlueItems",
    ["#"] = "SetItemFadeBoundaries",
    ["z"] = "ZoomTimeSelection",
    ["Z"] = "ZoomTimeAndTrackSelection",
    ["<M-a>"] = "InsertAutomationItem",
    ["c"] = {"+change/fit", {
               ["a"] = "InsertOrExtendMidiItem",
               ["c"] = "FitByLoopingNoExtend",
               ["f"] = "FitByLooping",
               ["p"] = "FitByPadding",
               ["s"] = "FitByStretching",
    }},
  },
  timeline_selector = {
    ["s"] = "SelectedItems",
  },
  timeline_motion = {
    ["<CM-l>"] = "NextTransientInItem",
    ["<CM-h>"] = "PrevTransientInItem",
    ["<CM-L>"] = "NextTransientInItemMinusFadeTime",
    ["<CM-H>"] = "PrevTransientInItemMinusFadeTime",
    ["B"] = "PrevBigItemStart",
    ["E"] = "NextBigItemEnd",
    ["W"] = "NextBigItemStart",
    ["b"] = "PrevItemStart",
    ["<M-b>"] = "PrevEnvelopePoint",
    ["e"] = "NextItemEnd",
    ["w"] = "NextItemStart",
    ["<M-w>"] = "NextEnvelopePoint",
    ["$"] = "LastItemEnd",
    ["("] = "TimeSelectionStart",
    [")"] = "TimeSelectionEnd",
  },
  command = {
    [">"] = "TrimItemRightEdge",
    ["<"] = "TrimItemLeftEdge",
    ["<TAB>"] = "CycleFolderCollapsedState",
    ["zp"] = "ZoomProject",
    ["D"] = "CutSelectedItems",
    ["Y"] = "CopySelectedItems",
    ["V"] = "SetModeVisualTrack",
    ["<M-j>"] = "NextEnvelope",
    ["<M-k>"] = "PrevEnvelope",
    ["<C-+>"] = "ZoomInVert",
    ["<C-->"] = "ZoomOutVert",
    ["+"] = "ZoomInHoriz",
    ["-"] = "ZoomOutHoriz",
    [";"] = "MoveItemToEditCursor",
    ["dd"] = "CutTrack",
    ["aa"] = "ArmTracks",
    ["O"] = "EnterTrackAbove",
    ["o"] = "EnterTrackBelow",
    ["p"] = "Paste",
    ["<C-v>"] = "Paste",
    ["yy"] = "CopyTrack",
    ["zz"] = "ScrollToSelectedTracks",
    ["%"] = "SplitItemsAtEditCursor",
    ["~"] = "MarkedTracks",
    ["<C-j>"] = "NudgeTrackVolumeDownBy1Tenth",
    ["<C-k>"] = "NudgeTrackVolumeUpBy1Tenth",
    ["<C-J>"] = "NudgeTrackVolumeDownBy1",
    ["<C-K>"] = "NudgeTrackVolumeUpBy1",
    ["<CM-j>"] = "ShiftEnvelopePointsDownATinyBit",
    ["<CM-k>"] = "ShiftEnvelopePointsUpATinyBit",
    ["<CM-J>"] = "ShiftEnvelopePointsDown",
    ["<CM-K>"] = "ShiftEnvelopePointsUp",
    ["<M-S>"] = "SelectItemsUnderEditCursor",
    ["'"] = "MarkedTracks",
  },
}