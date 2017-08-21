class Visualization
  include Mongoid::Document
  field :data, type: String
  field :vr_data, type: String
  field :creation_date, type: Time
end
