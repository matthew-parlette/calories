class EntriesController < InheritedResources::Base

  private

    def entry_params
      params.require(:entry).permit(:plan_id, :food_id, :quantity, :default, :hidden)
    end

end
