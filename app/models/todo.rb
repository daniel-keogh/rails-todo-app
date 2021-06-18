class Todo < ActiveRecord::Base
  
  # Make category name titlecase before saving
  # Reference -- https://stackoverflow.com/questions/5083084/rails-force-field-uppercase-and-validate-uniquely
  before_save :titleize_category
  
  def titleize_category
    unless self[:category].nil? 
     self[:category] = category.titleize
    end
  end

  def self.all_statuses
    ['Due', 'In Progress', 'Done']
  end
    
  def self.with_status(status)
    if status.nil?
      all
    end
    where(status: status)
  end
    
  def self.where_category(category)
    if category.nil? || category.empty?
      return nil
    end
    where(category: category)
  end
end
