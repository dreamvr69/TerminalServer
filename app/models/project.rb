class Project
  include Mongoid::Document

  belongs_to :user
  
  field :name
  field :begin, type: DateTime
  field :end, type: DateTime

end
