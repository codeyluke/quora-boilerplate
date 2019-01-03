User.create(name: "James Mcgregor", email: "james@gmail.com", password: "password123")
User.create(name: "Justin TimGregor", email: "justin@gmail.com", password: "password123")
User.create(name:"Jack Lee", email: "jack@gmail.com", password: "password123")

Question.create(question: "What is life?", user_id: 1)
Question.create(question: "What is Ruby?", user_id: 1)
Question.create(question: "What is JavaScript?", user_id: 2)
Question.create(question: "What is Python?", user_id: 3)

Answer.create(answer: "Pyhthon is a snake", question_id: 4, user_id: 1)
Answer.create(answer: "Life is good", question_id: 1, user_id: 2)
Answer.create(answer: "Ruby is Rails", question_id: 2, user_id: 3)