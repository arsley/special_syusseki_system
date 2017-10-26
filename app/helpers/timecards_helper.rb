module TimecardsHelper
  # 打刻画像表示用のヘルパー
  #
  # 手動作成による打刻を考慮させるためのもの
  def show_snapshot(snapshot)
    if @timecard.snapshot == 'noimage'
      content_tag(:p, '画像はありません(手動作成した打刻です)')
    else
      content_tag(:img, src: snapshot)
    end
  end
end
