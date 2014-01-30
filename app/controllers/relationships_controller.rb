class RelationshipsController < SignedInController  
  nested_belongs_to :user

  def index    
    @relationships = Relationship.where(user_id: current_user).decorate.group_by(&:relation_type)
  end

  def new
  end

  def create
    email = params[:user][:email] if params[:user]

    if email.nil? || email.blank?
      flash[:error] = t('error.email-address-not-found', user_email: email)
    else      
      user = User.where(email: email).first
      if user
        Relationship.create!(user_id: current_user.id, contact_id: user.id)        
        flash[:notice] = t('event.success-add-user', user_name: user.decorate.fullname_or_email)
      else
        flash[:error] = t('error.email-address-not-found', user_email: email)
      end
    end
    
    redirect_to action: 'index'
  end

  private
  
  def permitted_params
    params.permit(:relationship => [:email])
  end  
end
