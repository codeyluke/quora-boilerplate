User.create(name: "Malcolm Mcgregor", email: "mcgregor@gmail.com", password: "password123")
User.create(name: "Matthew Jack", email: "mattrodam@gmail.com", password: "password123")
User.create(name:"Jack Lee", email: "jack@gmail.com", password: "password123")

Question.create(question: "What is life?", user_id: 1)
Question.create(question: "What is JavaScript?", user_id: 2)
Question.create(question: "What is Python?", user_id: 3)