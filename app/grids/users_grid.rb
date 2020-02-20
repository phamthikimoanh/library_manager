# frozen_string_literal: true

class UsersGrid
  include Datagrid
  # Scope
  scope do
    User
  end

  # Filters
  filter(:id, :string, multiple: ",")
  filter(:name, :string)
  filter(:phone, :string)
  filter(:address, :string)

  # Columns
  column(:id, mandatory: true)
  column(:name, mandatory: true)
  column(:phone, mandatory: true)
  column(:address, mandatory: true)
  column(:image, :html => true) do |asset|
    image_tag user.image.thumb.url.to_s
  end
  column(:actions, :html => true, :mandatory => true) do |record|
    #tự động vào trong view
    render :partial => "users/user", :object => record
  end
end
