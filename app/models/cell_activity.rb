class CellActivity < ApplicationRecord
  belongs_to :cell
  has_many :agendas
  has_many :attendances
  accepts_nested_attributes_for :agendas, reject_if: :all_blank, allow_destroy: true
  has_many_attached :galleries, dependent: :destroy
  has_many_attached :reports, dependent: :destroy
end
