# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  #if searching iterate over every student to find a match, else display all students
  # def self.search(query)
  #   if query.present?
  #     self.all.select do |s|
  #       s.name.downcase.include?(query.downcase)
  #     end
  #   else
  #     self.all
  #   end
  # end

  #query in ActiveRecord that follows the form: Student.where("name LIKE ?", "%M%")
  def self.search(query)
    if query
      where("LOWER(name) LIKE ?", "%#{query}%")
    else
      self.all
    end
  end
end
