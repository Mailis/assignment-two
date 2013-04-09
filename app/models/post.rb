class Post < ActiveRecord::Base
  attr_accessible :content, :author_email, :name, :title, :tags_attributes

  validates :name,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  validates :author_email, :presence => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

 
  has_many :comments, :dependent => :destroy
  has_many :tags
 
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }


end
