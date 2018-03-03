10.times do |blog|
	Blog.create!(
		title:"My Post #{blog+1}",
		body:"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."
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


9.times do |portfolio|
	Portfolio.create!(
		title:"title #{portfolio+1}",
		subtitle:"subtitle #{portfolio+1}",
		body:"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
		main_image: "http://via.placeholder.com/600x400",
		thumb_image: "http://via.placeholder.com/350x200"
	)
end
puts "9 portfolio created"