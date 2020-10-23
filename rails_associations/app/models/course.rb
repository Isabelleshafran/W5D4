# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord

    has_many :enrollments, 
        foreign_key: :course_id,
        class_name: :Enrollment 

    has_many :enrolled_students,
        through: :enrollments,
        source: :user

    belongs_to :prereq,
        foreign_key: :prereq_id, 
        class_name: :Course
        # literally opposite on the same class name 

    belongs_to :instructor, # returns user
        foreign_key: :instructor_id,
        class_name: :User

        #in user we would have a has many taught courses in user 

end

#if a course has a column for a foreign key for another table 
#there must be a belongs to for those ids 