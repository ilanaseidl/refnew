ActiveAdmin.register_page "Dashboard" do

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    @users = User.all
    @referrals = Referral.all
    table do
      thead do
        tr do
          %w[ID Email Counter ReferredBy].each &method(:th)
        end
      end
      tbody do
        @users.each do |user|
          tr do
            td do
              user.id
            end
            td do
              user.email
            end
            td do
              user.counter
            end
            td do
              @referral = Referral.find_by(referred: user.id)
              if @referral
                  User.find(@referral.referrer).email
              else
                "none"
              end
            end
          end
        end
      end
    end
  end
end

  # https://gorails.com/episodes/using-activeadmin-to-build-an-admin-ui