ActiveAdmin.register Entry do
  # controller do
  #   nested_belongs_to :plan
  # end
  # belongs_to :plan
  # belongs_to :food
  belongs_to :plan
  navigation_menu :plan
  permit_params :plan_id, :food_id, :quantity, :default, :hidden
  action_item only: [:edit, :show] do
    @entry = Entry.find(params[:id])
    @plan = Plan.find(@entry.plan_id)
    link_to "+ Entry in #{@plan.name}", new_admin_plan_entry_path(@plan)
  end
end
