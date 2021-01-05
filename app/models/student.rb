class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(query)
    if query == ""
      @students = Student.all
    else
      @students = Student.where("name like ?", "%#{query}%")
    end
  end
end

# def self.search(query)
#   res = []
#   a = query.downcase
#   Student.all.each do |s|
#     if s.name.downcase == a
#       res << s
#     end
#   end
#   res
# end

# def self.search(query)
#   res = []
#   if query == ""
#     @student = Student.all
#   else
#     a = query.downcase
#     Student.all.each do |s|
#         if s.name.downcase == a
#           res << s
#         end
#     end
#   end
#   res
# end

