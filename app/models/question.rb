class Question < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :question_comments, dependent: :destroy
    def get_image
      if image.attached?
        image
      else
        'no_image.jpg'
      end
    end
    
    def get_image
      unless image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.jpg')
        iamge.attach(io:File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
        image.variant(resize_to_limit: [300, 300]).processed
    end
    
    
end
