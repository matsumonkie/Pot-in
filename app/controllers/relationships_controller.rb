class RelationshipsController < SignedInController
  expose(:user)
  expose(:relationship)
  expose(:grouped_relationships) {
    Relationship.where(user_id: current_user).decorate.group_by(&:relation_type)
  }
  
  #def index    
    #@amounts = @relationships.each do |relationship|
    #  amount_registered_by_user = Payment.where(user_id: current_user.id, contact_id: relationship.contact_id).map(&:amount).sum
    #  amount_registered_by_contact = Payment.where(user_id: relationship.contact_id, contact_id: current_user.id).map(&:amount).sum
    #  amount_registered_by_user + amount_registered_by_contact      
    #end
  #end

  def create
    email = params[:user][:email] if params[:user]

    unless email.nil? or email.blank?    
      user = User.where(email: email).first
      if user
        Relationship.create!(user_id: current_user.id, contact_id: user.id)        
        flash_notice t('event.success-add-user',
                       user_name: user.decorate.fullname_or_email)
      end
    end    
    flash_error t('error.email-address-not-found', user_email: email) unless flash[:notice]
    
    redirect_to action: 'index'
  end

  def destroy
    relationship.destroy
    redirect_to action: :index
  end

  private
  
  def permitted_params
    params.permit(:relationship => [:email])
  end  
end
