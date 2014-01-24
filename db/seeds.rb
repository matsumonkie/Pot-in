# USER
iori = User.create!(firstname: "Iori",
                    lastname: "Matsuhara",
                    email: "matsuhar@gmail.com",
                    password: "12345678")
jack = User.create!(firstname: "Jack",
                    lastname: "Raiden",
                    email: "jack.raiden@gmail.com",
                    password: "12345678")
john = User.create!(firstname: "John",
                    lastname: "Doe",
                    email: "john.doe@gmail.com",
                    password: "12345678")

# RELATIONSHIP
Relationship.create!(user_id: jack.id,
                     relation_type: "friend",
                     contact_id: john.id)
