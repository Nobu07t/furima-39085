class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :Scheduled_delivery

#  商品画像を1枚つけることが必須であること
  validates :image, presence: true

#  商品名が必須であること
  validates :name, presence: true

#  商品の説明が必須であること
  validates :info, presence: true

#  カテゴリーのIDが1以外であること
  validates :category_id, numericality: { other_than: 1 }

#  商品の状態のIDが1以外であること。
  validates :sales_status_id, numericality: { other_than: 1 }

#  配送料のIDが1以外であること。
  validates :shipping_fee_status_id, numericality: { other_than: 1 }

#  発送元の地域のIDが1以外であること。
  validates :prefecture_id, numericality: { other_than: 1 }

#  発送までの日数のIDが1以外であること。
  validates :scheduled_delivery_id, numericality: { other_than: 1 }

#  価格の情報が必須であること。
  validates :price, presence: true

#  価格は半角数値かつ、¥300~¥9,999,999の間のみ保存可能であること。
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
  format: { with: /\A[0-9]+\z/ }
  
end
