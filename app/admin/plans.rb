ActiveAdmin.register Plan do
  permit_params :name, :calories,
    entries_attributes: [:id, :plan_id, :food_id, :default, :hidden, :_destroy]
  action_item only: [:show] do
    @plan = Plan.find(params[:id])
    link_to '+ Food Entry', new_admin_plan_entry_path(@plan) #, method: :put
  end
  show do
    table_for plan do
      column :name
      column :calories
    end
    panel "Entries" do
      table_for plan.entries do |entry|
        column :food
        column :quantity
        column :default
        column :hidden
        column("Edit") { |entry| link_to "Edit", edit_admin_plan_entry_path(plan, entry) }
      end
    end
  end
end
