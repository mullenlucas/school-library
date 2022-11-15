require 'json'

class UserInput
  def self.save_people(people)
    people_json = []
    people.each do |person|
      person = if person.class.to_s == 'Teacher'
        {
          id: person.id.to_s,
          class: person.class.to_s,
          name: person.name,
          age: person.age,
          specialization: person.specialization,
          parent_permission: person.parent_permission.to_s
        }
      else
        {
          id: person.id.to_s,
          class: person.class.to_s,
          name: person.name,
          age: person.age,
          classroom: person.classroom,
          parent_permission: person.parent_permission.to_s
        }
      end
      people_json << person
      File.write('./data/people.json', JSON.pretty_generate(people_json, { indent: "\t", object_nl: "\n" }))
    end
  end

end