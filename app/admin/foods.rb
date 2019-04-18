ActiveAdmin.register Food do
  permit_params :name, :unit_of_measure, :calories, :carbohydrates, :protein, :fat
  action_item only: [:edit, :show] do
    link_to '+ New Food', new_admin_food_path()
  end
end
