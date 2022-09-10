# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

web = Category.create(title: 'Web')
mobile = Category.create(title: 'Mobile')

patrick = User.create(first_name: 'Patrick', email: 'patrick@mail.ru', password: 'PaT12345')
eric = User.create(first_name: 'Eric', email: 'eric@yandex.ru', password: '123eRiC')
max = Admin.create(first_name: 'Max', last_name: 'Ko', email: 'max@ya.ru', password: 'max007')

ruby = web.tests.create!(title: 'Ruby', level: 1, author: max)
rails = web.tests.create!(title: 'Rails', level: 2, author: max)
kotlin = mobile.tests.create!(title: 'Kotlin', level: 2, author: max)

ruby.users.push(max)
rails.users.push(max)

question_1 = ruby.questions.create!(body: 'Чем отличаются переменные, начинающиеся с @, @@ и $?')
question_2 = rails.questions.create!(body: 'Что такое MVC?')
question_3 = kotlin.questions.create!(body: 'Что такое нулевая безопасность в Kotlin?')

answer_1 = question_1.answers.create(body: 'Областью действия', correct: true)
answer_2 = question_1.answers.create(body: 'Ничем')
answer_3 = question_2.answers.create(body: 'Model-View-Controller', correct: true)
answer_4 = question_2.answers.create(body: 'Minimal-Vailable-Construction')
answer_5 = question_3.answers.create(body: 'Защита от нуля', correct: true)
answer_6 = question_3.answers.create(body: 'Проблема безопасности языка')

