class RecommendController < BaseController
  def choice
  end

  def imagine
    redirect_to confirm_recommend_url
  end

  def random
    redirect_to confirm_recommend_url
  end

  def imageine_json
    render :json => Product.lot_planning
  end

  def confirm
  end
end