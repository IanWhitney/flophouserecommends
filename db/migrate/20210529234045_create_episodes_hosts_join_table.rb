class CreateEpisodesHostsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :episodes_hosts, id: false do |t|
      t.belongs_to :episode
      t.belongs_to :host
    end
  end
end
