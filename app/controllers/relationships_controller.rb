class RelationshipsController < SignedInController  
  nested_belongs_to :user

  def index
    raw_relationships = Relationship.where(user_id: current_user)    
    @relationships = raw_relationships.group_by(&:relation_type)    
  end
  
  def create
    email = params[:email]
    unless email.blank?
      user = User.where(email: email).first
      if user
        flash[:notice] = t('event.success-add-user', user_name: user.decorate.formatted_name)
      else
        flash[:error] = t('event.error-add-user', user_email: email)
      end

      redirect_to action: 'index'
    else
      create!
    end
  end

  private
  
  def permitted_params
    params.permit(:relationship => [:relation_type, :contact_id, :email])
  end  
end
