require "open-uri"

puts 'Drop db...'

PagesContent.first.try(:home_primary_photo).purge
PagesContent.first.try(:home_secondary_photo).purge
PagesContent.destroy_all

puts 'Init pages content...'

home = PagesContent.new(
                    home_title: "Qui suis-je en quelques mots ?",
                    home_description: "Forem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maeptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus. ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.",
                )

puts 'Attaching photos...'

file1 = URI.open("https://images.unsplash.com/photo-1600334129128-685c5582fd35?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80")
file2 = URI.open("https://images.unsplash.com/photo-1515377905703-c4788e51af15?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80")
home.home_primary_photo.attach(io: file1, filename: "home1.png", content_type: "image/png")
home.home_secondary_photo.attach(io: file2, filename: "home2.png", content_type: "image/png")

puts 'Saving..'

home.save!

puts 'Done'
