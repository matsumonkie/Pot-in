class RelationshipsController < SignedInController
  nested_belongs_to :user

  private
  
  def permitted_params
    params.permit(:relationship => [:relation_type, :contact_id])
  end  
end
