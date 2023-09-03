# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(
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


Post.create!(
    [
        {
            body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus volutpat nisi eget fringilla tristique. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed tempor fringilla dignissim. Suspendisse tristique erat in massa convallis mollis. Etiam purus augue, convallis non porttitor id, lobortis sit amet velit. Proin malesuada orci in ultrices imperdiet. Quisque ornare nisi at justo aliquet condimentum. Cras sit amet leo eget arcu elementum ornare. ",
            user_id: 1
        },
        {
            body: "Vivamus vel pellentesque nunc. Nullam vitae elit vel turpis sagittis mollis et suscipit lacus. Phasellus laoreet consectetur tortor, quis cursus diam suscipit id. Vivamus non facilisis nisi. Donec sed magna nec justo ultrices placerat. Mauris lobortis, enim lacinia facilisis vulputate, nisi elit vestibulum leo, ut mattis nisi arcu vitae turpis. Vestibulum in leo aliquam, egestas lorem quis, venenatis quam. ",
            user_id: 2
        },
        {
            body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus volutpat nisi eget fringilla tristique. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed tempor fringilla dignissim. Suspendisse tristique erat in massa convallis mollis. Etiam purus augue, convallis non porttitor id, lobortis sit amet velit. Proin malesuada orci in ultrices imperdiet. Quisque ornare nisi at justo aliquet condimentum. Cras sit amet leo eget arcu elementum ornare. ",
            user_id: 1
        },
        {
            body: "Vivamus vel pellentesque nunc. Nullam vitae elit vel turpis sagittis mollis et suscipit lacus. Phasellus laoreet consectetur tortor, quis cursus diam suscipit id. Vivamus non facilisis nisi. Donec sed magna nec justo ultrices placerat. Mauris lobortis, enim lacinia facilisis vulputate, nisi elit vestibulum leo, ut mattis nisi arcu vitae turpis. Vestibulum in leo aliquam, egestas lorem quis, venenatis quam. ",
            user_id: 2
        }
    ]
)