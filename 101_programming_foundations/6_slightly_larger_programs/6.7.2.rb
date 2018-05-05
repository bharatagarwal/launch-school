score = {
  'Player' => 0,
  'Computer' => 0
}

def reset_score(scr)
  scr['Player'] = 0
  scr['Computer'] = 0
end

def update_score(brd, scr)
  winner = detect_winner(brd)
  if winner
    scr[winner] += 1
  end
end

def five_wins_reached?(scr)
  if scr['Player'] == 5 || scr['Computer'] == 5
    true
  else
    false
  end
end

def overall_winner(scr)
  scr.key(5)
end

