class RelationshipsController < SignedInController
  nested_belongs_to :user

  def index
    raw_relationships = Relationship.where(user_id: current_user)    
    @relationships = raw_relationships.group_by(&:relation_type)    
  end

  private
  
  def permitted_params
    params.permit(:relationship => [:relation_type, :contact_id])
  end  
end
