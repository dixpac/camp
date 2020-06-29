class MessagesController < ApplicationController
  include BucketScoped
  include SetRecordable

  def index
    @messages = @bucket.messages
  end

  def show
    @comments = @recording.children.comments
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @recording = @bucket.record new_message

    respond_to do |format|
      format.html { redirect_to bucket_message_url(@bucket, @recording), notice: 'Message was successfully created.' }
    end
  end

  def update
    @recording.update! recordable: new_message

    respond_to do |format|
      format.html { redirect_to bucket_message_url(@bucket, @recording), notice: 'Message was successfully updated.' }
    end
  end

  private
    def new_message
      Message.new params.require(:message).permit(:subject, :content)
    end
end
