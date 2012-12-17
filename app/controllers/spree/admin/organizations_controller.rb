class Spree::Admin::OrganizationsController < Spree::Admin::ResourceController

  def create
    @organization = Spree::Organization.new(params[:organization])

    respond_to do |format|
      if @organization.save
        format.html { redirect_to admin_organization_url(@organization), notice: 'Package was successfully created.' }
        format.json { render json: @organization, status: :created, location: @organization }
      else
        format.html { render action: "new" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

end
