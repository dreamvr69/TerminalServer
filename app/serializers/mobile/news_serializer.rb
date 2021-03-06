class Mobile::NewsSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :type, :aasm_state, :youtube_video_url, :publication_date,
             :is_on_slider, :sharing_url, :image_url, :image_thumb_url, :club_id, :show_in_app

  def image_url
    if @object.file.file.try(:size).present?
      @object.file.url
    else
      'default.png'
    end
  end

  def image_thumb_url
    if @object.file.file.try(:size).present?
      @object.file.url(:thumb)
    else
      'default.png'
    end
  end

end
