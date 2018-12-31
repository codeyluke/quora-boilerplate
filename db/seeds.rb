# User.create(name: "Malcolm Mcgregor", email: "mcgregor@gmail.com", password: "malcolm")
x = User.new(name: "Matthew Jack", email: "mattrodam@gmail.com", password: "malayan")
x.save
p x.errors