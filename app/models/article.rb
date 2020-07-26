class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user #campo adicional
    has_many :has_categories
    has_many :categoires, through: :has_categories
end
