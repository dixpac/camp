module MessageScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_message
  end

  private
    def set_message
      @message = @bucket.recordings.find(params[:recording_id])
    end
end
