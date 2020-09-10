class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommended_exhibits = []
    @exhibits.each do |exhibit|
      patron.interests.select do |interest|
        if exhibit.name == interest
          recommended_exhibits << exhibit
        end
      end
    end
    recommended_exhibits
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    exhibits_with_patrons = {}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        recommend_exhibits(patron).each do |rec_exhibit|
          if rec_exhibit == exhibit
          # require 'pry';binding.pry
            if exhibits_with_patrons[exhibit]
              exhibits_with_patrons[exhibit] << patron
            else
              exhibits_with_patrons[exhibit] = [patron]
            end
          end
          if exhibits_with_patrons[exhibit].nil?
            exhibits_with_patrons[exhibit] =[]
          end 
        end
      end
    end
    exhibits_with_patrons
  end
end
