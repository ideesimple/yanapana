#Back end tab de artistas
Deface::Override.new(:virtual_path => "spree/layouts/admin",
                                   :name => "add_artists_tab",
                                   :insert_bottom => "[data-hook='admin_tabs']",
                                   :text => "<%= tab(:artists, :label => 'Artists') %>",
                                   :disabled => false)
#tab de organizaciones
Deface::Override.new(:virtual_path => "spree/layouts/admin",
                                   :name => "add_organizations_tab",
                                   :insert_bottom => "[data-hook='admin_tabs']",
                                   :text => "<%= tab(:organizations, :label => 'Organizations') %>",
                                   :disabled => false)
#tab de causas
Deface::Override.new(:virtual_path => "spree/layouts/admin",
                                   :name => "add_causes_tab",
                                   :insert_bottom => "[data-hook='admin_tabs']",
                                   :text => "<%= tab(:causes, :label => 'Causes') %>",
                                   :disabled => false)
