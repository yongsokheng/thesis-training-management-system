namespace :db do
  desc "remake database data"
  task remake_data: :environment do
    Rake::Task["db:migrate:reset"].invoke
    puts "Creating User"
    Fabricate :user, email: "admin@tms.com", role: "admin"
    Fabricate :user, email: "supervisor@tms.com", role: "supervisor"
    5.times do
      Fabricate :user
    end
    puts "Creating subjects"
    5.times do
      Fabricate :subject
    end
    puts "Creating Coures"
    5.times do
      Fabricate :course
    end
  end
end
