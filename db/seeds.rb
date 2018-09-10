# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Course.all.size >= 1000
  100.times do
    course = FactoryBot.create :course
    course.ratings << Array.new(rand(5)).map { FactoryBot.create :course_rating }
  end
end

100.times { FactoryBot.create :book } unless Book.all.size >= 1000
100.times { FactoryBot.create :past_exam } unless PastExam.all.size >= 1000
10.times { FactoryBot.create :event } unless Event.all.size >= 50
10.times { FactoryBot.create :bulletin } unless Bulletin.all.size >= 50

FactoryBot.create :test_user unless User.find_by_name(:test).present?
FactoryBot.create :admin_user unless User.find_by_name(:admin).present?
