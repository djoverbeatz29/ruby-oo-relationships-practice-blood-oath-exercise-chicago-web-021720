require_relative '../lib/BloodOath.rb'
require_relative '../lib/Cult.rb'
require_relative '../lib/Follower.rb'

describe Cult do
    let(:manson_family){ Cult.new(name: "Manson Family", location: "California", founding_year: 1968, slogan: "Hello Miss Tate!", min_age: 20) }
    let(:davidians){ Cult.new(name: "Branch Davidians", location: "Waco", founding_year: 1988, slogan: "Age of Consent: Double Digits!") }
    let(:jim_jones) { Cult.new(name: "Peoples Temple", location: "Guyana", founding_year: 1955, slogan: "C'mon, just drink it! Ohhh yeahhh!", min_age: 8) }
    
    context 'instance methods' do
        it "creates three different cults, with relevant basic info" do
            expect(manson_family.name).to eq("Manson Family")
            expect(davidians.location).to eq("Waco")
            expect(jim_jones.founding_year).to eq(1955)
            expect(jim_jones.slogan).to eq("C'mon, just drink it! Ohhh yeahhh!")
            expect(davidians.min_age).to eq(10)
        end
 
        it "enables us to add age-appropriate followers to each cult" do
            susie = Follower.new(name: "Susan Atkins", age: 22, life_motto: "Acid is God!")
            expect{manson_family.recruit_follower(susie)}.to output("Welcome aboard, Susan Atkins!\n").to_stdout
            expect(manson_family.find_followers.include?(susie)).to be(true)
        end

        it "rejects wannabe underage cultists" do
            liz = Follower.new(name: "Elizabeth Smart", age: 15, life_motto: "Y'all are like my second family!")
            expect{manson_family.recruit_follower(liz)}.to output("We're sorry, Dear Elizabeth Smart, but you ain't old enough... yet! Until soon!\n").to_stdout
            expect(manson_family.find_followers.include?(liz)).to be(false)
        end

        it "returns the number of followers of a given cult" do
            tex_watson = Follower.new(name: "Tex Watson", age: 23, life_motto: "Peace and love, man!")
            jim_jones.recruit_follower(tex_watson)
            jim_jones.recruit_follower(liz)
            jim_jones.recruit_follower(sue)
            expect(jim_jones.)
        end

    end
end


# tex_watson = Follower.new(name: "Tex Watson", age: 23, life_motto: "Peace and love, man!")
# p tex_watson

# bo_tex_manson = BloodOath.new(cult: manson_family, follower: tex_watson, date: "1969-06-09")
# p bo_tex_manson

# tex_watson.join_cult(davidians)
# jim_jones.recruit_follower(tex_watson)
# p tex_watson

# p Cult.find_by_founding_year(1968)
# p Cult.find_by_founding_year(1969)
# p Cult.all

# p Follower.all

# p BloodOath.all
# p BloodOath.first_oath


# liz.join_cult(jim_jones)
# liz.join_cult(manson_family)

# p manson_family.average_age
# p davidians.average_age
# p manson_family.my_followers_mottos
# p manson_family.cult_population

# p Follower.most_active

# p liz.fellow_cult_members

# p Follower.top_n(2)