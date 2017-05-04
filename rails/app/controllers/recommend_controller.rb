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
    order_recipe = OrderRecipe.create!(user_id: @current_user.id)
    cookies[:order_token] = order_recipe.token
    render :json => Product.lot_planning(order_recipe: order_recipe)
  end

  def confirm
  end
end