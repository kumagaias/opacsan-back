# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([
  {
    id: 1,
    email: 'demo1@example.com',
    name: 'demo1',
    password_digest: '$2a$10$HjQH2VBdguACJLyZHoVSs.yBZbwypqY3vUJGnxlWj94rmilWIuWzK',
  },
  {
    id: 2,
    email: 'demo2@example.com',
    name: 'demo2',
    password_digest: '$2a$10$HjQH2VBdguACJLyZHoVSs.yBZbwypqY3vUJGnxlWj94rmilWIuWzK',
  },
  {
    id: 3,
    email: 'demo3@example.com',
    name: 'demo3',
    password_digest: '$2a$10$HjQH2VBdguACJLyZHoVSs.yBZbwypqY3vUJGnxlWj94rmilWIuWzK',
  }
])

Library.create!([
  {
    id: 1,
    name: 'demo-lib',
    register_user_id: 1,
  }
])

LibraryUser.create!([
  {
    id: 1,
    user_id: 1,
    library_id: 1,
    status: 1,
    role: 1,
  },
  {
    id: 2,
    user_id: 2,
    library_id: 1,
    status: 1,
    role: 1,
  },
  {
    id: 3,
    user_id: 3,
    library_id: 1,
    status: 0,
    role: 0,
  }
])
