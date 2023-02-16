class ArtworkSharesController < ApplicationController

  def create
    @artworkshare = ArtworkShare.new(share_params)
    if @artworkshare.save
      render json: @artworkshare, status: :created
    else
      render json: @artworkshare.errors.full_messages, status: 422
    end
  end

  def destroy
    @artworkshare = ArtworkShare.find(params[:id])
    if @artworkshare.destroy
      render json: "ARTWORK SHARE DESTROYED!!! YEAHH"
    else
      render json: @artworkshare.errors.full_messages, status: 422
    end
  end


  private
  def share_params
    params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
  end

end