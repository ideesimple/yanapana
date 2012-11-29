Deface::Override.new(:virtual_path => "spree/layouts/admin",
                                   :name => "add_artists_tab",
                                   :insert_bottom => "[data-hook='admin_tabs']",
                                   :text => "<%= tab(:artists, :label => 'Artists') %>",
                                   :disabled => false)
