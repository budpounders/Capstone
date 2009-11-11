module GamesHelper
  def form_index
    @f_i||=0
    @f_i+=1
  end
  
  def get_form_index
    @f_i
  end
end
