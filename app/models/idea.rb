class Idea < ActiveRecord::Base
    validates :deacription, :author, presence: true
end
