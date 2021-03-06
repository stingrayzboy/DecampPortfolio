User.create(
	name:"Faraz Noor",
	email:"faraznoor75@gmail.com",
	password:"boomla1!",
	password_confirmation:"boomla1!",
	roles:"site_admin"
)
puts "Faraz created as an admin"

User.create(
	name:"Stingrayz Boy",
	email:"stingrayzboy@gmail.com",
	password:"boomla1!",
	password_confirmation:"boomla1!"
)
puts "Stingrayz Boy created as a guest user"
3.times do|topic|
	Topic.create!(
		title:"Topic #{topic+1}"
		)
end
puts "Created Topics"

10.times do |blog|
	Blog.create!(
		title:"My Post #{blog+1}",
		body:"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
		topic_id:Topic.last.id

	)
end

puts "10 blogs created"

5.times do |skill|
	Skill.create!(
		title:"Skill #{skill+1}",
		percent_utilized:20
	)
end

puts "5 skills created"


1.times do |portfolio|
	Portfolio.create!(
		title:"title #{portfolio+1}",
		subtitle:"Angular",
		body:"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
		main_image: "http://via.placeholder.com/600x400",
		thumb_image: "http://via.placeholder.com/350x200"
	)
end
8.times do |portfolio|
	Portfolio.create!(
		title:"title #{portfolio+1}",
		subtitle:"Ruby on Rails",
		body:"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
		main_image: "http://via.placeholder.com/600x400",
		thumb_image: "http://via.placeholder.com/350x200"
	)
end

puts "9 portfolio created"

3.times do |technology|
	Portfolio.last.technologies.create!(
		name:"Technology #{technology+1}"
		)
end
puts "Added 3 technologies on portfolio last"