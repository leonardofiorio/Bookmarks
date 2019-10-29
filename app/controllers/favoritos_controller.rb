class FavoritosController < ApplicationController
  before_action :set_favorito, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /favoritos
  # GET /favoritos.json
  def index
    @favoritos = Favorito.where("usuario_id": current_usuario.id)
  end

  # GET /favoritos/1
  # GET /favoritos/1.json
  def show
  end

  # GET /favoritos/new
  def new
    @favorito = Favorito.new
  end

  # GET /favoritos/1/edit
  def edit
  end

  # POST /favoritos
  # POST /favoritos.json
  def create
    @favorito = Favorito.new

    @favorito.url = favorito_params['url'] 
    @favorito.comentario = favorito_params['comentario']
    @favorito.usuario = current_usuario.id

    respond_to do |format|
      if @favorito.save
        format.html { redirect_to @favorito, notice: 'Favorito was successfully created.' }
        format.json { render :show, status: :created, location: @favorito }
      else
        format.html { render :new }
        format.json { render json: @favorito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favoritos/1
  # PATCH/PUT /favoritos/1.json
  def update
    respond_to do |format|
      if @favorito.update(favorito_params)
        format.html { redirect_to @favorito, notice: 'Favorito was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorito }
      else
        format.html { render :edit }
        format.json { render json: @favorito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favoritos/1
  # DELETE /favoritos/1.json
  def destroy
    @favorito.destroy
    respond_to do |format|
      format.html { redirect_to favoritos_url, notice: 'Favorito was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorito
      @favorito = Favorito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorito_params
      params.require(:favorito).permit(:url, :comentario)
    end
end
