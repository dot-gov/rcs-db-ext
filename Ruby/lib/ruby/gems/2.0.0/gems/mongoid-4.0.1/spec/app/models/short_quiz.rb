class ShortQuiz
  include Mongoid::Document
  include Mongoid::Timestamps::Created::Short
  field :name, type: String
end
