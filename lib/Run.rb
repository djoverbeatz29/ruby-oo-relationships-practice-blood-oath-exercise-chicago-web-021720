require_relative './Cult.rb'
require_relative './BloodOath.rb'
require_relative './Follower.rb'

manson_family = Cult.new(name: "Manson Family", location: "California", founding_year: 1968, slogan: "Hello Miss Tate!", min_age: 20)
manson_family.recruit_follower(Follower.new(name: "Susan Atkins", age: 22, life_motto: "Acid is God!"))
p manson_family

davidians = Cult.new(name: "Branch Davidians", location: "Waco", founding_year: 1988, slogan: "Age of Consent: Double Digits!")

jim_jones = Cult.new(name: "Peoples Temple", location: "Guyana", founding_year: 1955, slogan: "C'mon, just drink it! Ohhh yeahhh!", min_age: 8)

tex_watson = Follower.new(name: "Tex Watson", age: 23, life_motto: "Peace and love, man!")
p tex_watson

bo_tex_manson = BloodOath.new(cult: manson_family, follower: tex_watson, date: "1969-06-09")
p bo_tex_manson

tex_watson.join_cult(davidians)
jim_jones.recruit_follower(tex_watson)
p tex_watson

p Cult.find_by_founding_year(1968)
p Cult.find_by_founding_year(1969)
p Cult.all

p Follower.all

p BloodOath.all
p BloodOath.first_oath

liz = Follower.new(name: "Elizabeth Smart", age: 15, life_motto: "Y'all are like my second family!")
liz.join_cult(davidians)
liz.join_cult(jim_jones)
liz.join_cult(manson_family)

p manson_family.average_age
p davidians.average_age
p manson_family.my_followers_mottos
p manson_family.cult_population

p Follower.most_active

p liz.fellow_cult_members

p Follower.top_n(2)