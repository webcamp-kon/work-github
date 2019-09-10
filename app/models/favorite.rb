class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :product
  #    include Discard::Model
  # default_scope -> { joins(:post).merge(Post.kept) }
end
