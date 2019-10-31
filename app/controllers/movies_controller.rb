class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]

  # GET /movies
  def index
    @movies = Movie.all
    # puts @movies.preload(:reservations).as_json
    puts @movies.as_json
    # render json: @movies.preload(:reservations)
    # puts @movies.preload(:reservations).to_json
    # render json: @movies.each do |m|
    #   m.(include: :reservations).to_json
    #   puts m
    # end

  #  puts @movies.methods
    #s puts reservas
    reservas_peliculas = @movies.each do | m |
      m.as_json
      puts m.reservations.as_json
    end
    
    render json: reservas_peliculas
    
    # @movies.map do | m |
    #   m.as_json
    #   puts m.reservations
    # end

  end



  def mostrar_reservas
    @connection = ActiveRecord::Base.connection

    nombre_array = []
  
      resultado = @connection.exec_query("SELECT * FROM reservations INNER JOIN movies ON reservations.movie_id = movies.id")
   
      resultado.each do |row|
        puts row
        nombre_array << row                        
      end

      msg = {:code =>"200", :datos => nombre_array}
      render json: msg # don't do msg.to_json
      
        # respond_to? do |format|
        #       msg = {:code =>"200", :datos => nombre_array}
        #       format.json  { render :json => msg } # don't do msg.to_json
        # end
  
  end

  


  # GET /movies/1
  def show
    render json: @movie
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def movie_params
      params.require(:movie).permit(:nombre, :descripcion, :img_url, :dias_presentacion, reservations: [])
    end
end
