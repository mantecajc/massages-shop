require "open-uri"
require 'rails_helper'

RSpec.describe 'Booking an item', type: :system do
  before do
    # let(:category) {
      category = Category.create(
        title: "Massages",
        page: "massages",
        # photo: "laksdfjñalsfj"
      )
    # }

    category.photo.attach(io: URI.open("https://images.unsplash.com/photo-1515377905703-c4788e51af15?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80"), filename: "category.png", content_type: 'image/png')
    category.save
    # let(:massage) {
    massage = Massage.create(
        title: "Soin Energétique + Massage adf",
        subtitle: "Soin Energétique + Massage",
        duration: 10,
        price: 20,
        category: category,
        brief_description:
        "Soin du corps entier. Gommage, exfoliant à base de pierre d’alun (minéral astringent, permet de resserrer les pores de la peau), il contribue à réactiver le renouvellement cellulaire naturel. Elimine les cellules mortes. Suivi d'un massage de votre choix.",
        large_description:
        "Massage du corps entier pendant 60 min, suivit d'un soin énergétique. Le but est de relancer la circulation énergétique au niveau du corps physique et des corps subtils (qui enveloppent le corps physique sur différents plans). Evacuation des énergies cristallisées au niveau des corps physiques et subtils, puis diffusion d’énergie permettant une harmonisation à tous les niveaux."
      )

      massage.photo.attach(io: URI.open("https://images.unsplash.com/photo-1515377905703-c4788e51af15?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80"), filename: "massage.png", content_type: 'image/png')
    # }
    massage.save


  end

  it 'user books a massage' do
    byebug
    visit massages_path
    # click_button
    # expect(page)


  end

  it 'user books an offer'
end
