# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{title: 'Web'}, {title: 'Mobile'}])

users = User.create([
  {name: 'Patrick', email: 'patrick@mail.ru', password: 'PaT12345', role: 'user'},
  {name: 'Eric', email: 'eric@yandex.ru', password: '123eRiC', role: 'admin'},
  {name: 'Admin', email: 'max@ya.ru', password: 'max007', role: 'admin'}
])

tests = Test.create([
  {title: 'Ruby', level: 1, category_id: Category.find_by(title: 'Web').id, author_id: User.find_by(name: 'Admin', role: 'admin').id},
  {title: 'Rails', level: 2, category_id: Category.find_by(title: 'Web').id, author_id: User.find_by(name: 'Admin', role: 'admin').id},
  {title: 'Kotlin', level: 2, category_id: Category.find_by(title: 'Mobile').id, author_id: User.find_by(name: 'Admin', role: 'admin').id}
])

questions = Question.create([
  {body: 'Чем отличаются переменные, начинающиеся с @, @@ и $?', test_id: Test.find_by(title: 'Ruby').id},
  {body: 'Что такое MVC?', test_id: Test.find_by(title: 'Rails').id},
  {body: 'Что такое нулевая безопасность в Kotlin?', test_id: Test.find_by(title: 'Kotlin').id}
])

answers = Answer.create([
  {body: 'Областью действия', correct: true, question_id: Question.find(1)},
  {body: 'Ничем', question_id: Question.find(1)},
  {body: 'Model-View-Controller', correct: true, question_id: Question.find(2)},
  {body: 'Minimal-Vailable-Construction', question_id: Question.find(2)},
  {body: 'Защита от нуля', correct: true, question_id: Question.find(3)},
  {body: 'проблема безопасности языка', question_id: Question.find(3)}
])

completed = CompletedTest.create([
  {user_id: User.find_by(name: 'Eric').id, test_id: Test.find_by(title: 'Ruby').id},
  {user_id: User.find_by(name: 'Eric').id, test_id: Test.find_by(title: 'Rails').id}
])

