module LayoutHelper
  def bootstrap_version
    # Choose the Bootstrap version you would like to use from the CDN
    "3.3.7"
  end

  def bootstrap_css_url
    "//netdna.bootstrapcdn.com/bootstrap/#{bootstrap_version}/css/bootstrap.min.css"
  end

  def bootstrap_js_url
    "//netdna.bootstrapcdn.com/bootstrap/#{bootstrap_version}/js/bootstrap.min.js"
  end
end
