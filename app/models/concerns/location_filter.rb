module LocationFilter
  extend ActiveSupport::Concern

  included do
    scope :cities, -> { pluck(:city).uniq.compact.reject(&:blank?) }
    scope :by_city, -> (city) { where(city: city) }

    scope :countries, -> { pluck(:country).uniq.compact.reject(&:blank?) }
    scope :by_country, -> (country) { where(country: country) }
  end

  def country_name
    ISO3166::Country[country].name if country.present?
  end

end