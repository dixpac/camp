class CommentsController < ApplicationController
  include BucketScoped
  include MessageScoped
  include SetRecordable

  def create
    @recording = @bucket.record new_comment, parent: @message

    respond_to do |format|
      format.html { redirect_to bucket_message_url(@bucket, @message) }
    end
  end

  private
    def new_comment
      Comment.new params.require(:comment).permit(:content)
    end
end
