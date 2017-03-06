require "administrate/base_dashboard"

class BannerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo.with_options(searchable: true),
    id: Field::Number.with_options(searchable: false),
    start_date: Field::DateTime.with_options(searchable: false),
    end_date: Field::DateTime.with_options(searchable: false),
    location: Field::Text.with_options(searchable: false),
    headline: Field::Text.with_options(searchable: true),
    subcopy: Field::Text.with_options(searchable: true),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
    image: Field::String.with_options(searchable: false),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :id,
    :start_date,
    :end_date,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :id,
    :start_date,
    :end_date,
    :location,
    :headline,
    :subcopy,
    :created_at,
    :updated_at,
    :image,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :start_date,
    :end_date,
    :location,
    :headline,
    :subcopy,
    :image,
  ].freeze

  # Overwrite this method to customize how banners are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(banner)
  #   "Banner ##{banner.id}"
  # end
end
