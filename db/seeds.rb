# USER
iori = User.create!(firstname: "Iori",
                    lastname: "Matsuhara",
                    email: "matsuhar@gmail.com",
                    password: "12345678")
jack = User.create!(firstname: "Jack",
                    lastname: "Raiden",
                    email: "jack.raiden@mail.com",
                    password: "12345678")
john = User.create!(firstname: "John",
                    lastname: "Doe",
                    email: "john.doe@mail.com",
                    password: "12345678")
# RELATIONSHIP
Relationship.create!(user_id: iori.id,
                     relation_type: "friend",
                     contact_id: john.id)
Relationship.create!(user_id: iori.id,
                     relation_type: "friend",
                     contact_id: jack.id)
# PURCHASES
Payment.create!(user_id: iori.id,
                contact_id: jack.id,
                amount: 10)
Payment.create!(user_id: iori.id,
                contact_id: jack.id,                 
                amount: 15)                 
Payment.create!(user_id: iori.id,
                contact_id: john.id,                 
                amount: 5)

# DEBTS
Payment.create!(user_id: jack.id,
                contact_id: iori.id,
                amount: 2)
Payment.create!(user_id: john.id,
                contact_id: iori.id,                 
                amount: 3)                 
Payment.create!(user_id: john.id,
                contact_id: iori.id,                 
                amount: 4)


