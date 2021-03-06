class OrderController < BaseController
  def execute
    redirect_to result_order_url
  end

  def scan
    order_recipe = OrderRecipe.find_by(token: params[:token])
    order_attr = order_recipe.attributes
    order_attr[:products] = order_recipe.ingredients.includes(:product).map{|i| i.product.attributes }
    render :json => order_attr
  end

  def result_json
    order_recipe = OrderRecipe.find_by(token: cookies[:order_token])
    url = scan_order_url + "?token=" + order_recipe.token
    qrcode = RQRCode::QRCode.new(url)
    png = qrcode.as_png(
          resize_gte_to: false,
          resize_exactly_to: false,
          fill: 'white',
          color: 'black',
          size: 320,
          border_modules: 4,
          module_px_size: 6,
          file: nil # path to write
    )
    base64_image = Base64.strict_encode64(png.to_s)
    render :plain => "data:image/png;base64," + base64_image
  end

  def result
    order_recipe = OrderRecipe.find_by(token: cookies[:order_token])
    url = scan_order_url + "?token=" + order_recipe.token
    qrcode = RQRCode::QRCode.new(url)
    png = qrcode.as_png(
          resize_gte_to: false,
          resize_exactly_to: false,
          fill: 'white',
          color: 'black',
          size: 320,
          border_modules: 4,
          module_px_size: 6,
          file: nil # path to write
    )
    base64_image = Base64.strict_encode64(png.to_s)
    @image_data = "data:image/png;base64," + base64_image
  end
end
