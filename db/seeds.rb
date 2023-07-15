require "open-uri"

puts 'Drop db... '

unless Home.first.nil?
  Home.first.try(:primary_photo).purge
  Home.first.try(:secondary_photo).purge
  Home.destroy_all
  Category.all.each { |category| category.photo.purge }
  Massage.all.each { |massage| massage.photo.purge }
  Category.destroy_all
end

User.destroy_all

puts 'Creating db...'
User.create!(email: "admin@gmail.com", password: "123456")

home = Home.new(
  title: "Qui suis-je en quelques mots ?",
  description: "Forem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maeptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus. ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.",
)

file1 = URI.open("https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=928&q=80")
file2 = URI.open("https://images.unsplash.com/photo-1600334129128-685c5582fd35?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80")
home.primary_photo.attach(io: file1, filename: "home1.png", content_type: "image/png")
home.secondary_photo.attach(io: file2, filename: "home2.png", content_type: "image/png")

home.save!
puts "Home created"

2.times do |i|
  file = URI.open("https://images.unsplash.com/photo-1515377905703-c4788e51af15?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80")
  category = Category.new(
    title: "Soins du corps#{i}",
    page: 'massages'
  )
  category.photo.attach(io: file, filename: "category#{i}.png", content_type: 'image/png')
  category.save!

  puts "Category created"
  3.times do |x|
    file = URI.open("https://images.unsplash.com/photo-1515377905703-c4788e51af15?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80")
    massage = Massage.new(
      title: "California #{x}",
      subtitle: "Profiter du moment",
      duration: 30,
      price: 45,
      brief_description: "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte.",
      large_description: "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker",
      category: category
    )
    massage.photo.attach(io: file, filename: "massage#{x}.png", content_type: 'image/png')
    massage.save!
    puts "Massage created"
  end
end

puts 'Done ✨'
