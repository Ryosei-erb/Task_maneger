class Task < ApplicationRecord
  #validates :name,presence: true , length: {maximum: 30}

  def self.ransackable_attributes(auth_object = nil)
    %w[name ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
