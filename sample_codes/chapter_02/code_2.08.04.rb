sprintf("%0.3f", 1.2) #=> "1.200"


"%0.3f" % 1.2 #=> "1.200"


sprintf("%0.3f + %0.3f", 1.2, 0.48) #=> "1.200 + 0.480"
"%0.3f + %0.3f" % [1.2, 0.48]       #=> "1.200 + 0.480"
