class RelationshipsController < SignedInController
  private
  
  def permitted_params
    params.permit(:relationship => [:relation_type, :contact_id])
  end  
end
