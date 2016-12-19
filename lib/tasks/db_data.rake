namespace :db do
  desc "remake database data"
  task rake_data: :environment do
    Rake::Task["db:migrate:reset"].invoke

    puts "Creating Role"
    ["admin", "trainer"].each do |name|
      Fabricate :role, name: name, allow_access_admin: true
    end
    Fabricate :role, name: "trainee", allow_access_admin: false

    puts "Creating User"
    User.create!([
      {name: "Nguyen Binh Dieu", avatar: File.open(File.join(Rails.root,
        "app/assets/images/user/Nguyen_Binh_Dieu.jpg")), role_id: 1,
        email: "admin@tms.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Mai Tuan Viet", avatar: File.open(File.join(Rails.root,
        "app/assets/images/user/Mai Tuan Viet.jpg")), role_id: 2,
        email: "supervisor@tms.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Truong Loc Binh", avatar: File.open(File.join(Rails.root,
        "app/assets/images/user/Truong Loc Binh.jpg")), role_id: 3,
        email: "truonglocbinh@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Vu Duc Luan", avatar: File.open(File.join(Rails.root,
        "app/assets/images/user/Vu Duc Luan.jpg")), role_id: 3,
        email: "vuducluan@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Ngo Van Thien ", avatar: File.open(File.join(Rails.root,
        "app/assets/images/user/Ngo Van Thien.jpg")), role_id: 3,
        email: "ngovanthie@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Ngo Van Duong", avatar: File.open(File.join(Rails.root,
        "app/assets/images/user/Ngo Van Duong.jpg")), role_id: 3,
        email: "ngovanduong@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Nguyen Thai Son", avatar: File.open(File.join(Rails.root,
        "app/assets/images/user/Nguyen Thai Son.jpg")), role_id: 3,
        email: "nguyenthaison@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Mai Dinh Phu ", avatar: File.open(File.join(Rails.root,
        "app/assets/images/user/Mai Dinh Phu.jpg")), role_id: 3,
        email: "maidinhphu@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Nguyen Van Hien", avatar: File.open(File.join(Rails.root,
        "app/assets/images/user/Nguyen Van Hien.jpg")), role_id: 3,
        email: "nguyenvanhien@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Nguyen Thi Trang", avatar: File.open(File.join(Rails.root,
        "app/assets/images/user/Nguyen Thi Trang.png")), role_id: 3,
        email: "nguyenthitrang@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Nguyen Thi Mo", avatar: File.open(File.join(Rails.root,
        "app/assets/images/user/Nguyen Thi Mo.jpg")), role_id: 3,
        email: "nguyenthimo@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Hoang Van Nam", avatar: File.open(File.join(Rails.root,
        "app/assets/images/user/Hoang Van Nam.jpg")), role_id: 3,
        email: "hoangvannam@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Du Thanh Hai", avatar: File.open(File.join(Rails.root,
        "app/assets/images/user/Bui Quoc Viet.jpg")), role_id: 3,
        email: "duthanhhai@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Mai Dinh Phi", avatar: File.open(File.join(Rails.root,
        "app/assets/images/user/Nguyen Tuan Trong.jpg")), role_id: 3,
        email: "maidinhphi@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Hoang Thi Linh", avatar: File.open(File.join(Rails.root,
        "app/assets/images/user/Hoang Thi Linh.jpg")), role_id: 3,
        email: "hoangthilinh@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Dinh Hoang Hai", avatar: nil, role_id: 3,
        email: "dinhhoanghai@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Nguyen Sinh", avatar: nil, role_id: 3,
        email: "nguyensinh@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Nguyen Tuan Trong", avatar: nil, role_id: 3,
        email: "nguyentuantrong@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Hoang Linh", avatar: nil, role_id: 3,
        email: "hoanglinh@gmail.com",  password: "12345678",
        password_confirmation: "12345678"},
      {name: "Truong Thi Thao", avatar: nil, role_id: 3,
        email: "truongthithao@gmail.com",  password: "12345678",
        password_confirmation: "12345678"},
      {name: "Can Van Nghi", avatar: nil, role_id: 3,
        email: "canvannghi@gmail.com",  password: "12345678",
        password_confirmation: "12345678"},
      {name: "Luu Binh", avatar: nil, role_id: 3,
        email: "luubinh@gmail.com",  password: "12345678",
        password_confirmation: "12345678"},
      {name: "Duong Phuong", avatar: nil, role_id: 3,
        email: "duongphuong@gmail.com",  password: "12345678",
        password_confirmation: "12345678"},
      {name: "Ha Linh", avatar: nil, role_id: 3,
        email: "halinh@gmail.com",  password: "12345678",
        password_confirmation: "12345678"},
      {name: "Ly Hoang Nam", avatar: nil, role_id: 3,
        email: "lyhoangnam@gmail.com",  password: "12345678",
        password_confirmation: "12345678"},
      {name: "Mai Thao", avatar: nil, role_id: 3,
        email: "maithao@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Dinh Phuong Linh", avatar: nil, role_id: 3,
        email: "dinhphuonglinh@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "Minh Phuong", avatar: nil, role_id: 3,
        email: "minhphuong@gmail.com", password: "12345678",
        password_confirmation: "12345678"},
      {name: "So khen", avatar: nil, role_id: 3,
        email: "sokhen@gmail.com",  password: "12345678",
        password_confirmation: "12345678"},
      {name: "Chenkim", avatar: nil, role_id: 3,
        email: "chenkim@gmail.com",  password: "12345678",
        password_confirmation: "12345678"},
      {name: "Kooru", avatar: nil, role_id: 3,
        email: "kooru@gmail.com",  password: "12345678",
        password_confirmation: "12345678"}
    ])

    puts "Creating Evaluation Template"
    ["Working days", "Number of task",
      "Implement with new techniques", "Git", "Rails basic",
      "Rails advance", "Coding convention", "Plus"].each do |name|
      Fabricate :evaluation_template, name: name
    end

    puts "Creating Permissions"
    ["Course", "CourseSubject", "Subject", "UserSubject"].each do |name|
      Fabricate :permission, model_class: name, action: "manage", role_id: 2
    end
    ["Course", "CourseSubject", "UserCourse", "Subject", "UserSubject", "Task",
      "UserTask", "User"].each do |name|
      Fabricate :permission, model_class: name, action: "read", role_id: 3
    end
    ["Task", "Feedback"].each do |name|
      Fabricate :permission, model_class: name, action: "create"
    end
    ["UserTask", "User", "Task"].each do |name|
      Fabricate :permission, model_class: name, action: "update", role_id: 3
    end

    puts "Create Rank"
    5.times do
      Fabricate :rank
    end

    puts "Create Universities"
    ["Vietnam National University, Hanoi", "Hanoi University of Science and Technology",
      "Foreign Trade University", "Hanoi University of Industry"].each do |name|
      Fabricate :university, name: name
    end

    puts "Create Programming Languages"
    ["Ruby", "PHP", "Android", "Java", "C"].each do |name|
      Fabricate :programming_language, name: name
    end

    puts "Create User Types"
    ["Intern", "VPG", "JPG", "New dev", "Tester"].each do |name|
      Fabricate :user_type, name: name
    end

    puts "Create Status"
    ["Inprogress", "Finish", "Prepare project", "Jointed project"].each do |name|
      Fabricate :status, name: name
    end

    puts "Create Course"
    Course.create!([
      {name: "Ruby on Rails 2016-07-01",
        image: File.open(File.join(Rails.root, "app/assets/images/course/Rails-1.png")),
        description: "Learn more Rails with this sequel to the infamous Rails for Zombies course. Increase your Ruby on Rails knowledge with even more zombie learning.",
        status: 1, programming_language_id: 1, start_date: "2016-07-01", end_date: "2016-08-01"},
      {name: "Ruby on Rails 2016-08-01",
        image: File.open(File.join(Rails.root, "app/assets/images/course/Rails-1.png")),
        description: "Learn more Rails with this sequel to the infamous Rails for Zombies course. Increase your Ruby on Rails knowledge with even more zombie learning.",
        status: 2, programming_language_id: 1, start_date: "2016-08-01", end_date: "2016-09-01"},

      {name: "Android 2016-08-01",
        image: File.open(File.join(Rails.root, "app/assets/images/Android.png")),
        description: "This tutorial will teach you basic Android programming and will also take you through some advance concepts related to Android application development.",
        status: 0, programming_language_id: 1, start_date: "2016-08-01", end_date: "2016-09-01"},

      {name: "Java 2016-08-01",
        image: File.open(File.join(Rails.root, "app/assets/images/Java.png")),
        description: "This reference will take you through simple and practical approach while learning Java Programming language.",
        status: 1, programming_language_id: 1, start_date: "2016-08-01", end_date: "2016-09-01"},

      {name: "PHP 2016-07-01",
        image: File.open(File.join(Rails.root, "app/assets/images/PHP.png")),
        description: "PHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages",
        status: 1, programming_language_id: 1, start_date: "2016-07-01", end_date: "2016-08-01"},
    ])

    puts "Create Subject"
    Subject.create!([
      {name: "Ruby on Rails Tutorial Book", image: File.open(File.join(Rails.root,
        "app/assets/images/subject/try-ruby.png")),
        description: "Learn the basic building blocks of Ruby, all in the browser.\r\n",
        content: "<p>Get an introduction to numbers, Strings, properties, and methods,&nbsp;
          Learn about conversions, arrays, variables, and more methods</p>\r\n", during_time: 12},
      {name: "Project 1 for Rails", image: File.open(File.join(Rails.root,
        "app/assets/images/subject/Rails-2.png")),
        description: "Start Project 1 for Ruby on Rails today.\r\n",
        content: "<p>Get an introduction to redmine, requirement, design database</p>\r\n", during_time: 12},
      {name: "Project 2 for Rails", image: File.open(File.join(Rails.root,
        "app/assets/images/Ruby.jpg")),
        description: "Start Project 1 for Ruby on Rails today.\r\n",
        content: "<p>Get an introduction to redmine, requirement, design database</p>\r\n", during_time: 12},

      {name: "Git Tutorial", image: File.open(File.join(Rails.root,
        "app/assets/images/subject/try-git.png")),
        description: "Start Git for your project today.\r\n",
        content: "<p>Get an introduction to github, code version management</p>\r\n", during_time: 12},

      {name: "Android Tutorial Book", image: File.open(File.join(Rails.root,
        "app/assets/images/Android.png")),
        description: "This tutorial will teach you basic Android programming and will also take you through some advance concepts related to Android application development.\r\n",
        content: "<p>Get an introduction to numbers, Strings, properties, and methods,&nbsp;
          Learn about conversions, arrays, variables, and more methods</p>\r\n", during_time: 12},
      {name: "Project 1 for Android", image: File.open(File.join(Rails.root,
        "app/assets/images/Android.png")),
        description: "Start Project 1 for Android today.\r\n",
        content: "<p>Get an introduction to redmine, requirement, design database</p>\r\n", during_time: 12},
      {name: "Project 2 for Android", image: File.open(File.join(Rails.root,
        "app/assets/images/Android.png")),
        description: "Start Project 2 for Android today.\r\n",
        content: "<p>Get an introduction to redmine, requirement, design database</p>\r\n", during_time: 12},

      {name: "Java Tutorial Book", image: File.open(File.join(Rails.root,
        "app/assets/images/Java.png")),
        description: "This reference will take you through simple and practical approach while learning Java Programming language.\r\n",
        content: "<p>Get an introduction to numbers, Strings, properties, and methods,&nbsp;
          Learn about conversions, arrays, variables, and more methods</p>\r\n", during_time: 12},
      {name: "Project 1 for Java", image: File.open(File.join(Rails.root,
        "app/assets/images/Java.png")),
        description: "Start Project 1 for Andriod today.\r\n",
        content: "<p>Get an introduction to redmine, requirement, design database</p>\r\n", during_time: 12},
      {name: "Project 2 for Java", image: File.open(File.join(Rails.root,
        "app/assets/images/Java.png")),
        description: "Start Project 2 for Andriod today.\r\n",
        content: "<p>Get an introduction to redmine, requirement, design database</p>\r\n", during_time: 12},

      {name: "PHP Tutorial Book", image: File.open(File.join(Rails.root,
        "app/assets/images/PHP.png")),
        description: "PHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages.\r\n",
        content: "<p>Get an introduction to numbers, Strings, properties, and methods,&nbsp;
          Learn about conversions, arrays, variables, and more methods</p>\r\n", during_time: 12},
      {name: "Project 1 for PHP", image: File.open(File.join(Rails.root,
        "app/assets/images/PHP.png")),
        description: "Start Project 1 for PHP today.\r\n",
        content: "<p>Get an introduction to redmine, requirement, design database</p>\r\n", during_time: 12},
      {name: "Project 2 for PHP", image: File.open(File.join(Rails.root,
        "app/assets/images/PHP.png")),
        description: "Start Project 2 for PHP today.\r\n",
        content: "<p>Get an introduction to redmine, requirement, design database</p>\r\n", during_time: 12},

    ])

    puts "Create Task Master"
    TaskMaster.create!([
      {name: "From zero to deploy",
        description: "Get an introduction to numbers, Strings, properties, and methods",
        subject_id: 1},
      {name: "A toy app",
        description: "Get an introduction to numbers, Strings, properties, and methods",
        subject_id: 1},
      {name: "Mostly static pages",
        description: "Get an introduction to numbers, Strings, properties, and methods",
        subject_id: 1},
      {name: "Rails-flavored Ruby",
        description: "Get an introduction to numbers, Strings, properties, and methods",
        subject_id: 1},
      {name: "Filling in the layout",
        description: "Get an introduction to numbers, Strings, properties, and methods",
        subject_id: 1},
      {name: "Modeling users",
        description: "Get an introduction to numbers, Strings, properties, and methods",
        subject_id: 1},
      {name: "Sign up",
        description: "Get an introduction to numbers, Strings, properties, and methods",
        subject_id: 1},
      {name: "Basic login",
        description: "Get an introduction to numbers, Strings, properties, and methods",
        subject_id: 1},
      {name: "Advanced login",
        description: "Get an introduction to numbers, Strings, properties, and methods",
        subject_id: 1},
      {name: "Updating, showing, and deleting users",
        description: "Get an introduction to numbers, Strings, properties, and methods",
        subject_id: 1},
      {name: "Account activation",
        description: "Get an introduction to numbers, Strings, properties, and methods",
        subject_id: 1},
      {name: "Password reset",
        description: "Get an introduction to numbers, Strings, properties, and methods",
        subject_id: 1},
      {name: "User microposts",
        description: "Get an introduction to numbers, Strings, properties, and methods",
        subject_id: 1},
      {name: "Following users",
        description: "Get an introduction to numbers, Strings, properties, and methods",
        subject_id: 1},

      {name: "Requirement understanding",
        description: "Get an introduction to project understanding", subject_id: 2},
      {name: "Design Database", description: "Start design database", subject_id: 2},

      {name: "Requirement understanding",
        description: "Get an introduction to project understanding", subject_id: 3},
      {name: "Design Database", description: "Start design database", subject_id: 3},

      {name: "Getting Started",
        description: "Get an introduction to project git", subject_id: 4},
      {name: "Git Basics",
        description: "Get an introduction to project git", subject_id: 4},
      {name: "Git Branching",
        description: "Get an introduction to project git", subject_id: 4},
      {name: "Git on the Server",
        description: "Get an introduction to project git", subject_id: 4},
      {name: "Distributed Git",
        description: "Get an introduction to project git", subject_id: 4},
      {name: "GitHub",
        description: "Get an introduction to project git", subject_id: 4},
      {name: "Git Tools",
        description: "Get an introduction to project git", subject_id: 4},
      {name: "Customizing Git",
        description: "Get an introduction to project git", subject_id: 4},
      {name: "Git and Other Systems",
        description: "Get an introduction to project git", subject_id: 4},
      {name: "Git Internals",
        description: "Get an introduction to project git", subject_id: 4},

      {name: "Introduction to Android",
        description: "Get an introduction to project git", subject_id: 5},

      {name: "Requirement understanding",
        description: "Get an introduction to project git", subject_id: 6},

      {name: "Requirement understanding",
        description: "Get an introduction to project git", subject_id: 7},

      {name: "Introduct to Java",
        description: "Get an introduction to project git", subject_id: 8},

      {name: "Requirement understanding",
        description: "Get an introduction to project git", subject_id: 9},

      {name: "Requirement understanding",
        description: "Get an introduction to project git", subject_id: 10},

      {name: "Introduction to PHP",
        description: "Get an introduction to project git", subject_id: 11},

      {name: "Requirement understanding",
        description: "Get an introduction to project git", subject_id: 12},

      {name: "Requirement understanding",
        description: "Get an introduction to project git", subject_id: 13},

    ])

    puts "Create Course Subject"
    CourseSubject.create!([
      {course_id: 1, subject_id: 1},
      {course_id: 1, subject_id: 4},
      {course_id: 1, subject_id: 2},
      {course_id: 1, subject_id: 3},

      {course_id: 2, subject_id: 1},
      {course_id: 2, subject_id: 4},
      {course_id: 2, subject_id: 2},
      {course_id: 2, subject_id: 3},

      {course_id: 3, subject_id: 5},
      {course_id: 3, subject_id: 4},
      {course_id: 3, subject_id: 6},
      {course_id: 3, subject_id: 7},

      {course_id: 4, subject_id: 8},
      {course_id: 4, subject_id: 4},
      {course_id: 4, subject_id: 9},
      {course_id: 4, subject_id: 10},

      {course_id: 5, subject_id: 11},
      {course_id: 5, subject_id: 4},
      {course_id: 5, subject_id: 12},
      {course_id: 5, subject_id: 13}
    ])

    puts "Creating UserCourse"
    UserCourse.create!([
      {active: true, user_id: 2, course_id: 1},
      {active: true, user_id: 3, course_id: 1},
      {active: true, user_id: 4, course_id: 1},
      {active: true, user_id: 5, course_id: 1},
      {active: true, user_id: 6, course_id: 1},
      {active: true, user_id: 7, course_id: 1},

      {active: false, user_id: 2, course_id: 2},
      {active: false, user_id: 8, course_id: 2},
      {active: false, user_id: 9, course_id: 2},
      {active: false, user_id: 10, course_id: 2},
      {active: false, user_id: 11, course_id: 2},
      {active: false, user_id: 12, course_id: 2},

      {active: false, user_id: 2, course_id: 3},
      {active: false, user_id: 13, course_id: 3},
      {active: false, user_id: 14, course_id: 3},
      {active: false, user_id: 15, course_id: 3},
      {active: false, user_id: 16, course_id: 3},
      {active: false, user_id: 17, course_id: 3},

      {active: false, user_id: 2, course_id: 4},
      {active: false, user_id: 18, course_id: 4},
      {active: false, user_id: 19, course_id: 4},
      {active: false, user_id: 20, course_id: 4},
      {active: false, user_id: 21, course_id: 4},
      {active: false, user_id: 22, course_id: 4},

      {active: false, user_id: 2, course_id: 5},
      {active: false, user_id: 23, course_id: 5},
      {active: false, user_id: 24, course_id: 5},
      {active: false, user_id: 25, course_id: 5},
      {active: false, user_id: 26, course_id: 4},
      {active: false, user_id: 27, course_id: 4},
    ])

    puts "Document"
    Document.create!([
      {name: "Ruby Books", content: "Rails.AntiPatterns.pdf",
        documentable_id: 1, documentable_type: "Subject"},
      {name: "Rails advance", content: "Rails.AntiPatterns.pdf",
        documentable_id: 2, documentable_type: "Subject"},
      {name: "Ruby + Git ", content: "Doan_task.odt",
        documentable_id: 1, documentable_type: "Course"},
      {name: "Git book", content: "Pro_git", documentable_id: 3,
        documentable_type: "Subject"},
      {name: "Git book ", content: "Pro_git", documentable_id: 2,
        documentable_type: "Course"}
    ])
  end
end
