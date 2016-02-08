class Politician
  attr_accessor :politician_name, :party

  def initialize (politician_name, party)
    @politician_name = politician_name
    @party = party
  end
end

class Voter
  attr_accessor :voter_name, :political_affiliation

  def initialize (voter_name, political_affiliation)
    @voter_name = voter_name
    @political_affiliation = political_affiliation
  end
end

class Votersim

  def initialize
    @directory = []
    prompt_user_for_initial_choices
  end

  def prompt_user_for_initial_choices
    puts "Welcome to my Votersim what would you like to do?"
    puts "(c)reate (l)ist (d)elete, (u)pdate"

    @input = gets.chomp.downcase

    if @input == "c"
      create
    elsif @input == "l"
      list
    elsif @input == "d"
      delete
    elsif @input == "u"
      update
    else
      prompt_user_for_initial_choices
    end
  end

  def create
    puts "Which would you like to create?"
    puts "(p)olitician (v)oter"

    @input = gets.chomp.downcase

    case @input

    when "p"
      create_politician
    when "v"
      create_voter
    else
      create
    end
  end

# CREATE POLITICIAN NAME
  def create_politician
    puts "Please type name of politician."

    politician_name = gets.chomp.downcase

    politician_party(politician_name.split.map(&:capitalize)*' ')
  end

# ASSIGN POLITICIAN PARTY
  def politician_party(politician_name)
    puts "Which party does #{politician_name} belong to?"
    puts "(d)emocrat (r)epublican"

   @politicians_list = []

    politician_party = gets.chomp.downcase

    case politician_party

    when "d"
      @politician = Politician.new(politician_name, politician_party)
      @politicians_list << @politician

    when "r"
      @politician = Politician.new(politician_name, politician_party)
      @politicians_list << @politician

    else
      politician_party(politician_name)
    end
    prompt_user_for_initial_choices
  end

# CREATE VOTER NAME
  def create_voter
    puts "Please type name of voter."

    voter_name = gets.chomp.downcase

    political_affiliation(voter_name.split.map(&:capitalize)*' ')
  end

# ASSIGN VOTER'S POLITICAL AFFILIATION
  def political_affiliation(voter_name)
    puts "Which party does #{voter_name} belong to? Type letter in parenthesis."
    puts "(l)iberal (c)onservative (t)ea party (s)ocialist (n)eutral"

    @voters_list = []

    political_affiliation = gets.chomp.downcase

    case political_affiliation

    when "l"
      @voter = Voter.new(voter_name, political_affiliation)
      @voters_list << @voter

    when "c"
      @voter = Voter.new(voter_name, political_affiliation)
      @voters_list << @voter

    when "t"
      @voter = Voter.new(voter_name, political_affiliation)
      @voters_list << @voter

    when "s"
      @voter = Voter.new(voter_name, political_affiliation)
      @voters_list << @voter

    when "n"
      @voter = Voter.new(voter_name, political_affiliation)
      @voters_list << @voter

    else
      political_affiliation(voter_name)
    end
    prompt_user_for_initial_choices
  end

# LIST FEATURE OPTIONS
  def list
    puts "Which list would you like to see?"
    puts "(p)oliticians list (v)oters list (a)ll entries (m)ain menu"

    @input = gets.chomp.downcase

    case @input
    when "p"
      list_politician
    when "v"
      list_voter
    when "a"
      list_everyone
    when "m"
      prompt_user_for_initial_choices
    else
      list
    end
  end

# LIST POLITICIAN
  def list_politician
    @politicians_list
    prompt_user_for_initial_choices
  end

# LIST VOTER
  def list_voter
    @voters_list
    prompt_user_for_initial_choices
  end

# LIST EVERYONE
  def list_everyone
    @voters_list + @politicians_list
    prompt_user_for_initial_choices
  end

# DELETE FEATURE
  def delete
    coming_soon_message
  end

# UPDATE FEATURE
  def update
    coming_soon_message
  end

# COMING SOON MESSAGE
  def coming_soon_message
    puts "Feature coming soon!"
    puts "Return to main? (y)es (e)xit Votersim"

    @input = gets.chomp.downcase

    case @input
    when "y"
      prompt_user_for_initial_choices
    when "e"
    exit
    else
      coming_soon_message
    end
  end
end


Votersim.new
