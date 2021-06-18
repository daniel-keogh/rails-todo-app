# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

todos = [
    { 
        title: 'Do laundry',
        description: '',
        status: 'Done',
        category: '', 
        due_date: '6-Apr-2021'
    },
    { 
        title: 'Do dishes',
        description: "They're piling up",
        status: 'Due',
        category: '',
        due_date: '28-Apr-2021'
    },
    { 
        title: 'Pick up milk',
        description: "We're almost out",
        status: 'Due',
        category: '', 
        due_date: '30-Apr-2021'
    },
    { 
        title: 'Call dad',
        description: "It's been a while",
        status: 'Done',
        category: 'Personal', 
        due_date: '20-Apr-2021'
    },
    { 
        title: 'Learn Ruby',
        description: '',
        status: 'In Progress',
        category: 'College', 
        due_date: '29-Apr-2021'
    },
    { 
        title: 'Do assignment',
        description: "It's due soon",
        status: 'In Progress',
        category: 'College',
        due_date: '5-May-2021'
    }
]

todos.each do |todo|
    Todo.create!(todo)
end
