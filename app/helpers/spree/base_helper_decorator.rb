#Modulul asta raspunde de logotip, logotipul poate fi schimbat in config!

module Spree::BaseHelper
    def logo(image_path = Spree::Config[:logo], img_options: {})
      link_to image_tag(image_path, img_options), spree.root_path
    end
end