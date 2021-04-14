class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '恋愛・結婚' },
    { id: 2, name: 'お金・法律' },
    { id: 3, name: '人間関係' },
    { id: 4, name: '仕事・キャリア' },
    { id: 5, name: '健康・メンタルヘルス' },
    { id: 6, name: '家庭・家族' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :problems

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end
  
  def self.ransackable_associations(auth_object = nil)
    %w[]
  end
end
