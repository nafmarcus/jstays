class Property < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode
  before_create :before_creating

  belongs_to	:user
  has_many :property_pics, dependent: :destroy
  has_many :available_dates, dependent: :destroy
  has_many :property_reviews, dependent: :destroy

  validates :title, :property_type, :sharing, :duration, :location,
            :address, :bedrooms, :sleeps, presence: true
  validates_presence_of :longitude, :latitude, :message => 'We could not locate your address in the way you entered it.'

  validate :rate_set

  scope :available_between, ->(from, to) { joins(:available_dates).where("available_dates.a_date between ? and ?", from, to).uniq}

  def display_rate
    duration == :short_term ? rate_daily_regular : rate_long_term
  end
  def rate_set
    if rate_daily_regular.blank? && rate_daily_high.blank? && rate_weekly_regular.blank? &&
       rate_weekly_high.blank? && rate_monthly_regular.blank? && rate_monthly_high.blank?
      errors.add(:rate_daily_regular, "Some rate must be included.")
    end
  end

  def available_date(date_string)
    AvailableDate.where(property_id: self.id).where(:a_date => date_string.to_date).first
  end
  private
  def before_creating
    self.expires = 3.months.from_now
  end
end
