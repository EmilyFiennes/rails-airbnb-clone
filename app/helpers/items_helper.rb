module ItemsHelper

  def average_stars(ratings)
    average_rating = (ratings.inject { |sum, el| sum + el }.round(0) / ratings.size)
    (('<i class="fa fa-star" aria-hidden="true"></i>' * average_rating) + ('<i class="fa fa-star-o" aria-hidden="true"></i>' * (5-average_rating))).html_safe
  end

  def star(rating)
    (('<i class="fa fa-star" aria-hidden="true"></i>' * rating) + ('<i class="fa fa-star-o" aria-hidden="true"></i>' * (5-rating))).html_safe
  end
end
