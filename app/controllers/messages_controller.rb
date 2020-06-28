class MessagesController < ApplicationController
  include BucketScoped
  include SetRecordable

  # GET /messages
  # GET /messages.json
  def index
    @messages = @bucket.messages
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @comments = @recording.children.comments
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @recording = @bucket.record new_message

    respond_to do |format|
      format.html { redirect_to bucket_message_url(@bucket, @recording), notice: 'Message was successfully created.' }
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    @recording.update! recordable: new_message

    respond_to do |format|
      format.html { redirect_to bucket_message_url(@bucket, @recording), notice: 'Message was successfully updated.' }
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def new_message
      Message.new params.require(:message).permit(:subject, :content)
    end
end
