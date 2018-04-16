companies = [
  {
    name: "Google",
    website: "google.com",
    description: "lol"
  },
  {
    name: "Apple",
    website: "apple.com",
    description: "a cooler phone is coming in 2 weeks ago"
  },
  {
    name: "Facebook",
    website: "facebook.com",
    description: "we have cool personality quizzes"
  },
  {
    name: "Mealpal",
    website: "mealpal.com",
    description: "we don't care about you"
  }
]

schools = [
  {
    name: "Flatiron School",
    website: "flatironschool.com",
    fee: 100.00,
    turntime: 14
  },
  {
    name: "Fullstack Academy",
    website: "fullstackacademy.com",
    fee: 14.00,
    turntime: 14
  },
  {
    name: "App Academy",
    website: "appacademy.io",
    fee: 13.00,
    turntime: 21
  },
  {
    name: "General Assembly",
    website: "generalassemb.ly",
    fee: 2.75,
    turntime: 42
  }
]

students = {
  "Flatiron School" => [
    {
      email: "me", # "matt.jackson@flatironschool.com"
      first_name: "Matt",
      last_name: "Jackson",
      password_digest: BCrypt::Password.create('123')
    },
    {
      email: "jonathan.mines@flatironschool.com",
      first_name: "Jonathan",
      last_name: "Mines",
      password_digest: BCrypt::Password.create('123')
    }
  ],
  "Fullstack Academy" => [
    {
      email: "sk8rboi123@hotmail.com",
      first_name: "Otto",
      last_name: "Sweetname",
      password_digest: BCrypt::Password.create('123')
    },
    {
      email: "molly@geocities.com",
      first_name: "Molly",
      last_name: "Weirdo",
      password_digest: BCrypt::Password.create('123')
    }
  ],
  "App Academy" => [
    {
      email: "derp@derp.com",
      first_name: "Derpina",
      last_name: "Derpee",
      password_digest: BCrypt::Password.create('123')
    },
    {
      email: "chris@whatever.com",
      first_name: "Chris",
      last_name: "Cool",
      password_digest: BCrypt::Password.create('123')
    }
  ],
  "General Assembly" => [
    {
      email: "tom@myspace.com",
      first_name: "Tom",
      last_name: "Myspace",
      password_digest: BCrypt::Password.create('123')
    },
    {
      email: "meh@meh.com",
      first_name: "Loser",
      last_name: "Meh",
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
      password_digest: BCrypt::Password.create('123')
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
      password_digest: BCrypt::Password.create('123')
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
      password_digest: BCrypt::Password.create('123')
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
      password_digest: BCrypt::Password.create('123')
    },
    {
      email: "butts@mealpal.com",
      first_name: "Seymour",
      last_name: "Butts",
      password_digest: BCrypt::Password.create('123')
    }
  ],
  "No Company" => [
    {
      email: "normie@gmail.com",
      first_name: "Normie",
      last_name: "Person",
      password_digest: BCrypt::Password.create('123')
    },
    {
      email: "hi@gmail.com",
      first_name: "Coolio",
      last_name: "Person",
      password_digest: BCrypt::Password.create('123')
    }
  ]
}

projects = [
  {
    name: "Tasklister",
    description: "list tasks",
    user_stories: "user lists tasks",
    requirements: "really good at task listing"
  },
  {
    name: "Library",
    description: "cool and original books to libraries associations",
    user_stories: "there are books and there are libraries",
    requirements: "beef"
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
      random_student = random_school.users.sample # eventually change to only non-admins

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
      random_student = random_school.users.sample # eventually change to only non-admins

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
