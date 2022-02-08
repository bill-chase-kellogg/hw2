class Person < ApplicationRecord

    def roles
        Role.where({person_id: read_attribute(:id)})
    end

end
