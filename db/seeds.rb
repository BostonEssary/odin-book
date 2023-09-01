# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(
    [
        {
            email: "boston@boston.com",
            password: "password",
            name: "Boston",
            location: "Casa Grande, AZ",
            bio: "Just a guy trying to be a dude. Love hip-hop and computers."
        },
        {
            email: "cassie@cassie.com",
            password: "password",
            name: "Cassie",
            location: "Casa Grande, AZ",
            bio: "Heeeeyyyyyy! I'm Cassie aka CassietoCold aka Cas aka that queen. I love to dance, paint, stream and Post Malone!"
        }
    ]
)