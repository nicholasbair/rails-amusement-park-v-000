class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if qualified?
      update_rider
    end

    build_message
  end

  private

    def qualified?
      attraction.tickets <= user.tickets && attraction.min_height <= user.height
    end

    def update_rider
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating

      user.save
    end

    def build_message
      sorry = "Sorry."
      height_fail = "You are not tall enough to ride the #{attraction.name}."
      ticket_fail = "You do not have enough tickets to ride the #{attraction.name}."

      if attraction.tickets > user.tickets && attraction.min_height > user.height
        "#{sorry} #{ticket_fail} #{height_fail}"
      elsif attraction.min_height > user.height
        "#{sorry} #{height_fail}"
      elsif attraction.tickets > user.tickets
        "#{sorry} #{ticket_fail}"
      else
        "Thanks for riding the #{attraction.name}!"
      end
    end

end
