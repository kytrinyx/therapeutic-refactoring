module Codejunk

  def extract(response)
    if (200..299).include?(response.code.to_i)
      response.body if response
    end
  end

end
