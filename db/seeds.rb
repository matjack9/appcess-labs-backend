companies = [
  {
    name: "Google",
    website: "google.com",
    description: "lol",
    key: "google",
    admin_key: "googleadmin"
  },
  {
    name: "Apple",
    website: "apple.com",
    description: "a cooler phone is coming in 2 weeks ago",
    key: "apple",
    admin_key: "appleadmin"
  },
  {
    name: "Facebook",
    website: "facebook.com",
    description: "we have personality quizzes",
    key: "facebook",
    admin_key: "facebookadmin"
  },
  {
    name: "Mealpal",
    website: "mealpal.com",
    description: "lol customer service",
    key: "mealpal",
    admin_key: "mealpaladmin"
  }
]

schools = [
  {
    name: "Flatiron School",
    website: "flatironschool.com",
    fee: 100.00,
    turntime: 14,
    image_url: "https://pbs.twimg.com/profile_images/544985527997304833/0DNfZq49_400x400.png",
    key: "flatiron",
    admin_key: "flatironadmin"
  },
  {
    name: "Fullstack Academy",
    website: "fullstackacademy.com",
    fee: 14.00,
    turntime: 14,
    image_url: "https://yt3.ggpht.com/-jLyKiwCNOWE/AAAAAAAAAAI/AAAAAAAAAAA/1DjrGtTUobY/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg",
    key: "fullstack",
    admin_key: "fullstackadmin"
  },
  {
    name: "App Academy",
    website: "appacademy.io",
    fee: 13.00,
    turntime: 21,
    image_url: "https://course_report_production.s3.amazonaws.com/rich/rich_files/rich_files/2005/s300/logo-emblem-red-1000-1-.jpg",
    key: "appacademy",
    admin_key: "appacademyadmin"
  },
  {
    name: "General Assembly",
    website: "generalassemb.ly",
    fee: 2.75,
    turntime: 42,
    image_url: "https://pbs.twimg.com/profile_images/813584000082214912/5U3iZVs-_400x400.jpg",
    key: "generalassembly",
    admin_key: "generalassemblyadmin"
  }
]

students = {
  "Flatiron School" => [
    {
      email: "me", # "matt.jackson@flatironschool.com"
      first_name: "Matt",
      last_name: "Jackson",
      password_digest: BCrypt::Password.create('123'),
      is_admin: true
    },
    {
      email: "jonathan.mines@flatironschool.com",
      first_name: "Jonathan",
      last_name: "Mines",
      password_digest: BCrypt::Password.create('123')
    },
    {
      email: "alex.gutterman@flatironschool.com",
      first_name: "Alex",
      last_name: "Gutterman",
      password_digest: BCrypt::Password.create('123')
    }
  ],
  "Fullstack Academy" => [
    {
      email: "sk8rboi123@hotmail.com",
      first_name: "Otto",
      last_name: "Sweetname",
      password_digest: BCrypt::Password.create('123'),
      is_admin: true
    },
    {
      email: "molly@geocities.com",
      first_name: "Molly",
      last_name: "Weirdo",
      password_digest: BCrypt::Password.create('123')
    },
    {
      email: "jenius@outlook.com",
      first_name: "Smarty",
      last_name: "McFly",
      password_digest: BCrypt::Password.create('123')
    }
  ],
  "App Academy" => [
    {
      email: "derp@derp.com",
      first_name: "Derpina",
      last_name: "Derpee",
      password_digest: BCrypt::Password.create('123'),
      is_admin: true
    },
    {
      email: "chris@whatever.com",
      first_name: "Chris",
      last_name: "Cool",
      password_digest: BCrypt::Password.create('123')
    },
    {
      email: "sweeeet@aol.com",
      first_name: "Mindy",
      last_name: "Mormon",
      password_digest: BCrypt::Password.create('123')
    }
  ],
  "General Assembly" => [
    {
      email: "tom@myspace.com",
      first_name: "Tom",
      last_name: "Myspace",
      password_digest: BCrypt::Password.create('123'),
      is_admin: true
    },
    {
      email: "meh@meh.com",
      first_name: "Loser",
      last_name: "Meh",
      password_digest: BCrypt::Password.create('123')
    },
    {
      email: "lala@me.com",
      first_name: "Rose",
      last_name: "Red",
      password_digest: BCrypt::Password.create('123')
    }
  ]
}

contractors = {
  "Google" => [
    {
      email: "worldemperor@google.com",
      first_name: "Larry",
      last_name: "Page",
      password_digest: BCrypt::Password.create('123'),
      is_admin: true
    },
    {
      email: "worldczar@google.com",
      first_name: "Sergey",
      last_name: "Brin",
      password_digest: BCrypt::Password.create('123')
    }
  ],
  "Apple" => [
    {
      email: "steve2@apple.com",
      first_name: "Steve",
      last_name: "Jobs Jr",
      password_digest: BCrypt::Password.create('123'),
      is_admin: true
    },
    {
      email: "tim@apple.com",
      first_name: "Tim",
      last_name: "Cook",
      password_digest: BCrypt::Password.create('123')
    }
  ],
  "Facebook" => [
    {
      email: "mark@facebook.com",
      first_name: "Mark",
      last_name: "Zuckerberg",
      password_digest: BCrypt::Password.create('123'),
      is_admin: true
    },
    {
      email: "marky@facebook.com",
      first_name: "Mark",
      last_name: "Zuckerclone",
      password_digest: BCrypt::Password.create('123')
    }
  ],
  "Mealpal" => [
    {
      email: "trolol@mealpal.com",
      first_name: "Troll",
      last_name: "Hehe",
      password_digest: BCrypt::Password.create('123'),
      is_admin: true
    },
    {
      email: "hehe@mealpal.com",
      first_name: "Seymour",
      last_name: "But",
      password_digest: BCrypt::Password.create('123')
    }
  ],
  "No Company" => [
    {
      email: "normie@gmail.com",
      first_name: "Normie",
      last_name: "Person",
      password_digest: BCrypt::Password.create('123'),
      is_admin: true
    },
    {
      email: "hi@gmail.com",
      first_name: "Coolio",
      last_name: "Person",
      password_digest: BCrypt::Password.create('123'),
      is_admin: true
    }
  ]
}

projects = [
  {
    name: "Tasklister",
    description: "List tasks",
    user_stories: "User can list tasks",
    requirements: "Needs to be really good at task listing"
  },
  {
    name: "Library",
    description: "Really original books to libraries associations in an app",
    user_stories: "There are books and also libraries",
    requirements: "Beef?"
  }
]

flatiron_technologies = [
  "ruby on rails",
  "react",
  "redux",
  "bootstrap"
]

other_school_technologies = [
  "express",
  "react",
  "redux",
  "semantic"
]

schools.each do |school_info|
  school = School.create(school_info)

  students[school.name].each do |student_info|
    student = User.new(student_info)
    student.account = school
    student.save

    if school.name == "Flatiron School"
      flatiron_technologies.each do |tech|
        current_tech = Technology.find_or_create_by(name: tech)
        school.technologies << current_tech
        student.technologies << current_tech
      end
    else
      other_school_technologies.each do |tech|
        current_tech = Technology.find_or_create_by(name: tech)
        school.technologies << current_tech
        student.technologies << current_tech
      end
    end
  end
end

companies.each do |company_info|
  company = Company.create(company_info)

  contractors[company.name].each do |contractor_info|
    contractor = User.new(contractor_info)
    contractor.account = company
    contractor.save
  end

  projects.each do |project_info|
    project = Project.new(project_info)
    project.company = company
    project.save

    if [0,1].sample == 0 # simple randomization
      new_contract = Contract.new
      random_school = School.all.sample
      random_student = random_school.users.where(is_admin: false).sample

      new_contract.project = project
      new_contract.school = random_school
      new_contract.fee = random_school.fee
      new_contract.user = random_student
      new_contract.technologies << random_student.technologies.sample

      new_contract.save
      new_contract.set_times
    end
  end
end

contractors["No Company"].each do |contractor_info|
  company = Company.create({
    name: nil,
    website: nil,
    description: nil
  })

  contractor = User.new(contractor_info)
  contractor.account = company
  contractor.save

  projects.each do |project_info|
    project = Project.new(project_info)
    project.company = company
    project.save

    if [0,1].sample == 0 # simple randomization
      new_contract = Contract.new
      random_school = School.all.sample
      random_student = random_school.users.where(is_admin: false).sample

      new_contract.project = project
      new_contract.school = random_school
      new_contract.fee = random_school.fee
      new_contract.user = random_student
      new_contract.technologies << random_student.technologies.sample

      new_contract.save
      new_contract.set_times
    end
  end
end
