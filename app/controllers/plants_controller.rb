class PlantsController < ApplicationController
    def index
        plants = Plant.all
        render json: plants
      end
    
      # POST /birds
      def create
        # bird = Bird.create(params.permit(:name, :species))
        plant = Plant.create(plant_params)
        render json: plant, status: :created
      end
    
      # GET /birds/:id
      def show
        plant = Plant.find_by(id: params[:id])
        if plant
          render json: plant
        else
          render json: { error: "Plant not found" }, status: :not_found
        end
      end
    
      private
      # all methods below here are private
    
      def plant_params
        params.permit(:name, :image, :price)
      end

end
