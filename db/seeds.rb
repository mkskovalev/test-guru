# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

web = Category.create(title: 'Web')
mobile = Category.create(title: 'Mobile')

patrick = User.create(name: 'Patrick', email: 'patrick@mail.ru', password: 'PaT12345', role: 'user')
eric = User.create(name: 'Eric', email: 'eric@yandex.ru', password: '123eRiC', role: 'admin')
admin = User.create(name: 'Admin', email: 'max@ya.ru', password: 'max007', role: 'admin')

ruby = Test.create(title: 'Ruby', level: 1, category_id: web.id, author_id: admin.id)
rails = Test.create(title: 'Rails', level: 2, category_id: web.id, author_id: admin.id)
kotlin = Test.create(title: 'Kotlin', level: 2, category_id: mobile.id, author_id: admin.id)

question_1 = Question.create(body: 'Чем отличаются переменные, начинающиеся с @, @@ и $?', test_id: ruby.id)
question_2 = Question.create(body: 'Что такое MVC?', test_id: rails.id)
question_3 = Question.create(body: 'Что такое нулевая безопасность в Kotlin?', test_id: kotlin.id)

answer_1 = Answer.create(body: 'Областью действия', correct: true, question_id: question_1.id)
answer_2 = Answer.create(body: 'Ничем', question_id: question_1.id)
answer_3 = Answer.create(body: 'Model-View-Controller', correct: true, question_id: question_2.id)
answer_4 = Answer.create(body: 'Minimal-Vailable-Construction', question_id: question_2.id)
answer_5 = Answer.create(body: 'Защита от нуля', correct: true, question_id: question_3.id)
answer_6 = Answer.create(body: 'Проблема безопасности языка', question_id: question_3.id)

completed_1 = CompletedTest.create(user_id: eric.id, test_id: ruby.id)
completed_2 = CompletedTest.create(user_id: eric.id, test_id: rails.id)

