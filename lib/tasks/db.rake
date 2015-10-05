namespace :db do
  desc "remake database data"
  task remake_data: :environment do
    Rake::Task["db:migrate:reset"].invoke
    puts "Creating User"
    Fabricate :user, email: "admin@tms.com", role: "admin"
    Fabricate :user, email: "supervisor@tms.com", role: "supervisor"
    15.times do
      Fabricate :user
    end
    puts "Creating Subject"
    10.times do |n|
      Fabricate :subject, name: "SJ0000#{n}"
    end
  end
end
