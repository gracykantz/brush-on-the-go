gracy = User.create(
    name: "Gracy Kantzabedian",
    email: "gracykantzabedian@gmail.com",
    password: "123456"
    )
    photo = Photo.create(user: user, remote_photo_url: "https://i.imgur.com/KXSQEfC.jpg")


shalini = User.create(
    name: "Shalini Verma",
    email: "shaliniverma@gmail.com",
    password: "123456"
    )
    photo = Photo.create(user: user, remote_photo_url: "https://i.imgur.com/gheZcFH.jpg")


ludvig = User.create(
    name: "Ludvig Londos",
    email: "ludviglondos@gmail.com",
    password: "123456"
    )
    photo = Photo.create(user: user, remote_photo_url: "https://i.imgur.com/uUgORdr.jpg")



product = Product.create(
  user: gracy,
  title: "Just your everyday normal toothbrush",
  description: "Looking for a normal toothbrush that cleans your teeth like most normal toothbrushes do? Well, you've come to the right place. Here you will find the MOST normal toothbrush. Nothing more normal than this toothbrush right here.",
  price: 500,
  rating: 3,
  location: "Helsingborg"
  )
  photo = Photo.create(product: product, remote_photo_url: "https://www.shared.com/content/images/2018/06/Tooth-brush-sink-2.jpg")



product = Product.create(
  user: gracy,
  title: "Electric Toothbrush",
  description: "Brushing your teeth is a lot of work. Take the work out of the morning and take care of your teeth at the same time. Borrow this amazing electric toothbrush today! The toothbrush heads are replaced once a month, as per suggestions from professional dentists. So, you know what you're getting is in the best condition.",
  price: 1500,
  rating: 5,
  location: "Helsingborg"
  )
  photo = Photo.create(product: product, remote_photo_url: "https://mondrian.mashable.com/uploads%252Fstory%252Fthumbnail%252F74299%252F6d0c31ab-51f1-4555-968c-365e53541bb0.png%252F950x534.png?signature=ZPltC6D81HOjfQo91L3YJXX43TM=&source=https%3A%2F%2Fblueprint-api-production.s3.amazonaws.com")



product = Product.create(
  user: gracy,
  title: "Couples Toothbrushes",
  description: "On a romantic getaway? Forgot your toothbrush? Don't let bad breath kill the mood! Come on down and borrow one of my lovely couples toothbrushes. Enjoy your honeymoon, and enjoy each others mouths.",
  price: 1500,
  rating: 3,
  location: "Helsingborg"
  )
  photo = Photo.create(product: product, remote_photo_url:"https://hips.hearstapps.com/ame-prod-goodhousekeeping-assets.s3.amazonaws.com/main/embedded/28844/toothbrushestouching.jpg?resize=480:*")



product = Product.create(
  user: gracy,
  title: "Clean Toothbrush",
  description: "Brand create Toothbrush that has hardly been used. Just recently opened the package.",
  price: 300,
  rating: 4,
  location: "Helsingborg"
  )
  photo = Photo.create(product: product, remote_photo_url: "https://a57.foxnews.com/a57.foxnews.com/media2.foxnews.com/thumbnails/i/081114/640/360/931/524/toothbrush_640.jpg?ve=1&tl=1")



product = Product.create(
  user: gracy,
  title: "Toothbrush with Toothpaste",
  description: "I know if you forgot your toothbrush you probably also forgot your toothpaste! Take this opportunity to borrow both a toothbrush and a tube of toothpaste so you can make sure your teeth are fresh and clean! Beware, the toothpaste contains nuts, if you have any allergies at all, please don't use this toothpaste.",
  price: 450,
  rating: 3,
  location: "Helsingborg"
  )
  photo = Photo.create(product: product, remote_photo_url: "https://lovelace-media.imgix.net/getty/75463653.jpg")



product = Product.create(
  user: gracy,
  title: "*~*~Multiple Toothbrushes~*~*",
  description: "Brand new multiple toothbrushes for larger groups. Visiting Helsingborg with a group of friends? Probably! Because Helsingborg is a HUGE city that a lot of people usually visit in large groups... So here's the perfect option for you! Hardly used, replaced often.",
  price: 2200,
  rating: 5,
  location: "Helsingborg"
  )
  photo = Photo.create(product: product, remote_photo_url: "https://images2.minutemediacdn.com/image/upload/c_crop,h_2136,w_3798,x_0,y_0/f_auto,q_auto,w_1100/v1554917006/shape/mentalfloss/56671-istock-186861121.jpg")



product = Product.create(
  user: gracy,
  title: "Toothbrush for Cleaning Teeth",
  description: "Need to clean your teeth? Probably! Clean them with my tooth brush!",
  price: 1000,
  rating: 3,
  location: "Helsingborg"
  )
  photo = Photo.create(product: product, remote_photo_url: "https://upload.wikimedia.org/wikipedia/commons/4/49/Toothpasteonbrush.jpg")



product = Product.create(
  user: gracy,
  title: "Three Toothbrushes",
  description: "Traveling to Helsingborg as a threesome? Forgot your toothbrush? Fear not fellow traveler! I have you covered with my amazing three toothbrushes! They're three individual colors so you can choose which toothbrush is yours.",
  price: 1700,
  rating: 4,
  location: "Helsingborg"
  )
  photo = Photo.create(product: product, remote_photo_url: "https://img.huffingtonpost.com/asset/5c9a891d2300006001ea015d.jpeg?ops=scalefit_720_noupscale")

product = Product.create(
  user: ludvig,
  title: "Toilet Toothbrush",
  description: "Need to clean your teeth? Great! Need to clean your toilet? Even better! I have the perfect toothbrush for you to clean your teeth AND your toilet! When you're done cleaning your toilet you can flush to clean the toothbrush and then clean your teeth immediately afterwards! Don't worry about the health risks, I'm a doctor and I'm willing to bet my license on this being completely hygenic.",
  price: 3000,
  rating: 1,
  location: "Lund"
  )
  photo = Photo.create(product: product, remote_photo_url: "https://i.dailymail.co.uk/i/pix/2014/02/19/article-2562688-1BA02DD800000578-240_634x849.jpg")



product = Product.create(
  user: ludvig,
  title: "The Jar of Brushes",
  description: "Come one, come all, to the jar of brushes! Pick your toothbrush from a jar! You never know what you're going to get! Some new, some old, but all at a very reasonable price!",
  price: 50,
  rating: 2,
  location: "Lund"
  )
  photo = Photo.create(product: product, remote_photo_url: "https://trashbackwards.files.wordpress.com/2012/03/jarobrushes.jpg")

product = Product.create(
  user: ludvig,
  title: "Hardly Used Toothbrush",
  description: "This is my own personal toothbrush. I've hardly used it, as you can see in the photo. I've only had it for about a year so it's still relatively new, and has a lot of time left in it.",
  price: 1300,
  rating: 1,
  location: "Lund"
  )
  Photo.create(product: product, remote_photo_url: "https://media.istockphoto.com/photos/old-toothbrush-picture-id655772538?k=6&m=655772538&s=612x612&w=0&h=RU3O8AeTS_EHooWeakx-uum7l5ZfFQh07JDI_XC-nxI=")



product = Product.create(
  user: ludvig,
  title: "Ol' Reliable",
  description: "You can always count on Ol' reliable to be there for you.",
  price: 150,
  rating: 2,
  location: "Lund"
  )
  photo = Photo.create(product: product, remote_photo_url: "https://reviewed-com-res.cloudinary.com/image/fetch/s--tj7qlrjy--/b_white,c_limit,cs_srgb,f_auto,fl_progressive.strip_profile,g_center,q_auto,w_642/https://reviewed-production.s3.amazonaws.com/attachment/ed8999ec3f154a69/How-Often-Should-I-Replace-Toothbrush.jpg")



product = Product.create(
  user: ludvig,
  title: "Multi-purpose toothbrush",
  description: "What could possibly be better than something that is capable of doing multiple things? This toothbrush has extremely hard bristles so it's great for cleaning the floor, your shoes, and also your teeth! Don't worry about your bleeding gums, it only makes you stronger.",
  price: 2700,
  rating: 1,
  location: "Lund"
  )
  photo = Photo.create(product: product, remote_photo_url: "http://www.wideearthmedia.com/physician-dentist/blog/wp-content/uploads/2014/06/Dirty-Toothbrush.jpg")



product = Product.create(
  user: ludvig,
  title: "Slightly Used Toothbrush",
  description: "This toothbrush is only a few years old, it still has a lot of life ahead of it!",
  price: 650,
  rating: 1,
  location: "Lund"
  )
  photo = Photo.create(product: product, remote_photo_url: "http://www.marinkanyc.com/wp-content/uploads/2010/10/toothbrush.jpg")


product = Product.create(
  user: shalini,
  title: "Sustainable Earth Friendly Toothbrush",
  description: "Do you love the planet? Do you love our earth that we live on? Then make sure to borrow these sustainable toothbrushes to save our earth even more! By borrowing toothbrushes we reduce our carbon footprint, but you can help even more!",
  price: 1000,
  rating: 4,
  location: "Malmö"
  )
  photo = Photo.create(product: product, remote_photo_url:"https://static1.squarespace.com/static/5a7b5e56268b965f425bd123/t/5b41f265575d1f7f898b2429/1531048597808/bogobrushinhand.jpg?format=500w")



product = Product.create(
  user: shalini,
  title: "Eco-friendly Toothbrushes",
  description: "Take care of our planet and your wallet with these eco-friendly toothbrushes. What better way to save the planet than with something you do every day?",
  price: 2300,
  rating: 4,
  location: "Malmö"
  )
  photo = Photo.create(product: product, remote_photo_url: "https://static1.squarespace.com/static/55df2b76e4b0b190f6db7eee/5636903ee4b03f82085c21a0/5b687ff303ce649b2d3da9a2/1537101671554/00100dPORTRAIT_00100_BURST20180806090029834_COVER.jpg?format=500w")



product = Product.create(
  user: shalini,
  title: "Charcoal tooth whitening",
  description: "Whiten your teeth while on vacation, while living sustainably! This sustainability friendly charcoal toothbrushes whiten your teeth and protect the planet at the same time.",
  price: 2900,
  rating: 4,
  location: "Malmö"
  )
  photo = Photo.create(product: product, remote_photo_url: "https://static1.squarespace.com/static/51446b7fe4b033f380361f23/5358fecce4b0859258eae1f8/52bbb451e4b0911754512975/1388033107560/524-003-750-1.jpg?format=500w")



product = Product.create(
  user: shalini,
  title: "Colorful Charcoal Toothbrushes NEW!",
  description: "In need of a new, not used toothbrush, but aren't able to go far? Don't worry I'll take care of you!",
  price: 2850,
  rating: 5,
  location: "Malmö"
  )
  photo = Photo.create(product: product, remote_photo_url:"https://ae01.alicdn.com/kf/HTB1bxpLQXXXXXcXaXXXq6xXFXXXx/4Pcs-Bamboo-Charcoal-Toothbrush-Oral-Dental-Care-Soft-Nano-Teeth-Brush-Set-Dental-Care-Soft-Charcoal.jpg_640x640.jpg")



product = Product.create(
  user: shalini,
  title: "Sustainable Charcoal Toothbrush",
  description: "This Oak toothbrush is the best toothbrush anyone could ask for. Charcoal adds whitening things to your teeth so your teeth will look good and you'll feel good about saving the planet!",
  price: 2500,
  rating: 4,
  location: "Malmö"
  )
  photo = Photo.create(product: product, remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/41NNRl6XXhL.jpg")



product = Product.create(
  user: shalini,
  title: "Soft Bamboo Wheat Toothbrush",
  description: "Sustainable toothbrush made of wheat and bamboo. Nothing to worry about as far as the environment goes. Always take care of people and planet!",
  price: 1869,
  rating: 4,
  location: "Malmö"
  )
  photo = Photo.create(product: product, remote_photo_url: "https://www.picclickimg.com/00/s/MTAwMFgxMDAw/z/yngAAOSw24RbKJOU/$_3.JPG")



product = Product.create(
  user: shalini,
  title: "Biodegradable Bamboo Charcoal Toothbrush",
  description: "You can borrow this toothbrush, but please don't throw it away! It has multiple uses. The fact that it's made with charcoal means it's self cleaning, and you don't have to worry about hygiene",
  price: 2456,
  rating: 5,
  location: "Malmö"
  )
  photo = Photo.create(product: product, remote_photo_url: "https://image.made-in-china.com/202f0j00CgmUNWaGblqb/100-Biodegradable-Bamboo-Charcoal-Toothbrush-for-Adult-Household.jpg")


puts "Seed is done!"


