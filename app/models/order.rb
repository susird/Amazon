class Order < ApplicationRecord
  belongs_to :order_status
  belongs_to :user

  has_many :order_items

  before_create :set_order_status


  before_save :update_subtotal

  def calculate_total
  	# order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  	self.order_items.collect { |oi| oi.product.price * oi.quantity }.sum
  end

  private

  	def set_order_status
  		self.order_status_id = 1
  	end

  	def update_total
  		# self[:subtotal] = subtotal
  		self.total = calculate_total
  	end

  # has_many :order_items
  # before_save :update_total
  # before_create :update_status

  # def calculate_total
  #   self.order_items.collect { |item| item.product.price * item.quantity }.sum
  # end

  # private

  #   def update_status
  #     if self.order_status_id == nil?
  #       self.order_status_id = 1
  #     end
  #   end

  #   def update_total
  #     self.total = calculate_total
  #   end
end
