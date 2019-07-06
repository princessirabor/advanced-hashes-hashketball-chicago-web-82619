# Write your code here!

def game_hash
game_hash= { :home => {
                         :team_name => "Brooklyn Nets",
                         :colors => ["Black", "White"],
                         :players =>[{:player_name => "Alan Anderson" , :number => 0 ,:shoe=> 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
                            {:player_name => "Reggie Evans" , :number => 30 ,:shoe=> 14, :points =>12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
                            {:player_name => "Brook Lopez" , :number => 11 ,:shoe=> 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
                            {:player_name => "Mason Plumlee" , :number => 1 ,:shoe=> 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
                            {:player_name => "Jason Terry" , :number => 31 ,:shoe=> 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
                           ]
  
                      },
             :away => {
                         :team_name => "Charlotte Hornets",
                         :colors => ["Turquoise", "Purple"],
                         :players => [{:player_name => "Jeff Adrien" , :number => 4 ,:shoe=> 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
                            {:player_name => "Bismack Biyombo" , :number => 0 ,:shoe=> 16, :points => 12, :rebounds =>4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},
                            {:player_name => "DeSagna Diop" , :number => 2 ,:shoe=> 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
                            {:player_name => "Ben Gordon" , :number => 8 ,:shoe=> 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
                            {:player_name => "Kemba Walker" , :number => 33 ,:shoe=> 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}
                           ]
  
               
             }

}
game_hash
end

def num_points_scored(playername1)
 key1=""
 key2 =""
 index = 0
 temp ={}
 pointresult = 0
 game_hash.each do |(key_homeaway,value_tcplayers_hash)|
     key1 =key_homeaway
     value_tcplayers_hash.each do |(key_tcplayers, value_sarray)|
       key2 = key_tcplayers
       if key_tcplayers == :players
         value_sarray.length.times do |index_hash|
           index = index_hash
          value_sarray[index_hash].each do |(key_stats,value_stats)|
             temp = value_sarray[index]
             if value_sarray[index_hash][:player_name] == playername1
               pointresult = temp[:points]
             end
            end 
         end
       end
     end
 end
 pointresult
end

def shoe_size(playername)
 
 shoeresult = 0
 game_hash.each do |(key_homeaway,value_tcplayers_hash)|
     value_tcplayers_hash.each do |(key_tcplayers, value_sarray)|
       if key_tcplayers == :players
         value_sarray.length.times do |index_hash|
          value_sarray[index_hash].each do |(key_stats,value_stats)|
             if value_sarray[index_hash][:player_name] == playername
               shoeresult = value_sarray[index_hash][:shoe]
             end
            end 
         end
       end
     end
 end
 shoeresult
end

def team_colors(teamname)
  colors =[]
  game_hash.each do |(key,value)|
    value.each do |(key2,value2)|
      if value[key2] == teamname
        colors = value[:colors]
      end
    end
  end
  colors
end

def team_names
  team_name_array = []
  game_hash.each do |(key,value)|
    value.each do |(key2,value2)|
      if key2 == :team_name 
        team_name_array.push(value[key2])
      end 
    end
  end
  team_name_array
end

def player_numbers(teamname)
  playernumbers = []
  game_hash.each do |(key_homeaway,value_tcplayers_hash)|
    value_tcplayers_hash.each do |(key_tcplayers, value_sarray)|
      if value_tcplayers_hash[key_tcplayers] == teamname
        value_tcplayers_hash[:players].length.times do |index|
          value_tcplayers_hash[:players][index].each do |(keystats,valstats)|
            if keystats == :number
             playernumbers.push(value_tcplayers_hash[:players][index][keystats])
            end
          end
        end
      end
    end
  end
  playernumbers
end

def player_stats(playername)
  resultHash ={}
  game_hash.each do |(key,value)|
    value.each do |(key2, value2)|
      if key2 == :players
        value2.length.times do |index|
          value2[index].each do |(key3,val3)|
            if value2[index][key3] == playername
              resultHash = value2[index]
            end
          end
        end
      end
    end
  end
  resultHash.delete(:player_name)
  resultHash
end

def big_shoe_rebounds
  max = -1
  rebound = 0
  game_hash.each do |(key,value)|
    value.each do |(key2,val2)|
      if key2 == :players
        val2.length.times do |index|
          val2[index].each do |(key3,val3)|
            if key3 == :shoe

              if val3 > max
                max = val3
                rebound = val2[index][:rebounds]
              end
            end
          end
        end
      end
    end
  end
  rebound
end

def most_points_scored
  max = -1
  playername = ""
  game_hash.each do |(key,value)|
    value.each do |(key2,val2)|
      if key2 == :players
        val2.length.times do |index|
          val2[index].each do |(key3,val3)|
            if key3 == :points

              if val3 > max
                max = val3
                playername = val2[index][:player_name]
              end
            end
          end
        end
      end
    end
  end
  playername
end
