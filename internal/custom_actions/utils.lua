local utils = {}

function mergeItemPositionsLists(item_positions_list)
  local merged_list = {}

  function areRemainingItems()
    for i,item_positions in ipairs(item_positions_list) do
      if #item_positions_list[i] ~= 0 then
        return true
      end
    end
    return false
  end

  while areRemainingItems() do
    local next_item = nil
    for i,item_positions in ipairs(item_positions_list) do
      local next_item_for_this_list = item_positions[1]
      if next_item_for_this_list then
        if not next_item or next_item_for_this_list.left < next_item.left then
          next_item = next_item_for_this_list
          selected_list_i = i
        end
      end
    end

    table.insert(merged_list, next_item)
    table.remove(item_positions_list[selected_list_i], 1)
  end

  return merged_list
end


function getItemPositionsOnTracks(tracks)
  local item_positions_lists = {}
  for i=1,#tracks do
    local current_track = tracks[i]
    local item_positions = {}
    local num_items_on_track = reaper.GetTrackNumMediaItems(current_track)

    for j=1,num_items_on_track do
      local item = reaper.GetTrackMediaItem(current_track, j-1)
      local start = reaper.GetMediaItemInfo_Value(item, "D_POSITION")
      local length = reaper.GetMediaItemInfo_Value(item, "D_LENGTH")
      item_positions[j] = {left=start, right=start+length}
    end

    item_positions_lists[i] = item_positions
  end

  local merged_list = mergeItemPositionsLists(item_positions_lists)
  return merged_list
end

function utils.getItemPositionsOnSelectedTracks()
  local selected_tracks = {}
  for i=0,reaper.CountSelectedTracks() do
    selected_tracks[i] = reaper.GetSelectedTrack(0, i-1)
  end

  return getItemPositionsOnTracks(selected_tracks)
end

function utils.getBigItemPositionsOnSelectedTracks()
  local item_positions = utils.getItemPositionsOnSelectedTracks()
  local big_item_positions = {}

  if #item_positions == 0 then
    return big_item_positions
  end

  local j = 1
  big_item_positions[j] = item_positions[1]
  for i=1,#item_positions do
    local next_item = item_positions[i]
    local current_big_item = big_item_positions[j]
    if next_item.left <= current_big_item.right and next_item.right > current_big_item.right then
       current_big_item.right = next_item.right
       big_item_positions[j] = current_big_item
    end

    if next_item.left > current_big_item.right then
      j = j + 1
      big_item_positions[j] = next_item
    end
  end

  return big_item_positions
end

function utils.getProjectEnd()
  local all_tracks = {}
  for i=0,reaper.GetNumTracks()-1 do
    all_tracks[i] = reaper.GetTrack(0, i)
  end

  local all_items_positions = getItemPositionsOnTracks(all_tracks)
  local furthest_item_end = 0
  for _,item_position in ipairs(all_items_positions) do
    if item_position.right > furthest_item_end then
      furthest_item_end = item_position.right
    end
  end

  return furthest_item_end
end

function utils.selectRegion(id)
  local ok, is_region, start_pos, end_pos, _, got_id = reaper.EnumProjectMarkers(id)
  if ok and is_region  then
    reaper.GetSet_LoopTimeRange(true, false, start_pos, end_pos, false)
    return true
  end
  return false
end

function utils.getMatchedTrack(search_name, forward)
  if not search_name then
    return nil
  end

  local current_track = reaper.GetSelectedTrack(0, 0)
  local start_i = 0
  if current_track then
    start_i = reaper.GetMediaTrackInfo_Value(current_track, "IP_TRACKNUMBER") - 1
  end

  local num_tracks = reaper.GetNumTracks()
  local tracks_searched = 1
  local next_track_i = start_i
  while tracks_searched < num_tracks do
    if forward == true then
      next_track_i = next_track_i + 1
    else
      next_track_i = next_track_i - 1
    end

    local track = reaper.GetTrack(0, next_track_i)
    if not track then
      if forward == true then
        next_track_i = -1
      else
        next_track_i = num_tracks
      end
    else
      local _, current_name = reaper.GetTrackName(track, "")
      local has_no_name = current_name:match("Track ([0-9]+)", 1)
      tracks_searched = tracks_searched + 1
      if not has_no_name and current_name:match(search_name) then
        return track
      end
    end
  end

  return nil
end


return utils
