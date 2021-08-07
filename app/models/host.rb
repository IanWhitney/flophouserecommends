class Host < ApplicationRecord
  has_and_belongs_to_many :episodes
  has_many :recommendations

  def self.search(params)
    where(id: params)
      .or(where("name like ?", "%#{params}%"))
  end
end
