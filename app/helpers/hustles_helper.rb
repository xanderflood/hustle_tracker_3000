module HustlesHelper
  def hustle_blob hustle
    return render partial: 'shared/blob', locals: {
      panel_id: "hustle_blob_#{hustle.id}",
      head_left: hustle.name,
      head_center: time_ago_in_words(hustle.modified),
      head_right: "#{hustle.total_points}",
      body: 'hustle',
      body_locals: { hustle: hustle }
    }
  end

  def deed_blob deed
    return render partial: 'shared/blob', locals: {
      panel_id: "deed_blob_#{deed.id}",
      head_left: truncate(deed.desc),
      head_center: "#{time_ago_in_words(deed.finished)} ago",
      head_right: "#{deed.points}",
      body: 'deed',
      body_locals: { deed: deed }
    }
  end
end
