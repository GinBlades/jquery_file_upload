class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]

  def index
    @uploads = Upload.all
  end

  def show
  end

  def new
    @upload = Upload.new
  end

  def edit
  end

  def create
    @upload = Upload.new(params_for_file_upload)

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render json: {files: [@upload.to_jq_upload]}, status: :created, location: @upload }
        # format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_upload
      @upload = Upload.find(params[:id])
    end

    def upload_params
      params.require(:upload).permit(thing: [])
    end

    def params_for_file_upload
      new_params = upload_params
      new_params[:thing] = upload_params[:thing][0]
      new_params
    end
end
