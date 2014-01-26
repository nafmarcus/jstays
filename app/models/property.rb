class Property < ActiveRecord::Base

  geocoded_by :full_address
  before_validation :geocode
  before_create :before_creating
  before_validation :set_empty_rates

  belongs_to :user
  has_many :property_pics, dependent: :destroy
  has_many :available_dates, dependent: :destroy
  has_many :property_reviews, dependent: :destroy

  validates :title, :property_type, :sharing, :duration, :country, :city,
            :address, :bedrooms, :sleeps, presence: true
  validates :zip, presence: true, if: "['USA'].include?(country)"
  validates_presence_of :longitude, :latitude, :message => ' - We could not locate your address. Please correct the formatting.'

  validate :rate_set

  scope :available_between, ->(from, to) { joins(:available_dates).where("available_dates.a_date between ? and ?", from, to).uniq }

  def full_address
    "#{address}, #{city} #{zip}, #{country}"
  end
  def display_rate
    if duration.to_sym == :short_term
      "#{rate_daily_regular.to_i} #{currency.upcase} daily"
    else
      "#{rate_long_term.to_i} #{currency.upcase} per month"
    end
  end

  def rate_set
    if duration.to_sym == :short_term && rate_daily_regular == 0
      errors.add(:rate_daily_regular, '- Please set a payment rate.')
    elsif duration.to_sym == :long_term && rate_long_term == 0
      errors.add(:rate_long_term, '- Please set a payment rate.')
    end
  end

  def available_date(date_string)
    AvailableDate.where(property_id: self.id).where(:a_date => date_string.to_date).first
  end

  private
  def before_creating
    self.expires = 3.months.from_now
  end

  def set_empty_rates
    self.rate_daily_regular ||= 0
    self.rate_daily_high ||= 0
    self.rate_weekly_regular ||= 0
    self.rate_weekly_high ||= 0
    self.rate_monthly_regular ||= 0
    self.rate_monthly_high ||= 0
    self.rate_long_term ||= 0
  end
end
