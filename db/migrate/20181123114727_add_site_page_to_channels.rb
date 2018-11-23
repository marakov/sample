class AddSitePageToChannels < ActiveRecord::Migration[5.2]
  def change
    add_column :channels, :site_page, :string
  end
end
