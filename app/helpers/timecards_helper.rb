module TimecardsHelper
  # 打刻画像表示用のヘルパー
  #
  # 手動作成による打刻を考慮させるためのもの
  def show_snapshot(snapshot)
    if @timecard.snapshot == 'noimage'
      content_tag(:p, '画像はありません(手動作成した打刻です)')
    else
      image_tag(snapshot, alt: '打刻画像')
    end
  end

  # 現在の週を選択候補として提示させる(timecards/new.html.haml)
  def select_from_week
    day = Time.zone.now.beginning_of_week
    weekdays = {}
    6.times do
      weekdays[day.to_formatted_s(:make_timecard)] = day.to_i
      day += 1.day
    end
    weekdays
  end
end
