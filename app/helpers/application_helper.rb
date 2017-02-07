module ApplicationHelper
  STATE_TERMS = {
    idea: :idea,
    active: :started,
    done: :finished
  }

  STATE_ORDER = {
    idea: 1,
    active: 0,
    done: 2
  }

  def hustle_blob hustle
    return render partial: 'shared/blob', locals: {
      panel_id: "hustle_blob_#{hustle.id}",
      head_left: truncate(hustle.name),
      head_center: time_ago_in_words(hustle.modified),
      head_right: "#{hustle.total_points}",
      body: 'shared/hustle',
      body_locals: { hustle: hustle }
    }
  end

  def deed_blob deed, open=false
    return render partial: 'shared/blob', locals: {
      head_class: "deed #{deed.state}",
      panel_id: "deed_blob_#{deed.id}",
      head_left: truncate(deed.desc),
      head_center: state_description(deed),
      head_right: "#{deed.points}",
      body: 'shared/deed',
      body_locals: { deed: deed },
      open: open
    }
  end

  def roll_blob roll, open=false
    return render partial: 'shared/blob', locals: {
      head_class: "roll",
      panel_id: "roll_blob_#{roll.id}",
      head_left: roll.name,
      head_right: roll_description(roll),
      body: 'shared/roll',
      body_locals: { roll: roll },
      open: open
    }
  end

  def ordered_deeds hustle
    ret = hustle.deeds.active.sort { |a,b| a.updated_at <=> b.updated_at }.reverse
    ret += hustle.deeds.idea.sort { |a,b| a.updated_at <=> b.updated_at }.reverse
    ret += hustle.deeds.done.sort { |a,b| a.updated_at <=> b.updated_at }.reverse
  end

  def state_description deed
    "#{STATE_TERMS[deed.state.to_sym]} #{time_ago_in_words(deed.when) } ago"
  end

  def roll_description roll
    "#{roll.total_points} of #{roll.total_value} points"
  end
end
