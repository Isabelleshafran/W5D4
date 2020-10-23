# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord

    has_many :enrollments, 
        foreign_key: :student_id, 
        class_name: :Enrollment

    has_many :enrolled_courses,
        through: :enrollments,
        source: :course
    # course of student linked through user_id and match up to some id in another
    # table, which resides in the enrollment table, so the connection is in
    # enrollment table ( user_id -> class_id )
    # User Table is connected to Course Table only through Enrollment Table

    
end


#every belongs usually a has many 

#start with a belongs to 