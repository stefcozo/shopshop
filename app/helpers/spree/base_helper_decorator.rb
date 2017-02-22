#Modulul asta raspunde de logotip, logotipul poate fi schimbat in config!

module Spree::BaseHelper
    def logo(image_path = Spree::Config[:logo], img_options: {})
      link_to image_tag(image_path, img_options), spree.root_path
    end
end

#Breadcrumbs
def taxon_breadcrumbs(taxon, separator = '&nbsp;&raquo;&nbsp;', breadcrumb_class = 'inline')
  return '' if current_page?('/') || taxon.nil?

  crumbs = [[Spree.t(:home), spree.root_path]]

  if taxon
    crumbs << [Spree.t(:products), products_path]
    crumbs += taxon.ancestors.collect { |a| [a.name, spree.nested_taxons_path(a.permalink)] } unless taxon.ancestors.empty?
    crumbs << [taxon.name, spree.nested_taxons_path(taxon.permalink)]
  else
    crumbs << [Spree.t(:products), products_path]
  end

  separator = raw(separator)

  items = crumbs.each_with_index.collect do |crumb, i|
    content_tag(:li, itemprop: 'itemListElement', itemscope: '', itemtype: 'https://schema.org/ListItem') do
      link_to(crumb.last, itemprop: 'item') do
        content_tag(:span, crumb.first, itemprop: 'name') + tag('meta', { itemprop: 'position', content: (i+1).to_s }, false, false)
      end + (crumb == crumbs.last ? '' : separator)
    end
  end

  content_tag(:nav, content_tag(:ol, raw(items.map(&:mb_chars).join), class: breadcrumb_class, itemscope: '', itemtype: 'https://schema.org/BreadcrumbList'), id: 'breadcrumbs', class: 'sixteen columns')
end


#Sidebar
def sidebar_tree(root_taxon, current_taxon, max_level = 1)
      return '' if max_level < 1 || root_taxon.children.empty?
      content_tag :li, class:'hidden' do
        taxons = root_taxon.children.map do |taxon|
          css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'active' : nil
          content_tag :li, class: css_class do
           link_to(taxon.name, seo_url(taxon)) +
             sidebar_tree(taxon, current_taxon, max_level - 1)
          end
        end
        safe_join(taxons, "\n")
      end
end