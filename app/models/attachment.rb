class Attachment < ApplicationRecord

    belongs_to :user
    
    class ImageAttachment < Attachment
    end
end
