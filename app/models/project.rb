class Project < ApplicationRecord
  scope :proposed, -> { where(status: 'Proposed') }
  scope :accepted, -> { where(status: 'Accepted') }
  scope :under_review, -> { where(status: 'Under_review') }
end
