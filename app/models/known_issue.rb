class KnownIssue < ApplicationRecord
  validates :test, uniqueness: {scope: [:runtime,:pr]}, presence: true
  validates :runtime, presence: true
  validates :pr, presence: true


  before_validation do
    self.test.strip!
    self.runtime.strip!
    self.pr.strip!
  end
end
