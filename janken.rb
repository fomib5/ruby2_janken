def janken
  puts "じゃんけん..."
  puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"

  select_hand = gets
  if(select_hand=~ /^[0-9]+$/)
    select_hand = select_hand.to_i
  else
    select_hand = 4
  end
  opponent_hand = rand(3)

  if(select_hand.between?(0,2)==true)
    puts "ポイ！"
    puts "************************"
  end
  return select_hand,opponent_hand
end

def hand(select_hand,opponent_hand)
  case select_hand
    when 0
      case opponent_hand
        when 0
          puts "あなた：グーを出しました"
          puts "相手：グーを出しました"
          puts "************************"
          hand_winer = 2
        when 1
          puts "あなた：グーを出しました"
          puts "相手：チョキを出しました"
          puts "************************"
          hand_winer = 0
        when 2
          puts "あなた：グーを出しました"
          puts "相手：パーを出しました"
          puts "************************"
          hand_winer = 1
      end
    when 1
      case opponent_hand
        when 0
          puts "あなた：チョキを出しました"
          puts "相手：グーを出しました"
          puts "************************"
          hand_winer = 1
        when 1
          puts "あなた：チョキを出しました"
          puts "相手：チョキを出しました"
          puts "************************"
          hand_winer = 2
        when 2
          puts "あなた：チョキを出しました"
          puts "相手：パーを出しました"
          puts "************************"
          hand_winer = 0
      end
    when 2
      case opponent_hand
        when 0
          puts "あなた：パーを出しました"
          puts "相手：グーを出しました"
          puts "************************"
          hand_winer = 0
        when 1
          puts "あなた：パーを出しました"
          puts "相手：チョキを出しました"
          puts "************************"
          hand_winer = 1
        when 2
          puts "あなた：パーを出しました"
          puts "相手：パーを出しました"
          puts "************************"
          hand_winer = 2
      end
    when 3
      puts "終了します"
      hand_winer = 3
    else
      puts "0-3を入力してください。"
      hand_winer = ""
  end
  return hand_winer
end

def aiko
  puts "あいこで.."
  puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"

  select_hand = gets
  if(select_hand=~ /^[0-9]+$/)
    select_hand = select_hand.to_i
  else
    select_hand = 4
  end
  opponent_hand = rand(3)

  if(select_hand.between?(0,2)==true)
    puts "ショ！"
    puts "************************"
  end
  return select_hand,opponent_hand
end

def attimuite
  puts "あっち向いて〜"
  puts "0(上) 1(下) 2(左) 3(右)"
  
  select_direction = -1
  while(select_direction.between?(0,3)==false)
    select_direction = gets
    if(select_direction =~ /^[0-9]+$/)
      select_direction = select_direction.to_i
    else
      puts "0-3を入力してください"
      select_direction = -1
    end
  end
  puts "ホイ！"
  puts "************************"
  
  opponent_direction = rand(4)

  return select_direction,opponent_direction

end

def pointing(select_direction,opponent_direction)
  match = 0
  case select_direction
    when 0
      case opponent_direction
        when 0
          puts "あなた：上"
          puts "相手：上"
          match = 1
        when 1
          puts "あなた：上"
          puts "相手：下"
        when 2
          puts "あなた：上"
          puts "相手：左"
        when 3
          puts "あなた：上"
          puts "相手：右"
      end
    when 1
      case opponent_direction
        when 0
          puts "あなた：下"
          puts "相手：上"
        when 1
          puts "あなた：下"
          puts "相手：下"
          match = 1
        when 2
          puts "あなた：下"
          puts "相手：左"
        when 3
          puts "あなた：下"
          puts "相手：右"
      end
    when 2
      case opponent_direction
        when 0
          puts "あなた：左"
          puts "相手：上"
        when 1
          puts "あなた：左"
          puts "相手：下"
        when 2
          puts "あなた：左"
          puts "相手：左"
          match = 1
        when 3
          puts "あなた：左"
          puts "相手：右"
      end
    when 3
      case opponent_direction
        when 0
          puts "あなた：右"
          puts "相手：上"
        when 1
          puts "あなた：右"
          puts "相手：下"
        when 2
          puts "あなた：右"
          puts "相手：左"
        when 3
          puts "あなた：右"
          puts "相手：右"
          match = 1
      end
    end

  return match
end



hand_winer = ""

until hand_winer == 3 #終了選択まで繰り返す
 
  if(hand_winer == "")
    select_hand,opponent_hand = janken
    hand_winer = hand(select_hand,opponent_hand)
  elsif(hand_winer == 0)
    select_direction,opponent_direction = attimuite
    match = pointing(select_direction,opponent_direction)
    if(match==1)
      puts "あなたの勝利です"
    end
    hand_winer = ""
  elsif(hand_winer == 1)
    select_direction,opponent_direction = attimuite
    match = pointing(select_direction,opponent_direction)
    if(match==1)
      puts "相手の勝利です"
    end
    hand_winer = ""
  elsif(hand_winer ==2)
    while(hand_winer == 2) #あいこの時、決着か終了選択まで繰り返す
      select_hand,opponent_hand = aiko
      hand_winer = hand(select_hand,opponent_hand)
      if(hand_winer==3) 
        break
      end
    end
  end
end
