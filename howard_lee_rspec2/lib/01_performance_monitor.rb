

def measure(n = 1,&prc)
  #total_time = 0  
  start_time = Time.now
  n.times {prc.call}
  finish_time = Time.now
  total_time = finish_time - start_time
  total_time / n
end