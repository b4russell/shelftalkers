# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



talkers = [{:producer => "Adnams", :product => "Explorer", :blurb =>"Called Explorer because this traditional English brewery was inspired by travels breweries in the US where conventions are always being challenged. A light and refreshing blonde beer, with aromas of grapefruit and fruity bitterness on the palate from the WA state-sourced Columbus and Chinook hops. 5%"},
          {:producer => "Adnams", :product => "Southwold Bitter", :blurb =>"A classic bitter with a beautiful copper color; late and dry-hopped with Fuggles results in a lingering herbal hoppiness, dry with wonderful malt aromas."},
          {:producer => "Anchorage Brewing Co.", :product => "Galaxy White IPA", :blurb =>"Ale brewed with Galaxy hops, coriander, kumquats, and peppercorns. Fermented and aged in French oak foudres with a wit yeast. Dry hopped with Galaxy hops, bottle conditioned with brett and wine yeast. Drink fresh or age to bring out the funk."},
          {:producer => "Logsdon Farmhouse Ales", :product => "Seizoen Bretta", :blurb =>"The Brettanomyces yeast is added to create their Bretta version -- funkier & slightly sweeter variant of the Seizoen which, not surprisingly, is flying off the shelves. This beer is delicious now and we're definitely laying a bottle or two down to see how it develops with age! 8%"},
          {:producer => "Pretty Things", :product => "Baby Tree", :blurb =>"Pretty Things take on the best of Abbey-style brewing from Belgium. Inspired by monatstic and abbey quads, embellished with dark fruit flavors...not too sweet, not too heavy, 9%"},
          {:producer => "Pretty Things", :product => "Jack d", :blurb =>"A simple table beer, or 'Saison Americain' as the PT Project calls it, is the kind of beer to drink before, during and after a meal. Inspired by DuPont, De Ranke and De Dolle, Pretty Things makes American beer with Belgian roots. Palisade and Nugget hops give a bitter backbone, dry character, and citrusy and spicy notes without any actual citrus or spice added! 96 Rate Beer. 6.5%"},
          {:producer => "Upright Brewing", :product => "'Four'", :blurb =>"This excellent Oregon brewery specializes in farmhouse inspired beers rooted in France and Belgium, but made with a Pacific NW twist. Four is a wheat beer embodying the spirit of country-style ales. It's light but nuanced with floral and herbal aromas and flavors, capped by a dry and mildly tart finish. 95 Rate Beer. 4.5%"},
          {:producer => "Upright Brewing", :product => "'Five'", :blurb =>"This top shelf Oregon brewery makes 'Five' with several hop varieties & pale caramel malts to create a uniquely complex profile. Subtle pale fruit aromas created during the fermentation brighten the profile and bring the beer balance. Williamette, Liberty, and Perle hops. 97 Rate Beer. 5.5%"},
          {:producer => "Upright Brewing", :product => "'Six'", :blurb =>"Upright's Six is a rye beer displaying the great spicy notes the grain is known for along with a deep caramel core and delicate bubblegum note rooted in its open fermentation. Despite its dark color, the beer finishes dry and refreshing. 98 Rate Beer. 6.7%"},
          {:producer => "Upright Brewing", :product => "'Seven'", :blurb =>"Upright's Seven is the most Belgian-esque of the numbered beers, where the house yeast is fully expressed with a big fruitiness while the hops provide spicy and herbal elements. This has some heft mid-palate but finishes dry. 97 Rate Beer. 8%"},
          {:producer => "Stoke", :product => "Bohemian Ale", :blurb => "Everyone will enjoy the interaction of delicate wheat and lightly roasted barley with the lively citrus and pepper flavours. Fully rounded mouthfeel and engaging honeyed malt complexity and spicy. Classic Bohemian w/ Nelson Sauvin hops. 5.3%."}]

talkers.each do |talker|
  Talker.create!(talker)
end
