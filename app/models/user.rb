class User < ApplicationRecord
    has_many :gamesaves

    accepts_nested_attributes_for :gamesaves
end
