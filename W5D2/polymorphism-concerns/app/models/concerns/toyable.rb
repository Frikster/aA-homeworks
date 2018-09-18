module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    toy = Toy.find_or_create_by(name: name)
    # I dunno why this doesn't work and the solution
    # using self.toy doesn't make sense (or work) either
  end
end
