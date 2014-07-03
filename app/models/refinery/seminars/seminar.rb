module Refinery
  module Seminars
    class Seminar < Refinery::Core::BaseModel
      self.table_name = 'refinery_seminars'

      extend FriendlyId
      friendly_id :name, :use => :slugged

      is_seo_meta if self.table_exists?

      acts_as_indexed :fields => [:name, :content]

      attr_accessible :name, :content, :active, :position

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
