ActiveAdmin.register Referral do
  def index
    @user = User.all
    @referral = Referral.all
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :referrer, :referred, :referredby_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:referrer, :referred, :referredby_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
